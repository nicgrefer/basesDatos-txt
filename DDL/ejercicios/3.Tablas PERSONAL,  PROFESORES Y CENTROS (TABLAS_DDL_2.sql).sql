-- 11. Crea  una  vista  que  se  llame  CONSERJES  que  contenga  el  nombre  del  centro  y  el  nombre  de  sus conserjes. 

create or replace view CONSERJES 
as
select centros.NOMBRE, personal.APELLIDOS 
from personal, centros
where centros.COD_CENTRO = personal.COD_CENTRO
and FUNCION like  'CONSERJE';

-- 12. Crea un sinónimo llamado CONSER asociado a la vista creada antes. 

create or replace synonym CONSER for CONSERJES;

-- 13. Añade a la tabla PROFESORES una columna llamada COD_ASIG con dos posiciones numéricas 

ALTER TABLE PROFESORES 
ADD COD_ASIG NUMBER(2);
-- Comprensión de la sentencia
desc PROFESORES;

-- 14. Crea la tabla TASIG con las siguientes columnas: COD_ASIG numérico de 2 posiciones y NOM_ASIG cadena de 20 caracteres. 

create table TASIG(
    COD_ASIG     NUMBER(2),
    NOM_ASIG     VARCHAR2(20)
);

-- 15. Añade la  restricción de clave primaria a la columna COD_ASIG de la tabla TASIG. 

ALTER TABLE TASIG
ADD CONSTRAINT PK_COD_ASIG PRIMARY KEY (COD_ASIG);

-- 16. Añade la restricción de clave foránea a la columna COD_ASIG de la tabla PROFESORES. Visualiza el nombre de las restricciones 
-- y las columnas afectadas para las tablas TASIG y PROFESORES. 

ALTER TABLE PROFESORES
ADD CONSTRAINT FK_COD_ASIG FOREIGN KEY (COD_ASIG) ???

SELECT * FROM USER_CONSTRAINTS WHERE table_name IN ('PROFESORES', 'TASIG');
