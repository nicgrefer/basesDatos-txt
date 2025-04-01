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

--PASSWORD EXPIRE;

--Nota
--al final hay algun error y no detecta el usuario al poner qye tenga que cambiar la contraseña


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

CREATE table usuario3.tabla_a(
    col1     integer,
    col2     varchar2(100)
);
DROP user usuario3;
DROP user usuario3 cascade;
-- Ahora como tiene una tabla no se puede hacer de forma 'normal' por lo que ay que poner CASCADE

-----------Privilegios-------------
select * from SYSTEM_PRIVILEGE_MAP; --Mapa que presenta todos los privilegios existentes






