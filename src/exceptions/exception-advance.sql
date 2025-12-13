declare
    test_num number;

begin
    test_num := 5 / 0;

exception
    when ZERO_DIVIDE then
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' : ' || SQLERRM);
end;