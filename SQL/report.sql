SELECT student.student_name, student.student_surname FROM student WHERE V_class_id = "1b";

SELECT student.student_name, student.student_surname FROM student INNER JOIN class ON student.V_class_id = class.class_id WHERE class.className = "1b"