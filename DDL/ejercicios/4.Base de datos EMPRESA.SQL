<<<<<<< Updated upstream
-- 17. Se  considera  que  la  tabla PRODUCTOS  sufre  pocas  operaciones  de  alta  de  nuevos  registros  o eliminación  de  registros,  y  el  único  campo  que  sufre  actualizaciones  frecuentes  es  el  campo EXISTENCIAS.  Por  otro  lado,  es  frecuente  consultar  los  productos  por  el  campo  DESCRIPCION (aunque varios productos puedan tener la misma descripción). ¿Se podría mejorar la base de datos? Si es así, indica de qué forma y escribe la  instrucción correspondiente. En cualquier caso justifica la  respuesta. 


=======
-- 17. Se  considera  que  la  tabla PRODUCTOS  sufre  pocas  operaciones  de  alta  de  nuevos  registros  o eliminación  de  registros,  y  el  único  campo  que  sufre  actualizaciones  frecuentes  es  el  campo EXISTENCIAS.  Por  otro  lado,  es  frecuente  consultar  los  productos  por  el  campo  DESCRIPCION (aunque varios productos puedan tener la misma descripción). ¿Se podría mejorar la base de datos? Si es así, indica de qué forma y escribe la  instrucción correspondiente. En cualquier caso justifica la respuesta. 

/*  
    Si, se podria inscrivir al campo DESCRIPCION un indice no unico, ya que varios productos pueden tener la misma descripcion.
    De esta forma se podria mejorar la busqueda de productos por descripcion. 
*/
>>>>>>> Stashed changes

-- 18. ¿Qué se puede hacer para que no puedan existir en la tabla de CLIENTES dos clientes con el mismo nombre? 


<<<<<<< Updated upstream

-- 19. En  nuestro  sistema  vamos  a  efectuar  muchas  consultas  recuperando  a  la  vez  los  pedidos  y  los  productos asociados a cada uno de ellos. Escribe la sentencia SQL correspondiente para optimizar la base de datos. 



-- 20. Ahora queremos permitir que dos clientes tengan el mismo nombre.

=======
-- 19. En  nuestro  sistema  vamos  a  efectuar  muchas  consultas  recuperando  a  la  vez  los  pedidos  y  los productos asociados a cada uno de ellos. Escribe la sentencia SQL correspondiente para optimizar  la base de datos. 

-- 20. Ahora queremos permitir que dos clientes tengan el mismo nombre. 
>>>>>>> Stashed changes


-- 21. Activa la monitorización de todos los índices creados. A continuación, comprueba si los índices han sido utilizados. 


<<<<<<< Updated upstream

-- 22. Escribe las sentencias SQL que muestren los índices de cada tabla y el tamaño que ocupan. 



-- 23. Crea  una secuencia  que  pueda  utilizarse  para introducir  nuevos  vendedores en  la  base  de  datos.Haz una prueba. 


=======
-- 22. Escribe las sentencias SQL que muestren los índices de cada tabla y el tamaño que ocupan. 


-- 23. Crea  una secuencia  que  pueda  utilizarse  para introducir  nuevos  vendedores en  la  base  de  datos.  Haz una prueba.
>>>>>>> Stashed changes
