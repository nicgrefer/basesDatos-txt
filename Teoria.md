
# Estructura base
## Select

Para recuperar información o, lo que es lo mismo, realizar consultas a la base de datos

    select objetox, objetoy....(o) *

Esto selecciona un objeto/elemento que selecciones o con el "*" para seleccionar todas las columnas

## From

- Para especifica la tabla o tablas de las que se recuperarán los datos

      SELECT nom_alumno, nota 
      FROM Alumnos

- Tambien se le puede dar un alias a cada tabla 

  
       SELECT A.nom_alumno, A.nota
       FROM Alumnos A

### Alias de columnas

Dentro de los from se puede dar un alias o otro nombre para la mejor comprendion a la hora de representar la tabla

    SELECT nom_dpto “Departamento”, num_dpto “Nº departamento”
    FROM Departamentos;

### Concadenar textos

Todas las bases de datos incluyen algún operador para encadenar textos. 
En Oracle son los signos ||. 
Ejemplo: 

     SELECT tipo, modelo, tipo || '-' || modelo "Clave pieza" FROM Piezas;

## Where 

Es una condicion que se deve cumplir para que la consulta se realice correctamente

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

Para comparar cadenas de caracteres que cumplan un patrón no nos sirve el operador "="

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


##
