-- lets create a function that return the ids of student of specific age

create or replace function get_students_ids_by_age(age STUDENT.AGE%type) return list_numbers
as
    TYPE list_numbers is table of number index by pls_integer;
    ids list_numbers;
begin
    select id bulk collect into ids from STUDENT where age = age;
    return ids;

exception
    when NO_DATA_FOUND then
    return list_numbers();
end;