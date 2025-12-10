-- lets create an package specification

create or replace package student_management as
    procedure print_name(s_id STUDENT.ID%type);
end student_management;
/

create or replace package body student_management as
    procedure print_name(s_id STUDENT.ID%type) as
        s_name STUDENT.NAME%type;
    begin
        select name into s_name from STUDENT where id = s_id;
        DBMS_OUTPUT.PUT_LINE('the name of the student is: ' || s_name);
    end print_name;

end student_management;
/


-- now lets do a simple test

begin
    student_management.print_name(2);
end;


select * from STUDENT;