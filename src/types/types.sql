declare
    p_date date := TO_DATE('2002-01-09', 'yyyy-mm-dd');
    age    number;
begin

    age := TO_NUMBER('23');

    DBMS_OUTPUT.PUT_LINE(TO_CHAR(p_date, 'dd-mm-yyyy') || ' age : ' || age);
end;
/


declare
    age      number := 12;
    category varchar2(50);
begin

    category := case
                    when age < 18 then 'Minor'
                    when age < 40 then 'Adult'
                    when age < 60 then 'Big Adult'
                    else 'Vey big'
        end;
    DBMS_OUTPUT.PUT_LINE(category);

end;
/

DECLARE
    v_numbers SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST();
BEGIN
    v_numbers.EXTEND;
    v_numbers(1) := 100;
END;
/


DECLARE
    Cursor c_student is select *
                        from student
                        where age < 25 for update ;
    TYPE s_list is table of student%rowtype index by pls_integer;
    students_t s_list;
    nbr        number := 1;
BEGIN
    execute immediate 'select * from STUDENT where id = :id' bulk collect into students_t using nbr;

    for st in 1 .. students_t.COUNT
        loop
            DBMS_OUTPUT.PUT_LINE(students_t(st).NAME);
        end loop;

    for i in c_student
        loop
            update STUDENT set PHONE = '212681312798' where current of c_student;
        end loop;
    rollback;
END;
/


select max(AGE)
from STUDENT;

CREATE OR REPLACE FUNCTION ROUNDONG_S(s_text IN VARCHAR2)
    RETURN VARCHAR2
    IS
BEGIN
    RETURN '(' || s_text || ')';
END ROUNDONG_S;
/

CREATE OR REPLACE PROCEDURE test_proc
    AUTHID CURRENT_USER IS -- invoker’s rights
BEGIN
    NULL;
END;
/


create or replace PROCEDURE process_data(p_data out NOCOPY VARCHAR2) IS
BEGIN
    p_data := 'Processed';
END;

create or replace FUNCTION calculate_bonus(p_salary NUMBER) RETURN NUMBER PARALLEL_ENABLE IS
BEGIN
    RETURN p_salary * 0.10;
END;


declare
    student_id number;
BEGIN
    insert into STUDENT values (5, 'Abdelhak', 'abdelhakzammii@gmail.com', 23, '212681312798') returning id into student_id;
    DBMS_OUTPUT.PUT_LINE(student_id);
    commit;
END;



