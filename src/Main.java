import javafx.application.Application;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.control.*;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

    public class Main extends Application {


        private ListView<Teacher> teacherListView;
        private TextField TeacherID;
        private ListView<Class> classListView;
        private TextField TeacherEmail;
        private ObservableList<Teacher> data;
        private TextField TeacherName;
        private ObservableList<Class> dataClasses;
        private TextField TeacherSurname;


    public static void main(String[] args) {
        launch(args);
    }

        @Override

        public void start(Stage primaryStage) {

            primaryStage.setTitle("School Statistics of Teachers");


            Label label1 = new Label("Teachers");

            teacherListView = new ListView<>();

            teacherListView.setPrefHeight(150);

            teacherListView.getSelectionModel().selectedIndexProperty().addListener(

                    new ListSelectChangeListenerTeacher());

            data = getDbDataTeachers();

            teacherListView.setItems(data);

            VBox vBoxList = new VBox(label1, teacherListView);

            vBoxList.setSpacing(10);

            vBoxList.setPadding(new Insets(25, 25, 25, 25));



            Label label2 = new Label("this teacher");

            Label label3 = new Label("ID");

            teacherID = new TextField();

            HBox hBox2 = new HBox(label3, teacherID);

            hBox2.setPadding(new Insets(20,0,0,0));

            hBox2.setSpacing(50);



            Label label3 = new Label("Name");

            teacherName = new TextField();

            HBox hBox3 = new HBox(label3, teacherName);

            hBox3.setPadding(new Insets(20,0,0,0));

            hBox3.setSpacing(35);



            Label label4 = new Label("surname");

            teacherSurname = new TextField();

            HBox hBox4 = new HBox(label4, teacherSurname);

            hBox4.setPadding(new Insets(20,0,0,0));

            hBox4.setSpacing(25);




        }