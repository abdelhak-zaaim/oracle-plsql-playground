-- now lets create an parametrized cursor

declare
    cursor students_ages (min_age STUDENT.AGE%type) is
    select * from STUDENT where AGE > min_age;

begin



end;