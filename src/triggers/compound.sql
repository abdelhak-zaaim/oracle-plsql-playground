CREATE OR REPLACE TRIGGER student_counter
    FOR INSERT OR DELETE ON STUDENT
    COMPOUND TRIGGER
    v_count NUMBER := 0;

BEFORE STATEMENT IS
BEGIN
    v_count := 0;
END BEFORE STATEMENT;

    AFTER EACH ROW IS
    BEGIN
        v_count := v_count + 1;
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Total rows affected: ' || v_count);
    END AFTER STATEMENT;

    END student_counter;
/
