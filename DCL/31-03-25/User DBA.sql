-- Vemos el tablespace por defecto y temporal de los usuarios de la BBDD
select * from DBA_users;

-- Vemos el perfil del usuario
SELECT * FROM DBA_profiles;

----------------------------

--1. Creamos un usuario (usuario1) y contraseña USUARIO1 y obligado a cambiar la contraseña al conectarse la 1º vez
create user usuario3
IDENTIFIED by USUARIO3;

--PASSWORD EXPIRE;

--Nota
--al final hay algun error y no detecta el usuario al poner qye tenga que cambiar la contraseña


--1.1 Es necesario darle privilegio para conectarse
GRANT CONNECT to usuario3;

-- 2 Provamos desde SQL*Plus 
-- docker exec -it (nombre contenedor) sqlplus







