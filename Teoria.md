>[!NOTE]
> ⚠️ *Todavía no está completo*

- [x] 📂 Estructura base
- [x] 🔢 Funciones
- [x] 🔗 Join
- [x] 📊 Group by
- [x] 🔄 OUTER JOIN (Los 2 modelos)
- [x] ➕ UNION, ➖ INTERSECT, ➗ MINUS
- [x] 🔗 Insert
- [ ] Delete

# 📂 Estructura base

## 🔢 Select

Para recuperar información o, lo que es lo mismo, realizar consultas a la base de datos.

```sql
SELECT objetox, objetoy....(o) *
```

Esto selecciona un objeto/elemento que especifiques o usa `*` para seleccionar todas las columnas.

## 📚 From

- Para especificar la tabla o tablas de las que se recuperan los datos:

```sql
SELECT nom_alumno, nota
FROM Alumnos;
```

- Se puede dar un alias a cada tabla:

```sql
SELECT A.nom_alumno, A.nota
FROM Alumnos A;
```

### 👤 Alias de columnas

Permite dar un nombre alternativo para mejorar la comprensión:

```sql
SELECT nom_dpto "Departamento", num_dpto "Nº departamento"
FROM Departamentos;
```

### 📝 Concatenar textos

En Oracle, se usa `||` para concatenar textos:

```sql
SELECT tipo, modelo, tipo || '-' || modelo AS "Clave pieza" FROM Piezas;
```

## 🚧 Where

Condición que debe cumplirse para que la consulta devuelva resultados:

```sql
WHERE nota = 5;
WHERE (nota >= 10) AND (curso = 1);
WHERE (nota IS NULL) OR (UPPER(nom_alumno) = 'PEDRO');
```

### 🔄 Operadores de comparación

| Operador | Significado       |
|----------|-------------------|
| >        | Mayor que         |
| <        | Menor que         |
| >=       | Mayor o igual     |
| <=       | Menor o igual     |
| =        | Igual             |
| <> / !=  | Distinto          |

Ejemplo:

```sql
SELECT nom_alumno FROM Alumnos WHERE (nota1 + nota2 + nota3) / 3 > 6;
```

### 🔠 Operadores lógicos

| Operador | Significado                                |
|----------|-------------------------------------------|
| AND      | Verdadero si ambas condiciones son ciertas|
| OR       | Verdadero si al menos una condición es cierta|
| NOT      | Invierte el resultado de la condición     |

Ejemplo:

```sql
SELECT apellido, salario, num_dpto
FROM Empleados
WHERE (salario > 2000) AND (num_dpto = 10 OR num_dpto = 20);
```

### 🌐 Between

Filtra datos dentro de un rango:

```sql
SELECT apellido, salario
FROM Empleados
WHERE salario BETWEEN 1500 AND 2000;
```

### 🎾 IN

Verifica si un valor pertenece a una lista:

```sql
SELECT apellido
FROM Empleados
WHERE num_dpto IN (10, 30);
```

### 🔍 LIKE

Compara cadenas con patrones:

| Operador | Significado                         |
|----------|------------------------------------|
| %        | Cualquier secuencia de caracteres  |
| _        | Un solo carácter cualquiera         |

Ejemplo:

```sql
SELECT nombre
FROM Clientes
WHERE nombre LIKE 'A%';
```

## 🗒️ Order by

Ordena resultados por una o varias columnas:

```sql
SELECT nombre, anio_nacimiento, localidad
FROM datos
ORDER BY anio_nacimiento ASC; -- O DESC
```

# 🔄 Principales Funciones

Consulta todas las funciones [aquí](https://github.com/nicgrefer/basesDatos-txt/blob/main/Funciones%20ORACLE.pdf).

| 🌐 Funcion | 📚 Descripción                    |
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


# 🔗 Join 

Consiste simplemente en juntar datos en 1 consulta que probengan de distintas tablas, para ello se separa con un coma en el `from` marcando así las 2 tablas ej:


    SELECT columnas de las tablas que aparecen en la cláusula 
    FROM tabla1, tabla2
    WHEREtabla1.columna = tabla2.columna ;


Para que funcione es inportante hacer un *"VINCULO"* entre ellas para eso se usa `WHERE` --> mientras...  para ello tiene que haver alguna relacción entre las tablas.

# 📊 Grup by

Consiste en *"Agrupar"* la consulta *encapsulandolo* en el `GRUP BY`. Lo que se pone aquí es lo mismo que aparece en el `select` siendo estos:

-  una constante
-  una función de grupo (SUM, COUNT, AVG, ... )
-  una columna expresada en el GROUP BY.

De la misma manera que existe em metodo de búsqueda y filtrado (`WHERE`) aquí tenemos la función **`HAVING`** 

## Having 

Filtro que se hace sobre el `grup by` mostrando así **solo** lo que la codicion de como *"true"* ej:

    SELECT vendedor, SUM(total_venta) AS total
    FROM ventas
    GROUP BY vendedor
    HAVING SUM(total_venta) > 500;

En este caso solo muestra los vendedores con un `total_venta` > 500

# Operadores Relacionales/ Operadores de Conjuntos

Consiste en agrupar el resultado de varias `select` para conseguir un unico resultado

## 🔄 OUTER JOIN

### 🔄 Estructora Antigua (uso del simbolo '+')

Esta *funcion* se pone en el `WHERE` y consiste en representar tambien los datos que no tengan como tal una corespondencia entre tablas apareciendo como valor **`NULL`**.<br>
Para hacer esto en **ORACLE SQL** se emplea el signo `+` como se ve en la siguiente estructura/ejemplo:

     SELECT tabla1.columa1, tabla1.columa2, tabla2.columa1,
     FROM tabla1, tabla2
     WHERE tablal.columa1 = tabla2. columna1 (+)

De esta manera se obtendrán las filas con las columnas de *tabla1* y el resto de columnas de la *tabla2* se rellena con `NULL`


>[!IMPORTANT]
>Llegado a este momento es importante que sepas que se pede hacerse **[SUB CONSULTAS](https://github.com/nicgrefer/basesDatos-txt/blob/main/Teoria.md#subconsultas)** como las siguientes:
>
>Queremos obtener el nombre y salario de los empleados que ganan más que el salario promedio de todos los empleados
>
	SELECT FIRST_NAME, LAST_NAME, SALARY
	FROM EMPLOYEES
	WHERE SALARY > (
	    SELECT AVG(SALARY)
	    FROM EMPLOYEES
	);


>[!IMPORTANT]
> De esta forma podemos hacer busquedas/consultas que amteriormente no podríamos realizar

### Estructura Nueva (uso del join)

En **Oracle**, aunque todavía se puede usar la sintaxis antigua con el operador `(+)`, es recomendable utilizar la **sintaxis moderna de SQL estándar**.


#### ✅ **1. LEFT OUTER JOIN** (o **LEFT JOIN**)  
Devuelve **todas las filas** de la tabla de la izquierda y las coincidencias de la tabla de la derecha. **Si no hay coincidencias**, las columnas de la tabla de la **derecha** se rellenan con `NULL`.

```sql
SELECT tabla1.columna1, tabla1.columna2, tabla2.columna1
FROM tabla1 LEFT OUTER JOIN tabla2
ON tabla1.columna1 = tabla2.columna1;
```

🔑 **Puntos Clave:**
- `tabla1` es la tabla principal (se muestran todas sus filas).
- `tabla2` aporta datos solo si hay coincidencias; si no, muestra `NULL`.

---

#### ✅ **2. RIGHT OUTER JOIN** (o simplemente **RIGHT JOIN**)  
Devuelve **todas las filas** de la tabla de la derecha y las coincidencias de la tabla de la izquierda. Si no hay coincidencias, las columnas de la tabla de la izquierda se rellenan con `NULL`.

```sql
SELECT tabla1.columna1, tabla1.columna2, tabla2.columna1
FROM tabla1 RIGHT OUTER JOIN tabla2
ON tabla1.columna1 = tabla2.columna1;
```

🔑 **Puntos Clave:**
- `tabla2` es la tabla principal (se muestran todas sus filas).
- `tabla1` aporta datos si hay coincidencias; si no, muestra `NULL`.

---

#### ✅ **3. FULL OUTER JOIN** (o simplemente **FULL JOIN**)  
Devuelve **todas las filas** de ambas tablas. Cuando no hay coincidencias, se rellena con `NULL` en las columnas de la tabla que falta.

```sql
SELECT tabla1.columna1, tabla1.columna2, tabla2.columna1
FROM tabla1 FULL OUTER JOIN tabla2
ON tabla1.columna1 = tabla2.columna1;
```

🔑 **Puntos Clave:**
- Incluye **todas las filas** de `tabla1` y `tabla2`.
- Si una fila no tiene coincidencia en la otra tabla, sus columnas aparecen como `NULL`.

---

### 📝 **Ejemplo en Oracle**

### Tablas:
**Clientes**
| id_cliente | nombre   |
|------------|----------|
| 1          | Ana      |
| 2          | Juan     |
| 3          | Carlos   |

**Pedidos**
| id_pedido | id_cliente | producto  |
|-----------|------------|-----------|
| 101       | 1          | Laptop    |
| 102       | 2          | Móvil     |

#### 🔍 **LEFT JOIN en Oracle:**
```sql
SELECT c.id_cliente, c.nombre, p.producto
FROM clientes c LEFT OUTER JOIN pedidos p
ON c.id_cliente = p.id_cliente;
```

#### Resultado:
| id_cliente | nombre   | producto  |
|------------|----------|-----------|
| 1          | Ana      | Laptop    |
| 2          | Juan     | Móvil     |
| 3          | Carlos   | NULL      |

- **Carlos** aparece aunque no tenga pedidos, porque usamos `LEFT OUTER JOIN`.


## UNION, INTERSECT, MINUS

### Estructura:

El formato de SELECT con estos operadores es el siguiente:

	 SELECT … FROM … WHERE …
	 Operador de conjuntos
	 SELECT … FROM … WHERE 

### Función:

Consiste en `unir`, `insertar`(es decir que sean datos iguales (como en el siguiente ejemplo)) o `restar` la informacion que puede haver entre las distintas tablas como en el siguiente ejemplo:

````SQL
-- Muestra a los alumos que esten estudiando actualmente y que ya ayan sido alumnos anteriormente y esten matriculados para el año siguiente
select nombre from alum
INTERSECT
select nombre from nuevos
INTERSECT
select nombre from antiguos;
````
  

# Subconsultas

Se pueden poner tanto en el `where` o en el `habing`

Su funcion es pocer hacer consultas dentro de consultas y conseguir *excepciones* que de otras formas serian imposibles

## Estructura

ej de idea para crear subconsultas:

	-- Con HR
	-- Mostrar los empleados que tienen el mismo oficio que 'Alexander Hunold.'
	select * from hr.employees ;
	-- 	a) obtener el puesto de Alexander
	select  employees.job_id from hr.employees where employees.first_name= 'Alexander' and employees.last_name ='Hunold';
	
	-- b) seleccionar todos los epleados que sean 'IT_PROG'
	select  employees.first_name,employees.last_name
	from hr.employees 
	where employees.job_id = 'IT_PROG';
	-- c) Juntar las 2 consultas
	select  employees.first_name,employees.last_name
	from hr.employees 
	where employees.job_id = (
	    select  employees.job_id 
	    from hr.employees
	    where employees.first_name= 'Alexander' 
	    and employees.last_name ='Hunold'
	);
 En este caso usamos el operadir `=` aunque hay mas operadores (aparte de los ya [comocidos](https://github.com/nicgrefer/basesDatos-txt/blob/main/Teoria.md#-operadores-de-comparaci%C3%B3n) ) como el `in`/`not in ` o `exists`/`not exists`

### In/Not In
Se suele usar cuando la *subconsulta* pueda proporcionar barios valores pero solo nos necesite 

```SQL
--  Mostrar los datos de los empleados que tienen un puesto = a alguno de los puestos de los empleados del departamento 20
SELECT * FROM hr.employees 
WHERE job_id IN (
    SELECT job_id FROM hr.employees  WHERE department_id = 20
);
````
mas ejemplos a partir de [aquí](https://github.com/nicgrefer/basesDatos-txt/tree/main#test-en-subconsultas-in)

>[!TIP]
>Si pones un `=` al compilar te pone: **la subconsulta de una sola fila devuelve más de una fila**. Entonces tienes que cambiarlo a `in`

### Exists/ Not Exists
Para comprobar si la consulta principal **`contiene`** algun valor. Por lo tanto en este tipo de consultas suele dar un poco igual de que datos hagas el `select` en la cubconsulta ya que aquí lo importante se encuentra en el `where`

```SQL
select * from hr.departments where exists (
	select * from hr.employees where employees.DEPARTMENT_ID =departments.DEPARTMENT_ID
	);
-------------------------------------------------------------------------------------------------
select * from hr.departments where not exists (
	select * from hr.employees where employees.DEPARTMENT_ID =departments.DEPARTMENT_ID
	);
````

# Insert 

Consiste en insertar datos en las tablas podiendo ser de dos tipos:
1. Una sola fila
2. Multifila

## Una fila

**ESTRUCTURA** --> `Insert INTO` tabla (lista de columans) `VALUES`(valor1,valor2... "Valor a introducir en las columnas")<br><br>
**Ejemplo** 
```SQL
-- Introducimos un nuevo departamento
insert into depart values(99,'I+D','VALLADOLID');
insert into depart values(90,null,null);
insert into depart (DEPT_NO,DNOMBRE) values(80,'LOGISTICA');
````

## Multitabla

**ESTRUCTURA** --> `Insert INTO` tabla (lista de columans) `SELECT`.... <br><br>
**Ejemplo** 
Primero creamos una nueva tabla

``` SQL crea tabla
CREATE TABLE EMPLE_30 (
 EMP_NO    NUMBER(4) NOT NULL,
 APELLIDO  VARCHAR2(10)  ,
 OFICIO    VARCHAR2(10)  ,
 DIR       NUMBER(4) ,
 FECHA_ALT DATE      ,
 SALARIO   NUMBER(7),
 COMISION  NUMBER(7),
 DEPT_NO   NUMBER(2) NOT NULL) ;

````
``` SQL
->Introduce en la tabla Emple_30 los empleados que trabajan en el departamento 'VENTAS'

insert into emple_30 SELECT *
FROM EMPLE, DEPART
WHERE EMPLE.EMP_NO = DEPART.EMP_NO
AND DEPART.DNOMBRE LIKE '%VENTAS%';
````

# Delet

Consiste en eliminar datos de una tabla pero no todos los datos son posibles eliminar, ya que hay algunois que son necesarios para la union entre tablas, es decir las `PK` ej:

--> Tabla 1
|Dato|Tipo dato|
|----|---------|
|ID alumno| numero|
|ID Tutor| numero|
|Clase| Character 2|
...

--> Tabla 2
|Dato|Tipo dato|
|----|---------|
|ID tutor| numero|
...


## Estructura:

`DELETE [FROM]` nombre_tabla `WHERE` (condicion)---> (No se puede elimianr todas (las que sirven de "union" entre tablas))

## Ejemplos:

    DELETE FROM DEPART 
    WHERE DEPT_NO IN (
                        SELECT DEPT_NO 
                        FROM EMPLE 
                        GROUP BY DEPT_NO
                        HAVING COUNT(*) < 4
                    );

>[!NOTE]
> [mas ejemplos](https://github.com/nicgrefer/basesDatos-txt/blob/main/ejemplos%20Borrar.md)

---
# 🛠️  `INSERT`

El comando `INSERT` se utiliza para agregar nuevas filas (registros) a una tabla. Es fundamental cuando necesitas introducir nuevos datos en tu base de datos, como registrar nuevos empleados, productos o transacciones.

---

## 🔍 **Sintaxis básica**

```sql
INSERT INTO nombre_tabla (columna1, columna2, columna3, ...)
VALUES (valor1, valor2, valor3, ...);
```

## **Explicación:**

- **`INSERT INTO`:** Es el comando que indica que queremos insertar datos.  
- **`nombre_tabla`:** Especifica la tabla donde se insertarán los nuevos registros.  
- **`(columna1, columna2, ...)`:** Lista opcional que indica en qué columnas se insertarán los valores.  
- **`VALUES`:** Palabra clave que precede a los datos que queremos insertar.  
- **`(valor1, valor2, ...)`:** Los valores que se insertarán, respetando el orden y tipo de datos de las columnas.

⚠️ **Importante:**  
- La cantidad de columnas debe coincidir con la cantidad de valores.  
- Los valores deben ser del tipo correcto (números, cadenas, fechas, etc.).

---

## 📖 **Ejemplos prácticos**

### 1️⃣ **Inserción simple (especificando columnas)**

```sql
INSERT INTO employees (employee_id, first_name, last_name, email, salary)
VALUES (101, 'John', 'Doe', 'john.doe@company.com', 50000);
```

**¿Qué pasa aquí?**

- Se inserta un nuevo empleado con ID 101, nombre "John Doe", correo electrónico "john.doe@company.com" y salario de 50,000.

---

### 2️⃣ **Inserción sin especificar columnas**

Si insertas valores para **todas las columnas** en el orden definido en la base de datos, puedes omitir la lista de columnas:

```sql
INSERT INTO employees
VALUES (102, 'Jane', 'Smith', 'jane.smith@company.com', 60000);
```

**⚠️ Precaución:**  
Esto funciona solo si conoces exactamente el orden de las columnas. Si luego se agrega o cambia una columna, esta instrucción fallará o insertará datos incorrectos.

---

### 3️⃣ **Inserción múltiple (Oracle 12c y posteriores)**

```sql
INSERT ALL
    INTO employees (employee_id, first_name, last_name, email, salary) 
    VALUES (103, 'Alice', 'Johnson', 'alice.johnson@company.com', 55000)
    INTO employees (employee_id, first_name, last_name, email, salary) 
    VALUES (104, 'Bob', 'Brown', 'bob.brown@company.com', 48000)
SELECT * FROM dual;
```

**¿Qué hace?**

- Inserta dos nuevos registros a la vez.  
- `dual` es una tabla especial en Oracle que se usa para este tipo de operaciones.

---

### 4️⃣ **Inserción a partir de una consulta (`INSERT INTO SELECT`)**

```sql
INSERT INTO employees (employee_id, first_name, last_name, email, salary)
SELECT employee_id, first_name, last_name, email, salary
FROM old_employees
WHERE hire_date < TO_DATE('2020-01-01', 'YYYY-MM-DD');
```

**¿Qué hace?**

- Copia los datos de empleados contratados antes de 2020 desde la tabla `old_employees` hacia `employees`.

---

## ⚠️ **Errores comunes y cómo evitarlos**

1. **Inconsistencia de tipos:**  
   - Si `salary` es un número, no puedes insertar una cadena.  
   - Correcto: `50000`  
   - Incorrecto: `'50000'` *(si no es tipo cadena)*.

2. **Valores nulos en columnas `NOT NULL`:**  
   - Si una columna no permite `NULL`, debes proporcionar un valor.

3. **Violación de claves primarias:**  
   - No puedes insertar un valor duplicado en una columna que es clave primaria.

---

## 🔍 **Verificación después de insertar**

Después de insertar datos, puedes usar un `SELECT` para confirmar que la operación fue exitosa:

```sql
SELECT * FROM employees WHERE employee_id = 101;
```
----


# UPDATE 
El comando UPDATE se utiliza para modificar uno o más registros existentes en una tabla. Es útil cuando necesitas corregir datos, actualizar información obsoleta o ajustar valores en función de ciertas condiciones.

## Sintaxis básica
````sql
Copiar código
UPDATE nombre_tabla
SET columna1 = valor1,
    columna2 = valor2,
    ...
WHERE condicion;
````
Explicación:
UPDATE nombre_tabla: Especifica la tabla donde quieres modificar registros.<br>
SET: Indica las columnas y los nuevos valores que deseas asignar.<br>
WHERE: Establece una condición para identificar qué registros se deben modificar.<br>
⚠️ Si no usas WHERE, ¡se actualizarán todos los registros de la tabla!<br>

## Ejemplo práctico (como el que mencionaste)
````sql
Copiar código
UPDATE employees
SET email = 'john.doe@newdomain.com'
WHERE employee_id = 1;
````
¿Qué hace este comando?

Busca el registro en la tabla employees donde employee_id sea igual a 1.
Actualiza el valor del campo email a john.doe@newdomain.com.
## 🛠️ Casos especiales
### 1. Actualizar múltiples columnas
````sql
Copiar código
UPDATE employees
SET email = 'jane.smith@newdomain.com',
    salary = 60000
WHERE employee_id = 2;
````
Esto actualiza tanto el correo como el salario del empleado con employee_id = 2.

### 2. Actualizar todos los registros (sin WHERE)
````sql
Copiar código
UPDATE employees
SET department = 'Sales';
````
Esto asigna el departamento "Sales" a todos los empleados de la tabla.<br>
⚠️ ¡Cuidado con usar esto sin pensarlo bien!

### 3. Actualizar con condiciones complejas
````sql
Copiar código
UPDATE employees
SET salary = salary * 1.1
WHERE department = 'Sales' AND hire_date < TO_DATE('2020-01-01', 'YYYY-MM-DD');
````
Aquí se aplica un aumento del 10% solo a los empleados del departamento "Sales" contratados antes de 2020.
