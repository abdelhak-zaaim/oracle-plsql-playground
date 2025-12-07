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


-- example of a function inside  Block

declare
    -- lets star declaring our variables before the actual function
    nmbr1 number := 3;
    nmbr2 number := 2;

    function sum_of_tow(number1 in number, number2 in number) return number
        is
    begin
        return number1 + number2;
    end;

begin
    DBMS_OUTPUT.PUT_LINE(sum_of_tow(nmbr1, nmbr2));
end;