# Lenguaje SQL - DDL (Data Definition Language)

## 1. Introducción al DDL

El **DDL (Data Definition Language)** es un subconjunto del lenguaje SQL que se utiliza para definir y gestionar la estructura de los objetos en una base de datos relacional, como tablas, vistas, índices o secuencias. A diferencia del **DML (Data Manipulation Language)**, que se centra en manipular los datos (inserciones, actualizaciones, borrados), el DDL se ocupa de los **metadatos**, es decir, la definición de cómo se organizan los datos en el sistema gestor de bases de datos (SGBD).

### Funciones principales del DDL
- **Creación** de objetos (tablas, vistas, índices, etc.) con `CREATE`.
- **Modificación** de la estructura de los objetos existentes con `ALTER`.
- **Eliminación** de objetos con `DROP` o vaciado de datos con `TRUNCATE`.

### Características importantes
- Las instrucciones DDL son **permanentes**: una vez ejecutadas, no se pueden deshacer con un `ROLLBACK`, ya que generan un **commit implícito**. Por eso, es crucial planificar bien su uso y contar con copias de seguridad.
- Cada usuario tiene un **esquema** asociado (normalmente con su mismo nombre), donde se almacenan sus objetos (tablas, vistas, etc.). Solo los propietarios o administradores pueden modificarlos, salvo que se otorguen permisos específicos.

---

## 2. Creación de Tablas (`CREATE TABLE`)

La sentencia `CREATE TABLE` permite definir una nueva tabla en la base de datos, especificando sus columnas, tipos de datos y restricciones.

### 2.1. Sintaxis básica
```sql
CREATE TABLE nombre_tabla (
    columna1 tipo_dato [restricciones],
    columna2 tipo_dato [restricciones],
    [TABLESPACE espacio_de_tabla]
);
```
- **nombre_tabla**: Nombre único de la tabla dentro del esquema.
- **columnaX**: Nombre de cada columna.
- **tipo_dato**: Tipo de dato de la columna (ej.: `VARCHAR2(50)`, `NUMBER(10,2)`, `DATE`).
- **restricciones**: Reglas como `NOT NULL`, `PRIMARY KEY`, etc.
- **TABLESPACE**: Espacio físico donde se almacenará la tabla (opcional, gestionado por el administrador).

### 2.2. Ejemplo básico
Imaginemos que queremos crear una tabla para almacenar información de estudiantes:
```sql
CREATE TABLE estudiantes (
    id_estudiante NUMBER(5) NOT NULL,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    fecha_nacimiento DATE,
    nota_media NUMBER(4,2)
);
```
- `id_estudiante`: Identificador único, obligatorio (no puede ser nulo).
- `nombre` y `apellido`: Cadenas de hasta 50 caracteres, opcionales.
- `fecha_nacimiento`: Fecha en formato estándar.
- `nota_media`: Número con 2 decimales (ej.: 7.85).

Si intentamos crear otra tabla con el mismo nombre, el SGBD (como Oracle) devolverá un error: *"ORA-00955: name is already used by an existing object"*.

### 2.3. Creación a partir de una consulta (`AS SELECT`)
Podemos crear una tabla copiando datos de otra tabla existente:
```sql
CREATE TABLE estudiantes_destacados
AS
SELECT id_estudiante, nombre, apellido
FROM estudiantes
WHERE nota_media >= 8.5;
```
- La nueva tabla hereda los tipos de datos de las columnas seleccionadas.
- No es necesario especificar tipos ni restricciones explícitamente.
- Las restricciones con nombre (como una `PRIMARY KEY`) no se copian, solo las implícitas (como `NOT NULL`).

### 2.4. Consultar tablas creadas
Para ver las tablas de nuestro esquema:
```sql
SELECT table_name FROM USER_TABLES;
```
Esto devuelve una lista de todas las tablas que hemos creado, como `estudiantes` o `estudiantes_destacados`.

---

## 3. Restricciones (`CONSTRAINTS`)

Las restricciones garantizan la **integridad de los datos** en la base de datos, asegurando que se cumplan ciertas reglas al insertar o modificar información.

### 3.1. Tipos de restricciones
1. **`PRIMARY KEY`**: Identifica de forma única cada fila. No admite duplicados ni nulos.
2. **`FOREIGN KEY`**: Relaciona una columna con una `PRIMARY KEY` de otra tabla.
3. **`NOT NULL`**: Obliga a que la columna tenga un valor.
4. **`DEFAULT`**: Asigna un valor por defecto si no se especifica.
5. **`CHECK`**: Limita los valores permitidos según una condición.
6. **`UNIQUE`**: Impide duplicados, pero permite nulos (a diferencia de `PRIMARY KEY`).

### 3.2. Sintaxis con restricciones
#### Restricción a nivel de columna
```sql
CREATE TABLE empleados (
    id_empleado NUMBER(5) CONSTRAINT pk_empleado PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    salario NUMBER(8,2) DEFAULT 1000,
    edad NUMBER(3) CHECK (edad >= 18)
);
```
- `pk_empleado`: Nombre de la restricción de clave primaria.
- `NOT NULL`: El nombre es obligatorio.
- `DEFAULT 1000`: Si no se especifica salario, se asigna 1000.
- `CHECK (edad >= 18)`: Solo permite edades mayores o iguales a 18.

#### Restricción a nivel de tabla
```sql
CREATE TABLE departamentos (
    dept_no NUMBER(2),
    nombre VARCHAR2(30),
    CONSTRAINT pk_dept PRIMARY KEY (dept_no)
);
```
- La restricción se define al final, separada de las columnas.

### 3.3. Ejemplo completo con claves primaria y foránea
```sql
CREATE TABLE departamentos (
    dept_no NUMBER(2),
    nombre VARCHAR2(30),
    CONSTRAINT pk_dept PRIMARY KEY (dept_no)
);

CREATE TABLE empleados (
    id_empleado NUMBER(5) CONSTRAINT pk_emp PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    dept_no NUMBER(2),
    CONSTRAINT fk_emp_dept FOREIGN KEY (dept_no) REFERENCES departamentos (dept_no)
);
```
- `fk_emp_dept`: La columna `dept_no` en `empleados` debe coincidir con un valor existente en `departamentos.dept_no`.

---

## 4. Modificación de Tablas (`ALTER TABLE`)

La sentencia `ALTER TABLE` permite modificar la estructura de una tabla existente.

### 4.1. Añadir columnas
```sql
ALTER TABLE estudiantes
ADD (email VARCHAR2(100));
```
- Añade una columna `email`, inicialmente con valores nulos para las filas existentes.

Si queremos que sea `NOT NULL`, debemos:
1. Añadirla sin la restricción:
   ```sql
   ALTER TABLE estudiantes ADD (email VARCHAR2(100));
   ```
2. Rellenarla con datos:
   ```sql
   UPDATE estudiantes SET email = 'sin_email@ejemplo.com';
   ```
3. Aplicar `NOT NULL`:
   ```sql
   ALTER TABLE estudiantes MODIFY (email VARCHAR2(100) NOT NULL);
   ```

### 4.2. Modificar columnas
```sql
ALTER TABLE estudiantes
MODIFY (nota_media NUMBER(5,2));
```
- Amplía la capacidad de `nota_media` a 5 dígitos (ej.: 99.99).
- No se puede reducir el tamaño si los datos existentes superan el nuevo límite.

### 4.3. Eliminar columnas
```sql
ALTER TABLE estudiantes
DROP COLUMN fecha_nacimiento;
```
- Elimina la columna permanentemente. No se puede deshacer.

### 4.4. Gestionar restricciones
- Añadir:
  ```sql
  ALTER TABLE estudiantes
  ADD CONSTRAINT pk_estudiante PRIMARY KEY (id_estudiante);
  ```
- Eliminar:
  ```sql
  ALTER TABLE estudiantes
  DROP CONSTRAINT pk_estudiante;
  ```
- Desactivar:
  ```sql
  ALTER TABLE empleados
  DISABLE CONSTRAINT fk_emp_dept;
  ```
- Activar:
  ```sql
  ALTER TABLE empleados
  ENABLE CONSTRAINT fk_emp_dept;
  ```

---

## 5. Eliminación de Tablas

### 5.1. `DROP TABLE`
Elimina la tabla y su definición por completo:
```sql
DROP TABLE estudiantes CASCADE CONSTRAINTS;
```
- `CASCADE CONSTRAINTS`: Borra también las restricciones referenciales (como claves foráneas) que dependan de esta tabla.

### 5.2. `TRUNCATE TABLE`
Elimina todos los datos, pero conserva la estructura:
```sql
TRUNCATE TABLE estudiantes;
```
- Es más rápido que `DELETE` porque no genera información de rollback.
- No se puede usar si hay claves foráneas activas referenciando la tabla.

---

## 6. Vistas (`CREATE VIEW`)

Las vistas son tablas virtuales basadas en consultas a tablas reales. No almacenan datos propios, sino que reflejan los datos de las tablas base.

### 6.1. Crear una vista
```sql
CREATE OR REPLACE VIEW vista_empleados_dept10
AS
SELECT id_empleado, nombre
FROM empleados
WHERE dept_no = 10;
```
- `OR REPLACE`: Sobreescribe la vista si ya existe.
- Solo muestra empleados del departamento 10.

### 6.2. Vista con restricciones
```sql
CREATE OR REPLACE VIEW vista_empleados_dept10
AS
SELECT id_empleado, nombre, dept_no
FROM empleados
WHERE dept_no = 10
WITH CHECK OPTION;
```
- `WITH CHECK OPTION`: Impide insertar o modificar filas que no cumplan la condición (`dept_no = 10`).

### 6.3. Eliminar una vista
```sql
DROP VIEW vista_empleados_dept10;
```

---

## 7. Índices

Los índices mejoran la velocidad de las consultas al permitir búsquedas más rápidas.

### 7.1. Crear un índice
```sql
CREATE INDEX idx_nombre ON empleados (nombre);
```
- Acelera consultas como `SELECT * FROM empleados WHERE nombre = 'Juan'`.

### 7.2. Índices automáticos
Se crean automáticamente con `PRIMARY KEY` y `UNIQUE`.

### 7.3. Monitorizar uso
```sql
ALTER INDEX idx_nombre MONITORING USAGE;
SELECT * FROM USER_INDEXES WHERE index_name = 'IDX_NOMBRE';
```

---

## 8. Secuencias

Generan valores numéricos únicos, ideales para claves primarias.

### 8.1. Crear una secuencia
```sql
CREATE SEQUENCE seq_estudiantes
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;
```

### 8.2. Usar una secuencia
```sql
INSERT INTO estudiantes (id_estudiante, nombre)
VALUES (seq_estudiantes.NEXTVAL, 'Ana');
```
- `NEXTVAL`: Genera el siguiente valor.
- `CURRVAL`: Devuelve el valor actual sin avanzar.

### 8.3. Eliminar
```sql
DROP SEQUENCE seq_estudiantes;
```

---

## 9. Conclusión

El DDL es esencial para diseñar y mantener bases de datos robustas. Con `CREATE`, `ALTER` y `DROP`, definimos la estructura; las restricciones aseguran la integridad; y herramientas como vistas, índices y secuencias optimizan su uso. Su naturaleza permanente exige precaución y buena planificación.

