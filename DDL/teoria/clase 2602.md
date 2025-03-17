select * from user_tables;
select * from user_objects;
select * from user_constraints;
````
CREATE TABLE personas (
    dni        VARCHAR2(9),
    nombre     VARCHAR2(100),
    apellido   VARCHAR2(100),
    edad       INTEGER,
    altura 	   number (3,2),
    fecha_mac  date
);
````
---------------------------
Cramos una nueva tabla con los vendeddorezs de scot
SELECT * FROM scott.emp;
desc scott.emp;
````
create table vendedores(
    num_vendedor,
    nombre,
    fecha_contrato,
    salario,
    comision
) as 
select emp.EMPNO,emp.ENAME,emp.HIREDATE,emp.asl,emp.com
    from scott.emp
    where job like 'SALESMAN';
```` 
