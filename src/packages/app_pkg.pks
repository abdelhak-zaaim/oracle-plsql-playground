create or replace package student_management as
    function get_student_name_by_id(s_id STUDENT.ID%type) return STUDENT.NAME%type;
    function get_student_by_id(s_id STUDENT.ID%type) return STUDENT%rowtype;
end;
/

create or replace package body student_management as
    function get_student_name_by_id(s_id STUDENT.ID%type) return STUDENT.NAME%type as
        s_name STUDENT.NAME%type;
    begin
        select name into s_name from STUDENT where ID = s_id;
        return s_name;

    exception
        when NO_DATA_FOUND then
            DBMS_OUTPUT.PUT_LINE('no student exist with this id = ' || s_id);
            raise;
    end get_student_name_by_id;

    function get_student_by_id(s_id STUDENT.ID%type) return STUDENT%rowtype as
        student_req STUDENT%rowtype;
    begin
        select * into student_req from STUDENT where ID = s_id;
    exception
        when NO_DATA_FOUND then
            DBMS_OUTPUT.PUT_LINE('no student exist with this id = ' || s_id);
            raise;

    end get_student_by_id;
end;
/

declare
    s_id STUDENT.ID%type := 2;
begin
    DBMS_OUTPUT.PUT_LINE('Student name : ' || student_management.get_student_name_by_id(s_id));
end;
