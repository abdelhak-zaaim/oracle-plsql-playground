-- here is an example of catch simple exception and deal with it

declare
    simple STUDENT%rowtype;
begin
    select * into simple from STUDENT where id = 23; -- let's suppose this id not exist in our table

exception
    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('student not exist with that id');
    when others then
        DBMS_OUTPUT.PUT_LINE('Error');
end;


-- so now lets declare our own exception and catch it

declare
    my_own_excp exception ;
begin

    if 1 > 0 then
        raise my_own_excp;
    end if;

Exception
    when my_own_excp then
        DBMS_OUTPUT.PUT_LINE('my exception is raised lol!!');

end;


-- example of raise an exception with dbms.standard package

declare
begin
    dbms_standard.RAISE_APPLICATION_ERROR(121212, 'hello tis is error');

exception
    when others then
        DBMS_OUTPUT.PUT_LINE('an error appears hahaha');

end;