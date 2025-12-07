select *
from student;

declare
    rowcoun number(3);
begin
    update STUDENT set age = age + 2;
    commit;

    if sql%notfound then
        DBMS_OUTPUT.PUT_LINE('no row effected');
    elsif sql%found then
        rowcoun := sql%rowcount;
        DBMS_OUTPUT.PUT_LINE(rowcoun || ' row effected');
    end if;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;

end;
/