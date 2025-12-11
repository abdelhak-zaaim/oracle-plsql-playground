CREATE OR REPLACE PROCEDURE get_student_name(s_id IN NUMBER, s_name OUT VARCHAR2) IS
BEGIN
SELECT name INTO s_name
FROM student
WHERE id = s_id;
END;
/
