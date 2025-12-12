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