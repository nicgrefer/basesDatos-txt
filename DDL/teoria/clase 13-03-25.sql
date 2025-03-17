-- Vistas (se usa el script empleYdepart.sql)
select * from emple;
desc emple;
select * from depart;

select * from user_views;

CREATE OR REPLACE VIEW Empleados30 (EMP_NO, APELLIDO, FECHA_ALT, DEPT_NO)
AS 
SELECT EMP_NO, APELLIDO, FECHA_ALT, DEPT_NO FROM EMPLE WHERE DEPT_NO = 30;


-- Empleamos un nuevo empleado en la lista
insert into Empleados30 values (999,'Prueba',sysdate,20);
-- Al ejecutar para ver que se a añadido no se aparece por lo que.... 
-- devemos incluir el ` WITH CHECK OPTION `
CREATE OR REPLACE VIEW Empleados30 (EMP_NO, APELLIDO, FECHA_ALT, DEPT_NO)
AS 
SELECT EMP_NO, APELLIDO, FECHA_ALT, DEPT_NO FROM EMPLE WHERE DEPT_NO = 30
WITH CHECK OPTION;

-- Ahora si se puede agregar un nuevo empleado
insert into Empleados30 values (999,'Prueba',sysdate,30);

-- Si intentamos agregar un empleado con un departamento diferente a 30 no se podra
insert into Empleados30 values (999,'Prueba',sysdate,20);

----------------------------

-- Verificar si ya existen claves primarias en EMPLE y DEPART
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME IN ('EMPLE', 'DEPART');

-- Ver estructura de las tablas
DESC EMPLE;
DESC DEPART;

-- Crear clave primaria en EMPLE si no existe
ALTER TABLE EMPLE
ADD CONSTRAINT EMPLE_PK PRIMARY KEY (EMP_NO);

-- Crear clave primaria en DEPART si no existe
ALTER TABLE DEPART
ADD CONSTRAINT DEPART_PK PRIMARY KEY (DEPT_NO);

-- Indexamos la tabla emple con la columna apellido y comprovamos la creaccion del indice
create index apellido_idx on emple (APELLIDO);
