CREATE OR REPLACE TYPE rectangle AS OBJECT
(
    length number,
    width  number,
    NOT INSTANTIABLE not final MEMBER PROCEDURE display
)
    NOT INSTANTIABLE NOT FINAL
/

create or replace type rectangle_o under rectangle
(
    name_o varchar2(2),
    overriding member procedure display
)/



create or replace type body rectangle_o as
    overriding member procedure display as
    begin
        DBMS_OUTPUT.PUT_LINE('i outputed');
    end;

end;
/

declare
    req rectangle_o;
begin
    req := rectangle_o(3,3,'he');
    DBMS_OUTPUT.PUT_LINE(req.NAME_O);
end;