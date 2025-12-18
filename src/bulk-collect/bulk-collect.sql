-- now lets use bulk collect technic to reduce context suitching

declare
    type list_of is table of student%rowtype;
    s_list list_of := list_of();
begin


    select * BULK COLLECT into s_list from STUDENT;

    for i in 1..s_list.COUNT
        loop
            DBMS_OUTPUT.PUT_LINE(s_list(i).EMAIL);
        end loop;
end;


declare
    TYPE table_s is table of student%rowtype index by pls_integer;
    s_list table_s;
begin

    select * bulk collect into s_list from STUDENT;

    for i in 1.. s_list.COUNT
        loop
            DBMS_OUTPUT.PUT_LINE(s_list(i).AGE);
        end loop;

    DBMS_OUTPUT.PUT_LINE('new ages - ---- --  -- -  -');

    forall i in 1..s_list.COUNT
        update STUDENT set age = age + 1 where ID = s_list(i).ID;


    select * bulk collect into s_list from STUDENT;

    for i in 1.. s_list.COUNT
        loop
            DBMS_OUTPUT.PUT_LINE(s_list(i).AGE);
        end loop;

end;


create or replace FUNCTION get_all_student(s_id NUMBER)
  RETURN STUDENT%rowtype PIPELINED
IS
BEGIN
    FOR r IN (SELECT * FROM STUDENT WHERE id > s_id) LOOP
            -- Complex transformation logic here (Java-like logic)
            r.AGE := r.AGE + 10;

            PIPE ROW(r); -- Emits row immediately. No memory bloat.
        END LOOP;
    RETURN;
END;

SELECT * FROM TABLE(get_all_student(1));