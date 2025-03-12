

create table tablaA(
    a1		number primary key,
    a2 		varchar2 (10) 
);

create table tablaB(
    b1		char (3) primary key,
    b2 		date, 
    b3 		number references tablaA(a1)
);


DROP TABLE tablaA CASCADE CONSTRAINTS;-- borra includo teniendo dependencias a otras clases 


SELECT * FROM user_tables;        -- ✅ Ver todas las tablas del usuario
SELECT * FROM user_constraints;   -- ✅ Ver restricciones (PK, FK, etc.)
SELECT * FROM user_tab_columns;   -- ✅ Ver columnas de las tablas del usuario

-------------------------------- Crear vistas--------------------------------------------

desc scott.emp;
DESC SCOTT.DEPT;

-- -> SELECT * FROM user_views;
-- creamos una vista llamada empleados 30 que muestre los empleados del departamento 30 

create or replace VIEW  Empleados30 
as 
select * from  SCOTT.emp where emp.DEPTNO = 30;

SELECT * FROM user_views;

select * from Empleados30;

----------------

create or replace VIEW  Empleados30 (num_empleado,nombre,fechaInicio,departamento)
as 
select emp.EMPNO,emp.ENAME, emp.HIREDATE,emp.DEPTNO from  SCOTT.emp where emp.DEPTNO = 30;
