ALTER SESSION SET PLSQL_CCFLAGS = 'DEBUG:FALSE';

declare
    nnn number := 3;
BEGIN
    $IF 1=2 $THEN
    DBMS_OUTPUT.PUT_LINE('Debug mode active');
    $END
DBMS_OUTPUT.PUT_LINE('Procedure running');
END;
/



