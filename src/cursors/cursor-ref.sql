declare
    TYPE cor_ref is ref CURSOR;

    student_ref cor_ref;
    student_col STUDENT%rowtype;

begin
    open student_ref for select * from STUDENT;
    loop
        fetch student_ref into student_col;
        exit when student_ref%notFound;
        DBMS_OUTPUT.PUT_LINE(student_col.EMAIL);

    end loop;

end;
