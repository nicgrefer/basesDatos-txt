--Comprovamos si tiene el privilegio de añadir usuarios (7)
create user user3 IDENTIFIED by user3; --✅

-- Provamos si tene privilegios para crear secuencia y tablas (9)
create SEQUENCE secuencia1 MINVALUE 1 MAXVALUE 100 INCREMENT by 1 cycle; --✅

create TABLE tabla1( --✅
    col1    number,
    col2    varchar2(100)

);

-- 9.1 Provamos si nos deja dar privilegios a usuario2 de tabla y  secuencias

GRANT CREATE TABLE TO user2; --✅ Si puede  -- Ojo que tambien se puede otorgar con with admin option
GRANT CREATE SEQUENCE TO user2; -- ❌ No puede

-- Otorgamos privilegios al user2 para hacer select de la tabla1
GRANT SELECT ON tabla1 to user2;

SELECT * FROM USER_TAB_PRIVS; -- Miramos los usuarios que pueden acceder a sus tablas y que tabla


-------- PAra poder hacer el insert y update en el user 2....ALTER

-- Privilegio (la columna) en tabla para 'usuario'
GRANT INSERT, UPDATE (col2) on tabla1 to user2;

-- Miramos si se a aplicado con "SELECT * FROM USER_TAB_PRIVS;" pero no se ve la update por lo que usamos este otro
SELECT * FROM USER_COL_PRIVS;


SELECT * FROM USER_TAB_PRIVS; 
SELECT * FROM USER_COL_PRIVS;

--- Quitamos el privilegio para modificar la tabla para user2
-- REVOKE UPDATE (col2) ON tabla1 FROM user2; ❌ No se puede rebocar solo una columna, tiene que quitarse en toda la tabla
REVOKE UPDATE ON tabla1 FROM user2; --✅


