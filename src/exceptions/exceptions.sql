-- here is an example of catch simple exception and deal with it

declare
    simple STUDENT%rowtype;
begin
    select * into  simple from STUDENT where id = 23; -- let's suppose this id not exist in our table

 exception when NO_DATA_FOUND then
    DBMS_OUTPUT.PUT_LINE('student not exist with that id');
    when others then
        DBMS_OUTPUT.PUT_LINE('Error');
end;