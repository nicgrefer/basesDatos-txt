--Coprobamos si tiene privilegios para crear usuarios
create user user4 IDENTIFIED by user4; -- ❌

-- Intentamos hacer un select sobre la tabla 1 del user1

select * from user1.tabla1; --❌ Necesita privilegios por eso pone que no existe
-- Damos privilegios desde el user1 y repetimos...... ✅


--Ahora intentamos hacer un insert sobre la taba del user1
INSERT INTO USER1.tabla1 (col1, col2) VALUES (1,'aaa'); -- ❌ Aunque tengamos acceso al select de esa tabla no tenemos el privilegio para poder hacer insert. 
-- Una vaz dado el privilegio del INSERT tambien ay que darle una cuota --> solo lo puede hacer DBA

-- Ahora intentamos modificar la columna 1 de la tabla 1 de user1 y lo mismo para la otra columna (columna 2)

UPDATE USER1.tabla1 set COL1 = 999; --❌ No le dimos permiso para la columna 1
UPDATE USER1.tabla1 set COL2 = 'Nuevo dato'; -- ✅ Le dimos permisos para la columan 2

