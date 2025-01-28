-- !1

-- Obtén todos los datos de los alumnos.
select * from alum2425;
--select * from alumnos;

-- Obtén los siguientes datos de alumnos: DNI, NOMBRE, APELLIDOS, CURSO, NIVEL y CLASE.
select dni, nombre, apellidos,curso,nivel,clase from alum2425;

-- Obtén todos los datos de alumnos cuya población sea 'GUADALAJARA'.
select * from alum2425 
	where poblacion= 'GUADALAJARA';

-- Obtén el NOMBRE y APELLIDOS de todos los alumnos cuya población sea 'GUADALAJARA'
select nombre, apellidos from alum2425
	where poblacion= 'GUADALAJARA';

-- Consulta el DNI, NOMBRE, APELLIDOS, CURSO, NIVEL y CLASE de todos los alumnos ordenado por APELLIDOS y NOMBRE ascendentemente.

select dni, nombre, apellidos, curso,nivel, clase from alum2425
order by 3,2 asc;


-- !2

select * from notas_alumnos;

-- Obtener aquellos nombres de alumnos que tengan un 7 en NOTA1 y cuya media sea mayor que 6.

select nombre_alumno, nota1 from notas_alumnos
	where nota1=7
    and (nota1 + nota2 + nota3)/3 >6;


-- !3

-- Obtener los ejemplares de los libros cuyo tema sea 'LABORES'. Usa el operador'=' y el operador LIKE. Compara los resultados

select * from libreria;

select * from libreria
where tema = 'LABORES';

SELECT * FROM libreria
WHERE tema LIKE '%LABORES%';

-- Visualiza el tema, estante y ejemplares de los libros con un número de ejemplares comprendidos entre 8 y 15

select * from libreria
where (ejemplares>8 and ejemplares<15)
order by 3;


-- Visualiza el tema, estante y ejemplares de los libros cuyo estante no esté comprendido entre la "B" y la "D".

select * from libreria
where estante not in ('B','C','D')
order by 2;

-- Visualiza los temas cuyo número de ejemplares no esté entre 15 y 20, ambos incluidos

select tema,ejemplares from libreria
where ejemplares not in (15,16,17,18,19,20)
order by 2;

-- !4

-- Visualiza todas las asignaturas que contengan tres letras "o" en su interior y tengan alumnos matriculados de "Madrid"

select asignaturas.cod, asignaturas.nombre "Asignatura" , alumnos.APENOM, alumnos.POBLA
from asignaturas, notas, alumnos
where asignaturas.cod = notas.cod and notas.dni = alumnos.dni
     and asignaturas.nombre like '%o%o%o%'
    and POBLA = 'Madrid';


-- Visualiza los nombres de alumnos de "Madrid" que tengan alguna asignatura suspendida

select asignaturas.cod, asignaturas.nombre, notas.nota ,alumnos.APENOM, alumnos.POBLA
from asignaturas, notas, alumnos
where notas.nota <= 4
    and (asignaturas.cod = notas.cod and notas.dni = alumnos.dni and POBLA = 'Madrid' );


-- Obtén el nombre y apellido de los alumnos que tengan nota en la asignatura con código 1.

select asignaturas.cod, notas.nota , 
  SUBSTR(alumnos.APENOM, 1, INSTR(alumnos.APENOM, ',') - 1) 'Apellido',
  SUBSTR(alumnos.APENOM, INSTR(alumnos.APENOM, ',') + 2) 'Nombre'
from asignaturas, notas, alumnos
where notas.cod = 1
    and (asignaturas.cod = notas.cod and notas.dni = alumnos.dni);

-- Visualiza los nombres de alumnos que tengan una nota entre 7 y 8 en la asignatura de "FOL".

select SUBSTR(alumnos.APENOM, INSTR(alumnos.APENOM, ',') + 2) "Nombre", notas.nota, asignaturas.NOMBRE
from alumnos,notas,asignaturas
where asignaturas.NOMBRE = 'FOL'
	and notas.nota between 7 and 8 
    and asignaturas.cod = notas.cod
    and notas.dni = alumnos.dni;


---------------------------------------------------------------------------

-- Cara2

-- !2

select * from EMPLE;
select round (avg (salario), 2) "Media de salario" from emple;

select count (COMISION) "nº comisiones no nulas" from emple;

select max(salario) "Salario maximo", min (salario) "Salario minimo" 
from emple
	where dept_no = 30;

-- !3

SELECT RPAD(REPLACE(titulo, '"', ''), 43, '.') 
FROM MISTEXTOS;

-- !4

SELECT LOWER(REPLACE(REPLACE(titulo, '"', ''), '.', '')) 
FROM MISTEXTOS;

-- !5

select autor "Autor",SUBSTR (autor,1, instr(autor,',') -1)"Apellido"
from libros;

-- !6

select autor "Autor", SUBSTR (autor,instr(autor,',') +1 )"Nombre"
from libros;



