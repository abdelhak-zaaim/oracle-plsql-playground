-- lets create an example trigger that insure the ages greater than 18

create or replace trigger age_check
    before update or insert
    on STUDENT
    for each row
    when (NEW.AGE < 18)
declare
    age_not_valid Exception;
    PRAGMA EXCEPTION_INIT ( age_not_valid, -20022 );
begin

    if :NEW.AGE < 18 then
        DBMS_STANDARD.RAISE_APPLICATION_ERROR(-20022, 'the age should be bigger tha 18;');
    end if;

exception
    when age_not_valid then
        DBMS_OUTPUT.PUT_LINE('please inter an age grater than 18');
        raise;
end;


-- so now lets try to set the age of an student less than 18 year

update STUDENT
set age = 13
where id = 1;