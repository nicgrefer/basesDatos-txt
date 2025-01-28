>[!NOTE]
>Todabia no esta completo 

- [x] Estructura base 
- [x] Funciones
- [x] Join
- [x] Group by
- [x] OUTER JOIN
- [ ] UNION, INTERSECT, MINUS


# Estructura base
## Select

Para recuperar información o, lo que es lo mismo, realizar consultas a la base de datos

    select objetox, objetoy....(o) *

Esto selecciona un objeto/elemento que selecciones o con el "*" para seleccionar todas las columnas

## From

- Para especifica la tabla o tablas de las que se recuperarán los datos

      SELECT nom_alumno, nota 
      FROM Alumnos

- También se le puede dar un alias a cada tabla 

  
       SELECT A.nom_alumno, A.nota
       FROM Alumnos A

### Alias de columnas

Dentro de los from se puede dar un alias o otro nombre para la mejor comprensión a la hora de representar la tabla

    SELECT nom_dpto “Departamento”, num_dpto “Nº departamento”
    FROM Departamentos;

### Concadenar textos

Todas las bases de datos incluyen algún operador para encadenar textos. 
En Oracle son los signos ||. 
Ejemplo: 

     SELECT tipo, modelo, tipo || '-' || modelo "Clave pieza" FROM Piezas;

## Where 

Es una condición que se debe cumplir para que la consulta se realice correctamente

     WHERE nota=5;
     WHERE (nota>=10) AND (curso=1);
     WHERE (nota IS NULL) OR (UPPER(nom_alumno)=‘PEDRO’)

Las funciones que se pueden utilizar son:

|Funciones|
|---|
|=,>,<,>=,<=,!=,<>|
| IN, NOT IN, BETWEEN, NOT BETWEEN|
|Like|

### Operadores de comparacion

|operador|Significado|
|--------|-----------|
|>|Mayor que|
|<|Menor que|
|>=|Mayor o igual|
|<=|Menor o igual|
|=|Igual|
|<>|Distinto|
|!=|Distinto|

ej:

    SELECT nom_alumno FROM Alumnos WHERE (nota1+nota2+nota3)/3 >6;

### Operadores logicos

|operador|Significado|
|--------|-----------|
|AND| Devuelve TRUE si las dos condiciones son verdaderas|
|OR| Devuelve TRUE cuando una de las dos condiciones es verdadera|
|NOT|Invierte la lógica de la condición. Si era verdadera pasa a ser falsa, y viceversa|

ej:

     SELECT apellido, salario, num_dpto FROM Empleados 
     WHERE (salario>2000) AND (num_dpto=10 OR num_dpto=20);

### Between
 Permite obtener datos que se encuentren dentro de un rango. Su 
formato es:

     <expresión> [NOT] BETWEEN valor_inicial AND valor_final

ej:

     /* Obtiene los empleados con salario entre 1500 y 2000 euros */
     SELECT apellido, salario FROM Empleados WHERE salario BETWEEN 1500 AND 2000
     
### IN

Permite comprobar si una expresión pertenece o no a una lista de valores
ej:

    /* Obtiene los empleados cuyo nº de departamento sea 10 ó 30 */
     SELECT apellido FROM Empleados WHERE num_dpto IN (10,30);

### LIKE

Para comparar cadenas de caracteres que cumplan un patrón no nos sirve el operador  `"="`

|Operador|Significado|
|--------|-----------|
|%| Representa cualquier cadena de 0 ó más caractere|
|_| Representa un carácter cualquiera|

Su formato es: WHERE columna LIKE ‘caracteres_especiales’

## Order by

Con esta funcion se puede ordenar la tabla por el valor que se quiera, podiendo poner el nombre o el numero de la posición en la que se encuentra dicha caracteristica

    select datos.nombre, datos.anio_nacimiento, datos.localidad
    from datos
    order by anio_nacimiento /o/ order by 2

Se puede colocar las palabras ASC o DESC, que significan ascendente o descendente respectivamente(por defecto se toma ASC).


# Principales Funciones 
[Todas las funciones](https://github.com/nicgrefer/basesDatos-txt/blob/main/Funciones%20ORACLE.pdf)

|Funcion|Descripcción|
|--|--|
|ABS()|Valor absoluto|
|ROUND(numero [,m])|Devuelve el valor de ‘numero’ redondeado a ‘m’ decimales|
|AVG(n) |Calcula el valor medio de ‘n’ ignorando los valores nulos|
|COUNT(* / expresión)| Cuenta el número de veces que la expresión evalúa algún dato con valor no nulo. La opción * cuenta todas las filas seleccionadas|
|CONCAT (cad1, cad2)| Devuelve 'cad1' concatenada con 'cad2'. Es equivalente al operador barra barra (recta) |
|LPAD `o` RPAD (cad1, n [, cad2]) | Para añadir a la izuierda (lpad) o derecha (rpad)  de 'cad1' hasta que alcance una cierta longitud 'n' siendo `cad2` lo que quieres que represente esos espacios|
|LTRIM `o` RTRIM (cad [, set])| Suprime un conjunto de caracteres a la izquierda o derecha de la cadena 'cad'; 'set' es el conjunto de caracteres a suprimir |
|SUBSTR (cad, m [,n])| Obtiene parte de una cadena. Devuelve la subcadena de 'cad', que abarca desde la posición indicada en 'm' hasta tantos caracteres como indique el número 'n'|
|SYSDATE |Devuelve la fecha del sistema|
|TO_CHAR (fecha, ‘formato’) |Convierte una fecha (de tipo DATE) a tipo VARCHAR2 en el formato especificado|
|TO_CHAR (numero, ‘formato’) |Convierte un número (de tipo NUMBER) a tipo VARCHAR2 en el formato especificado|
|TO_DATE (cadena, ‘formato’) |Convierte ‘cadena’ de tipo VARCHAR2 o CHAR, a un valor de tipo DATE según el formato especificado|
|TO_NUMBER (cadena [,‘formato’]) |Convierte ‘cadena’ de tipo NUMBER según el formato especificado|


# Join 

Consiste simplemente en juntar datos en 1 consulta que probengan de distintas tablas, para ello se separa con un coma ej:


    SELECT columnas de las tablas que aparecen en la cláusula FROM
     FROMtabla1, tabla2
     WHEREtabla1.columna = tabla2.columna ;


Para que funcione es inportante hacer un *"VINCULO"* entre ellas para eso se usa `WHERE` --> mientras...  para ello tiene que haver alguna relacción entre las tablas.

# Grup by

Consiste en *"Agrupar"* la consulta *encapsulandolo* en el `GRUP BY`. Esto que se suele poner es lo mismo que aparece en el select siendo estos:

-  una constante
-  una función de grupo (SUM, COUNT, AVG, ... )
-  una columna expresada en el GROUP BY.

De la misma manera que existe em merotdo de búsqueda y filtrado `WHERE` aquí tenemos la función **`HAVING`** 

## Having 

Filtro que se hace sobre el `grup by` mostrando así solo lo que la codicion de como *"true"* ej:

    SELECT vendedor, SUM(total_venta) AS total
    FROM ventas
    GROUP BY vendedor
    HAVING SUM(total_venta) > 500;

En este caso solo muestra los vendedores con un `total_venta` > 500


# OUTER JOIN

Esta *funcion* se pone en el `WHERE` y consiste en representar tambien los datos que no tengan como tal una corespondencia entre tablas apareciendo **`NULL`**.
Para hacer esto en **ORACLE SQL** se emplea el signo `+` como se ve en la siguiente estructura/ejemplo:

     SELECT tabla1.columa1, tabla1.columa2, tabla2.columa1,
     FROM tabla1, tabla2
     WHERE tablal.columa1 = tabla2. columna1 (+)

De esta manera se obtendra filas con las columnas de tabla1 y el resto de columnas de la tabla2 se rellena con NULL


>[!IMPORTANT]
>Llegado a este momento es importante que sepas que se pede hacerse **SUB CONSULTAS** como las siguientes:
>
>-- Muestra cuantos empleados han sido contratados en el mes de julio = 6
>
	select to_char(employees.hire_date, 'mm') "Mes (¿junio?)", count (employees.employee_id) "nº empleados"
	from hr.employees
	group by to_char (employees.hire_date, 'mm')
	    having to_char (employees.hire_date, 'mm') =6
	order by 1;

>[!IMPORTANT]
> 






