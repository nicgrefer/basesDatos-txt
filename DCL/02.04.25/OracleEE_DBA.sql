-- Vemos el tablespace por defecto y temporal de los usuarios de la BBDD
SELECT * FROM DBA_USERS ;


-- Vemos el perfil del usuario
SELECT * FROM DBA_profiles;

----------------------------

--1. Creamos un usuario (usuario1) y contraseña USUARIO1 y obligado a cambiar la contraseña al conectarse la 1º vez
create user usuario1
IDENTIFIED by USUARIO1;

create user usuario2
IDENTIFIED by USUARIO2;

CREATE USER usuario3
IDENTIFIED by USUARIO;

--PASSWORD EXPIRE;

--Nota
--al final hay algun error y no detecta el usuario al poner qUe tenga que cambiar la contraseña


--1.1 Es necesario darle privilegio para conectarse y para realizar operaciones (roles CONNECT y RESOURCE)
GRANT CONNECT to usuario2;
GRANT CONNECT to usuario1;
GRANT RESOURCE to usuario3;
-- 2 Bloqueamos el usuario 2


ALTER USER usuario2 ACCOUNT LOCK;


-- 3 comprobar que esta bloqueado
SELECT * FROM DBA_USERS WHERE USERNAME IN ('USUARIO1', 'USUARIO2','USUARIO3');

-- 4 eliminar un usuario --> Para ello tienes que cerrar conexion
DROP user dam;

-- 5 creamos una tabla en el usuario3 e intentamos borrar el usuario

CREATE table usuario3.tabla_a(
    col1     integer,
    col2     varchar2(100)
);

DROP user usuario3; --❌ Da error porque tiene tablas en su interior por lo tanto......
DROP user usuario3 cascade; --  ay que poner CASCADE --> Correcto ✅

-----------Privilegios-------------
select * from SYSTEM_PRIVILEGE_MAP; -- 6 Mapa que presenta todos los privilegios existentes

-- Privilegios del sistema (dar y quitar)
--- GRANT ->Dar privilegios a un roll || REVOKE -> quitar privilegios

-- 7 Trabajamos en la siguiente estructura de usuarios
-- DBA -(da privilegios a)-> user1 -(da privilegios a)-> user2
--  ->1 Creamos usuarios
CREATE USER user1 IDENTIFIED by user1;
CREATE USER user2 IDENTIFIED by user2;

--  ->2 Damos previlegios conexion
GRANT CONNECT to user1;
GRANT CONNECT to user2;

--  ->3 Compruebo como DBA que los usuarios an recibido los privilegios del sistema
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE IN ('USER1', 'USER2'); -- debuelbe los privilegios de ...
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE IN ('USER1', 'USER2'); -- debuelbe los roles de ...


--   ->4 asignar a user1 privilegios para crear usuarios
GRANT CREATE USER TO user1;

-- 9. Provamos la opcion with admin objet
--->Otorgamos privilegios para poder crear tablas (con admin option) y secuencas 

GRANT CREATE TABLE TO user1 WITH ADMIN OPTION;
GRANT CREATE SEQUENCE TO user1;















