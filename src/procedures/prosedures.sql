-- simple procedure for printing a semple string

declare
    name1 varchar2(20) := 'abdelhak';
begin
    DBMS_OUTPUT.PUT_LINE(name1);
end;
/

-- an procedure contains an list of numbers and then print the first one

declare
    type list_of_numbers is varray(3) of number;
    list1 list_of_numbers := list_of_numbers(2, 4, 6);
begin
    DBMS_OUTPUT.PUT_LINE(list1(1));
end;
/

-- create an example procedure with one in parameter
create or replace procedure print_first_name(name1 in varchar2) as
begin
    DBMS_OUTPUT.PUT_LINE(name1);
end;
/

-- test that procedure

begin
    print_first_name('abdelhakk');
end;

declare
    nbr1 number := 3;
    nbr2 number := 6;
    sum1 number;

    procedure sum_fun(number1 in number, number2 in number, sum_out out number) is
    begin
        sum_out := number1 + number2;
    end sum_fun;

begin
    sum_fun(nbr1, nbr2, sum1);

    DBMS_OUTPUT.PUT_LINE(sum1);

end;
/