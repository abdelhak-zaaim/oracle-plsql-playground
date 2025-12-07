select *
from student;

declare
    rowcoun number(3);
begin
    update STUDENT set age = age + 2;

    if sql%notfound then
        DBMS_OUTPUT.PUT_LINE('no row effected');
    elsif sql%found then
        rowcoun := sql%rowcount;
        DBMS_OUTPUT.PUT_LINE(rowcoun || ' row effected');
    end if;

    update student set age = 400 where age = 500;

    if sql%notfound then
        DBMS_OUTPUT.PUT_LINE('no row effected');
    elsif sql%found then
        rowcoun := sql%rowcount;
        DBMS_OUTPUT.PUT_LINE(rowcoun || ' row effected');
    end if;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('error on executing');
        ROLLBACK;

end;
/

-- see some examples of Cursor
declare
    name  STUDENT.NAME%type;
    email STUDENT.EMAIL%type;
    age   STUDENT.AGE%type;
    cursor students is select name, email, age
                       from STUDENT;
begin

    open students;
    loop
        fetch students into name, email, age;
        DBMS_OUTPUT.PUT_LINE(name || ' ' || email || ' ' || age);
        exit when students%notfound;

    end loop;
end;


-- in this example we use records

declare
    userrecord STUDENT%rowtype;
    cursor students is select * into userrecord
                       from STUDENT;
begin

    open students;
    loop
        fetch students into userrecord;
        DBMS_OUTPUT.PUT_LINE(userrecord.name || ' ' || userrecord.email || ' ' || userrecord.age);
        exit when students%notfound;

    end loop;
    close students;
end;