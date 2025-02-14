# Borrado de datos (filas de una tabla)

## Estructura
DELETE [FROM] nombre_tabla WHERE (condicion)---> (No se puede elimianr todas (las que sirven de "union" entre tablas))
## Ejemplo 1
>Crear tabla (que usamos para borrar)

    CREATE TABLE EMPLE_30 (
     EMP_NO    NUMBER(4) NOT NULL,
     APELLIDO  VARCHAR2(10)  ,
     OFICIO    VARCHAR2(10)  ,
     DIR       NUMBER(4) ,
     FECHA_ALT DATE      ,
     SALARIO   NUMBER(7),
     COMISION  NUMBER(7),
     DEPT_NO   NUMBER(2) NOT NULL);

> Insetar datos en la tabla

    insert into emple_30 
    select emple.* from emple, depart
    where emple.dept_no = depart.dept_no 
    and depart.dnombre like 'VENTAS'; 
> Ver tabla

    select * from emple_30;
> Terminal --> Elimindao 3 columas
<br>

> Ver el cambio

    select * from emple_30;
----
--Elimina los empleados de emple 30 que cobren mas de 1500€

    delete emple_30 
    where salario>1500;
---

## Ejemplo 2
-- Borrar los departamentos con menos de 4 empleados

        DELETE FROM DEPART 
        WHERE DEPT_NO IN (
                            SELECT DEPT_NO 
                            FROM EMPLE 
                            GROUP BY DEPT_NO
                            HAVING COUNT(*) < 4
                        );
## Ejemplo 3
-- Borrar las filas de la tabla Libreria cuyos ejemplares no superen la media de ejemplares en el estante

    
