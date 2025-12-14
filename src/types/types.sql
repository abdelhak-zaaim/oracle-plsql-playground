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
BEGIN
    for i in c_student loop
        update STUDENT set PHONE = '212681312798' where current of c_student;
        end loop;
    commit;
END;
/


select * from STUDENT;