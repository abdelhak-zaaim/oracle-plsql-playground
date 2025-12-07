-- create a simple test function for summing tow numbers

create or replace function sun_of_numbers(number1 in number, number2 in number) return number
as
begin
    return number2 + number2;
end;



--test the function
begin
    DBMS_OUTPUT.PUT_LINE(sun_of_numbers(23, 7));
end;