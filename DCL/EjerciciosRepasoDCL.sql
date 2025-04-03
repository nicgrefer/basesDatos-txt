-- <DBA
------- 1. Creación y Gestión de Usuarios -------
-- Ejer 1 Crea un usuario llamado estudiante1 con la contraseña ESTUDIANTE1, asegurándote de que deba cambiar la contraseña la primera vez que se conecte.
create user estudiante1 IDENTIFIED by ESTUDIANTE1; -- PASSWORD EXPIRE


-- Ejer 2 Dale al usuario estudiante1 los privilegios para conectarse a la base de datos y para crear objetos (como tablas).

GRANT CONNECT to estudiante1;
GRANT CREATE TABLE to estudiante1;

-- Ejer 3 Bloquea la cuenta de estudiante1 y comprueba que esté bloqueada consultando la vista DBA_USERS.
alter user estudiante1 ACCOUNT LOCK;

-- Ejer 4 Intenta eliminar al usuario estudiante1 sin cerrar su conexión. ¿Qué ocurre? Soluciona el problema utilizando la opción adecuada.
-- Si no cierro conexion da error porque proboca incompatibilidad, por lo que primero tenemos que desconectarlo y luego ...
DROP user estudiante1;

------- 2. Asignación y Revocación de Privilegios del Sistema -------
-- Ejer 5 Crea un usuario llamado admin1 con la contraseña ADMIN1.
CREATE USER admin1 IDENTIFIED by ADMIN1;

-- Ejer 6 Otorga a admin1 el privilegio de crear usuarios (CREATE USER) con la opción WITH ADMIN OPTION.
GRANT CREATE USER to admin1 WITH ADMIN OPTION;

-- Ejer 7 Conéctate como admin1 y crea un usuario llamado auxiliar1 con la contraseña AUXILIAR1
--- >Cambiamos de usuario --> para ello permiso para conectarse
GRANT CREATE SESSION TO ADMIN1;
-- > admin1
CREATE USER auxiliar1 IDENTIFIED by AUXILIAR1;

-- Ejer 8 Revoca el privilegio CREATE USER de admin1 y comprueba si sigue pudiendo crear usuarios. ¿Qué observas?
-- < DBA
REVOKE CREATE USER from admin1;
-- >admin1
CREATE USER auxiliar2 IDENTIFIED by AUXILIAR2; -- Claramente da error

------- 3. Creación de Tablas y Gestión de Objetos -------
-- Ejer 9 Crea un usuario llamado trabajador1 con la contraseña TRABAJADOR1 y dale los privilegios CONNECT y RESOURCE.
-- <DBA
CREATE USER trabajador1 IDENTIFIED by TRABAJADOR1;
GRANT CONNECT to trabajador1;
GRANT RESOURCE to trabajador1;

-- Ejer 10 En el esquema de trabajador1, crea una tabla llamada empleados con las columnas:

    /* id_empleado (número entero)
    nombre (cadena de hasta 50 caracteres)
    salario (número con 2 decimales)
    */

CREATE TABLE trabajador1.empleados(
    id_empleado     number,
    nombre          VARCHAR2(50),
    salario         number(10,2)

);

-- Ejer 11 Intenta eliminar al usuario trabajador1. ¿Qué sucede? Resuelve el problema. 

DROP USER trabajador1; -- Da error, eso es porque tiene tabals en su interior, para ello ....

DROP user trabajador1 CASCADE;

------- 4. Privilegios sobre Objetos -------
-- Ejer 12 Crea dos usuarios: jefe1 (contraseña JEFE1) y subordinado1 (contraseña SUB1). Dale a ambos el privilegio CONNECT.

CREATE USER jefe1 IDENTIFIED BY JEFE1;
GRANT CONNECT to jefe1;
CREATE USER subordinado1 IDENTIFIED BY SUB1;
GRANT CONNECT to subordinado1;

--Ejer 13 En el esquema de jefe1, crea una tabla llamada proyectos con las columnas:

    /* id_proyecto (número)
    descripcion (cadena de hasta 200 caracteres) */
-- >Cambiamos de usuario a jefe1 pero antes...
GRANT CREATE TABLE to  jefe1;

-->jefe1

CREATE TABLE proyectos (
    id_proyecto     NUMBER,
    descripcion     VARCHAR2(200)
);




-- Ejer 14 Otorga a subordinado1 el privilegio de hacer SELECT sobre la tabla proyectos de jefe1.

GRANT SELECT on proyectos to subordinado1;


--Ejer 15 Intenta que subordinado1 inserte un registro en la tabla proyectos. ¿Funciona? Si no, otorga el privilegio necesario y asigna una cuota de 50 MB en el tablespace users a subordinado1.

-- No va a poder ya que necesita privilegios de insert y cuota
--<DBA
GRANT INSERT on jefe1.proyectos to subordinado1;
Alter user subordinado1 QUOTA 50m on users;

-- >subordinado1
INSERT into jefe1.proyectos VALUES(5,'Descripcion del proyecto');

--- NO funciona 🤷

------- 5. Roles -------
-- Ejer 16 Crea un rol llamado rol_lector y otórgale los privilegios CONNECT y SELECT ANY TABLE.
CREATE ROLE rol_lector;
GRANT CONNECT to rol_lector;
GRANT SELECT ANY TABLE to rol_lector;

-- Ejer 17 Crea un usuario llamado lector1 con la contraseña LECTOR1 y asígnale el rol rol_lector.
CREATE USER lector1 identified by LECTOR1;
GRANT rol_lector to lector1;

-- Ejer 18 Comprueba los privilegios asignados a lector1 consultando las vistas DBA_ROLE_PRIVS y DBA_SYS_PRIVS.

SELECT * from dba_role_privs WHERE GRANTEE = 'LECTOR1';
SELECT * from dba_sys_privs;

-- Ejer 19 Revoca el rol rol_lector de lector1 y verifica que ya no tenga los privilegios asociados.

REVOKE rol_lector from lector1;
SELECT * from dba_role_privs WHERE GRANTEE = 'LECTOR1';

------- 6. Secuencias y Privilegios -------
-- Ejer 20 Crea un usuario llamado generador1 con la contraseña GEN1 y dale el privilegio CREATE SEQUENCE.

CREATE user generador1 IDENTIFIED by GEN1;
GRANT CREATE SEQUENCE to generador1 WITH admin OPTION;

-- Ejer 21 En el esquema de generador1, crea una secuencia llamada seq_orden que comience en 10, incremente en 5 y tenga un máximo de 100.

CREATE SEQUENCE generador1.seq_orden 
start WITH 10
INCREMENT by 5
MAXVALUE 100;

-- Ejer 22 Crea un usuario consumidor1 con la contraseña CONS1 y otórgale el privilegio de usar la secuencia seq_orden desde el usuario generador1.

GRANT CONNECT to generador1; -->privilegio connect
GRANT CREATE USER to generador1; -->Privilegio para crear usuarios


-- > generador1 

CREATE user consumidor1 IDENTIFIED by CONS1;


GRANT SELECT ON generador1.seq_orden TO consumidor1;



-- Ejer 23 Conéctate como consumidor1 e intenta seleccionar el siguiente valor de la secuencia (generador1.seq_orden.NEXTVAL). ¿Funciona? Si no, ajusta los privilegios.

------- 7. Combinación de Privilegios y Objetos -------
-- Ejer 24 Crea un usuario propietario1 (contraseña PROP1) y un usuario colaborador1 (contraseña COLAB1), ambos con privilegio CONNECT.

-- Ejer 25 En el esquema de propietario1, crea una tabla inventario con las columnas:

    /* id_item (número)
    nombre_item (cadena de hasta 100 caracteres) */

-- Ejer 26 Otorga a colaborador1 permisos para hacer SELECT y INSERT en la tabla inventario, pero solo permiso para modificar (UPDATE) la columna nombre_item.

-- Ejer 27 Conéctate como colaborador1 e intenta:
    /* Hacer un SELECT de la tabla.
    Insertar un registro.
    Modificar el id_item de un registro. ¿Qué sucede?
    Modificar el nombre_item de un registro. ¿Funciona? */



    --|Borramos todos los usuarios para liberar-|--
    --|      espacio en la base de datos        |--
    --|-----------------------------------------|--
    --|DROP USER admin1 CASCADE;                |--
    --|DROP USER auxiliar1 CASCADE;             |--
    --|DROP USER trabajador1 CASCADE;           |--
    --|DROP USER jefe1 CASCADE;                 |--
    --|DROP USER subordinado1 CASCADE;          |--
    --|DROP USER lector1 CASCADE;               |--
    --|DROP USER generador1 CASCADE;            |--
    --|DROP USER consumidor1 CASCADE;           |--
    --|DROP USER propietario1 CASCADE;          |--
    --|DROP USER colaborador1 CASCADE;          |--
    --|-----------------------------------------|--

