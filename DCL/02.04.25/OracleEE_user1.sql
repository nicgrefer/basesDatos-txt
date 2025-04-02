--Provamos que tiene privilegios
create user user3 IDENTIFIED by user3;

-- Provamos si tene privilegios para crear secuencia y tablas
create SEQUENCE secuencia1 MINVALUE 1 MAXVALUE 100 INCREMENT by 1 cycle;

create TABLE tabla1(
    col1    number,
    col2    varchar2(100)

);

-- 9.1 Provamos si nos deja dar privilegios a usuario2 de tabla y  secuencias

GRANT CREATE TABLE TO user2; --Si puede  -- Ojo que tambien se puede otorgar con with admin option
GRANT CREATE SEQUENCE TO user2; --No puede