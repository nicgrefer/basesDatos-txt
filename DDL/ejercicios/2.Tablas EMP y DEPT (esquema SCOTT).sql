<<<<<<< Updated upstream
-- 4.  Crea una vista llamada NOMBRES con los campos ENAME, JOB, DEPTNO de la tabla EMP. 

CREATE OR REPLACE VIEW Nombres --Creamos la vista con los campos que queremos mostrar
AS  --Indicamos que es una vista
SELECT ENAME, JOB, DEPTNO FROM scott.emp;  -- Seleccionamos los campos de la tabla que queremos mostrar
--Verificamos el contenido de la vista
select * from user_views;

-- 5.  Crea una vista como la del punto anterior, pero que se llame NOMBRES2 y las  columnas de la vista se llamen NOMBRE, PUESTO y DEPARTAMENTO. 

CREATE OR REPLACE VIEW Nombres2 (Nombre,Puesto,Departamento) 
AS 
SELECT ENAME, JOB, DEPTNO FROM scott.emp; 


-- 6.  Crea  una  vista  llamada  NOMBRES3,  con  los  campos  NOMBRE,  PUESTO,  DESC_DEPARTAMENTO  y LOCALIZACION, pero solo de los empleados de Nueva York. 


CREATE OR REPLACE VIEW Nombres3 (NOMBRE, PUESTO, DESC_DEPARTAMENTO, LOCALIZACION) AS
SELECT emp.ENAME, emp.JOB, dept.DNAME, dept.LOC 
FROM scott.emp 
JOIN scott.dept ON emp.DEPTNO = dept.DEPTNO 
WHERE dept.LOC = 'NEW YORK';

select * from user_views;

-- 7.  Modifica la tabla EMP, aumentando el tamaño de la columna ENAME a 30 caracteres.

ALTER TABLE scott.emp MODIFY ename VARCHAR2(30);
-- Aunque al no tener previlegios no se puede modificar la tabla

-- 8.  Utilizando la vista NOMBRES3, realiza las siguientes operaciones: 

--      Inserta un nuevo analista llamado PEPE, con código 7000, en el departamento de Ventas. 
--No funciona
insert into Numeros3 values (7000,'PEPE', 'ANALISTA', 'VENTAS', null);


--      

--       Elimina a todos los empleados menos al presidente. 

--9.  Crea una vista llamada NOMBRES4 con los totales de salario por departamento.  

create or replace view NOMBRES4 as select emp.SAL from  Scott.emp;

--10. Busca las vistas creadas en el diccionario de datos.

=======
-- 4. Crea una vista llamada NOMBRES con los campos ENAME, JOB, DEPTNO de la tabla EMP.
create or replace view nombres
as
select ename, job, deptno from scott.emp;

select * from user_views;

-- 5. Crea una vista como la del punto anterior, pero que se llame NOMBRES2 y las
-- columnas de la vista se llamen NOMBRE, PUESTO y DEPARTAMENTO.
create or replace view nombres2 (Nombre,Puesto,Departamento)
as
select ename, job, deptno from scott.emp;

select * from user_views;
-- 6. Crea una vista llamada NOMBRES3, con los campos NOMBRE, PUESTO, DESC_DEPARTAMENTO y
-- LOCALIZACION, pero solo de los empleados de Nueva York.
create or replace view nombres3 (Nombre, Puesto, Desc_departamento, Localizacion)
as
select  emp.ename, emp.job, dept.dname, dept.loc
from scott.emp, scott.dept
where emp.deptno = dept.deptno
and dept.loc ='NEW YORK';

select * from user_views;
-- 7. Modifica la tabla EMP, aumentando el tamaño de la columna ENAME a 30 caracteres.
alter table scott.emp
modify ename varchar2(30);

-- 8. Utilizando la vista NOMBRES3, realiza las siguientes operaciones:
-- - Inserta un nuevo analista llamado PEPE, con código 7000, en el departamento de Ventas.
insert into nombres3 (empno, ename, job, deptno)
values (7000, 'Pepe', 'ANALYST', (select deptno from scott.dept where dname = 'SALES'));

-- - Modifica el nombre de los empleados, añadiéndoles el sufijo ‘(NY)’.
update nombres3
set ename = ename || ' (NY)';

-- - Elimina a todos los empleados menos al presidente.
delete from nombres3
where job != 'PRESIDENT';

-- 9. Crea una vista llamada NOMBRES4 con los totales de salario por departamento.
create or replace view nombres4 (nombre_departamento, total_salarios)
as
select dname, sum(sal) "Total Salario" from scott.emp, scott.dept
    where emp.deptno = dept.deptno
    group by deptno, dname ;

select * from user_views;

-- 10. Busca las vistas creadas en el diccionario de datos.
>>>>>>> Stashed changes
select * from user_views;