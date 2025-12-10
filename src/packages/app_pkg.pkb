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


DECLARE
    lines dbms_output.chararr;
    num_lines number;
BEGIN
    -- enable the buffer with default size 20000
    --dbms_output.enable;

    dbms_output.put_line('Hello Reader!');
    dbms_output.put_line('Hope you have enjoyed the tutorials!');
    dbms_output.put_line('Have a great time exploring pl/sql!');

    num_lines := 3;

    --dbms_output.get_lines(lines, num_lines);

    FOR i IN 1..num_lines LOOP
            dbms_output.put_line('lines(i)');
        END LOOP;
END;
/