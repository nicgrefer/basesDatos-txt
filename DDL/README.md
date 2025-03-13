# 🔖 Apuntes de DDL (Data Definition Language)

## 🌐 Introducción

- **DDL** es la parte de SQL que se encarga de definir y gestionar la estructura de las bases de datos.
- Se usa para **crear, modificar y eliminar** objetos como tablas, vistas e índices.
- Las instrucciones **DDL no pueden deshacerse** con `ROLLBACK`, así que hay que usarlas con precaución.

---

## 🏢 Creación de Tablas (`CREATE TABLE`)

### ✅ Sintaxis básica:
```sql
CREATE TABLE nombre_tabla (
    columna1 tipo_dato [NOT NULL],
    columna2 tipo_dato [DEFAULT valor],
    columna3 tipo_dato [CHECK (condición)],
    PRIMARY KEY (columna1)
) [TABLESPACE espacio_de_tabla];
```

### 🔎 Observaciones:
- No se pone coma tras la última columna.
- Se pueden consultar las tablas creadas con `USER_TABLES`.
- Si una tabla con ese nombre ya existe, dará error.

### 🎯 Creación a partir de `SELECT`
```sql
CREATE TABLE nueva_tabla AS
SELECT * FROM otra_tabla;
```

---

## 👀 Vistas

- Son **tablas lógicas** que muestran datos de una o varias tablas reales.
- Ayudan a simplificar consultas y mejorar la seguridad.

### 🔧 Crear una vista:
```sql
CREATE OR REPLACE VIEW nombre_vista AS
SELECT columna1, columna2 FROM tabla_base;
```

- `WITH CHECK OPTION` asegura que los cambios respeten las restricciones de la vista.

### ❌ Eliminar una vista:
```sql
DROP VIEW nombre_vista;
```

---

## 🏛️ Restricciones

### ⚠️ Tipos:
1. **`PRIMARY KEY`**: Identifica de forma única cada fila.
2. **`FOREIGN KEY`**: Relaciona dos tablas asegurando integridad referencial.
3. **`NOT NULL`**: La columna no puede contener valores nulos.
4. **`DEFAULT`**: Asigna un valor por defecto si no se especifica otro.
5. **`CHECK`**: Restringe los valores permitidos en una columna.
6. **`UNIQUE`**: Evita valores repetidos en una columna.

---

## ♻️ Modificación de Tablas (`ALTER TABLE`)

- **Añadir columnas:**
```sql
ALTER TABLE nombre_tabla ADD (nueva_columna tipo_dato);
```

- **Modificar columnas:**
```sql
ALTER TABLE nombre_tabla MODIFY columna_existente tipo_dato;
```

- **Eliminar columnas:**
```sql
ALTER TABLE nombre_tabla DROP COLUMN columna_a_eliminar;
```

- **Añadir/eliminar restricciones:**
```sql
ALTER TABLE nombre_tabla ADD CONSTRAINT restriccion;
ALTER TABLE nombre_tabla DROP CONSTRAINT restriccion;
```

---

## 🛠️ Eliminación de Tablas (`DROP TABLE`)

- **Eliminar tabla y restricciones:**
```sql
DROP TABLE nombre_tabla CASCADE CONSTRAINTS;
```

- **Vaciar tabla sin eliminar su estructura:**
```sql
TRUNCATE TABLE nombre_tabla;
```

---

## 🏰 Índices

- Mejoran el rendimiento de las consultas acelerando la búsqueda de datos.
- Se crean automáticamente con `PRIMARY KEY` y `UNIQUE`.

### 🆓 Crear un índice:
```sql
CREATE INDEX nombre_indice ON nombre_tabla (columna1);
```

---

## ♾️ Secuencias

- Generan números únicos secuenciales, útiles para claves primarias.

### ⚙️ Crear una secuencia:
```sql
CREATE SEQUENCE nombre_secuencia START WITH 1 INCREMENT BY 1;
```

- Obtener el siguiente valor:
```sql
SELECT nombre_secuencia.NEXTVAL FROM dual;
```

- Eliminar una secuencia:
```sql
DROP SEQUENCE nombre_secuencia;
```

---

## 📈 Monitorización de índices

- Para saber si un índice se usa:
```sql
ALTER INDEX nombre_indice MONITORING USAGE;
```
- Para dejar de monitorizar:
```sql
ALTER INDEX nombre_indice NOMONITORING USAGE;
```

---

## 🎯 Conclusión

- DDL nos permite definir la estructura de la base de datos de manera organizada.
- Hay que usar `DROP`, `TRUNCATE` y `ALTER` con cuidado, porque no se pueden deshacer.
- Las restricciones ayudan a mantener la integridad de los datos.
- Las vistas y los índices mejoran la eficiencia y seguridad.
- Las secuencias son útiles para generar identificadores únicos.



