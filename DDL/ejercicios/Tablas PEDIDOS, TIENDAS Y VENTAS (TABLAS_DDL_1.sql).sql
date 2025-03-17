-- 1. Modifica  las  columnas  de  la  tabla  PEDIDOS para  que  las  UNIDADES_PEDIDAS  puedan  almacenar cantidades numéricas de 6 dígitos. 

select * from pedidos;

ALTER TABLE PEDIDOS MODIFY UNIDADES_PEDIDAS NUMBER(6,0);

desc pedidos;


-- 2.  A partir de la tabla TIENDAS impide que se den de alta más tiendas en la provincia de 'TOLEDO'

/* No funciona
ALTER TABLE TIENDAS 
ADD CONSTRAINT chk_no_tiendas_toledo 
CHECK (PROVINCIA <> 'TOLEDO');
*/

-- 3.  Añade a las tablas  PEDIDOS  y VENTAS  una nueva columna para que almacenen el PVP del artículo. 

ALTER TABLE PEDIDOS ADD PVP NUMBER(4,0);
ALTER TABLE VENTAS ADD PVP NUMBER(4,0);


