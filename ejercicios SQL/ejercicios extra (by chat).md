### Ejercicios SQL Adicionales

#### Ejercicio 1: Consultas Básicas
1. Selecciona todos los empleados con salario mayor a 2000.

````
select * from emple where salario >2000;
````
   
2. Selecciona los nombres y apellidos de los alumnos de la tabla `ALUM` que tienen más de 18 años.

````
select * from alum where edad >18;
````

#### Ejercicio 2: Joins
1. Muestra el nombre del departamento y el nombre del empleado que trabaja en dicho departamento.
````
Muestra el nombre del departamento y el nombre del empleado que trabaja en dicho departamento.
Tablas: DEPARTAMENTOS, EMPLEADOS
````
2. Muestra el nombre del alumno y el nombre del curso en el que está inscrito.

#### Ejercicio 3: Subconsultas
1. Muestra los empleados que ganan más que el salario promedio de todos los empleados.
````
select * from emple where salario > (select avg(salario) from emple);
````
2. Muestra los nombres de los alumnos que no están en la tabla `NUEVOS`.
````
select nombre from alum where nombre not in (select nombre from nuevos);
````

#### Ejercicio 4: Agregación y Agrupación
1. Muestra el salario promedio por departamento.

2. Cuenta el número de libros por editorial en la tabla `LIBROS`.
