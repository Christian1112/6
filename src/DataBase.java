import java.sql.SQLException;

import java.sql.DriverManager;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.util.List;

import java.util.ArrayList;



public class DataBase {

    private Connection conn;

    private static final String teacherClassTable = "teacher";



    public DataBase() throws SQLException, ClassNotFoundException {



        Class.forName("org.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(

                "jdbc:mysql://localhost:3306/christiansimic_cr6" + "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",

                "root",

                "");

    }



    public void closeDb() throws SQLException {
        conn.close();
    }



    public List<Teacher> teacherList()  throws SQLException {



        String sql = "SELECT * FROM " + teacherClassTable;

        PreparedStatement pstmnt = conn.prepareStatement(sql);

        ResultSet rs = pstmnt.executeQuery();

        List<Teacher> list = new ArrayList<>();



        while (rs.next()) {

            int id = rs.getInt("teacherId");

            String email = rs.getString("teacherEmail");

            String name = rs.getString("teacherName");

            String surname = rs.getString("teacherSurname");

            list.add(new Teacher(id, name, surname, email));

        }

        pstmnt.close();

        return list;

    }


    public List<Class> classList(int i) throws SQLException {

        String sql = "SELECT class.class_id, class.className FROM class INNER JOIN teaching ON class.class_id = teaching.V_class_id WHERE teaching.V_teacher_id = ?";

        PreparedStatement pstmnt = conn.prepareStatement(sql);

        pstmnt.setInt(1, i);

        ResultSet rs = pstmnt.executeQuery();

        List<Class> listClasses = new ArrayList<>();



        while (rs.next()) {

            int id = rs.getInt("class_id");

            String name = rs.getString("className");

            listClasses.add(new Class(id, name));

        }

        pstmnt.close();

        return listClasses;

    }

}