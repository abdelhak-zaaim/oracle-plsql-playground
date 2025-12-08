-- lets define an simple user defined record

declare
    type req_std is record (name varchar2(50), email varchar2(50), age number(3));

    example req_std;
begin
    -- lets initialise it  wth some values
    example.name := 'abdelhak';
    example.email := 'abdelhak@gmail.com';
    example.age := 23;

    -- lets prints that results
    DBMS_OUTPUT.PUT_LINE(example.email);
end;


-- now lets see an table based record

declare
    example STUDENT%rowtype;
begin

    select * into example from STUDENT where id = 1;

    DBMS_OUTPUT.PUT_LINE(example.EMAIL);

end;


-- now lets see the third example of record -- the cursor based one

declare
    -- first lets declare an cursor
    cursor students_curs is select *
                            from STUDENT;
    record_example students_curs%rowtype;
begin

    select * into record_example from STUDENT where id = 1;
    -- lets print the results
    DBMS_OUTPUT.PUT_LINE(record_example.email);
end;