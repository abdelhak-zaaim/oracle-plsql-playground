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
    list1 list_of_numbers := list_of_numbers(2,4,6);
begin
  DBMS_OUTPUT.PUT_LINE(list1(1));
end;
/