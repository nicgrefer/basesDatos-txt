select * from user_tables;
select * from user_objects; 
select * from user_constraints;


CREATE TABLE personas (
    dni        VARCHAR2(9) PRIMARY KEY,
    nombre     VARCHAR2(100) NOT NULL,
    apellido   VARCHAR2(100) NOT NULL,
    edad       INTEGER CHECK (edad > 0),
    altura     NUMBER(3,2),
    fecha_mac  DATE DEFAULT SYSDATE
);
CREATE table provincias(

    codigo_provincia	char(2)		CONSTRAINT  prbincia_pk primary key,
    nombre_provincia	varchar(50) not null
);

alter table provincias
	add(
    	supoerficie		integer,
    	havitantes 		integer		constraint havitantes_positivo check(havitantes>0)
    );

-- Modificamos el tipo de datos superficie 
alter table provincias
    modify(
    	supoerficie 	number(8,2)
    );

-- Eliminamos la columna havitantes
alter table provincias 
    drop column havitantes;

-- Desabiñitamos la resstriccion de provincia
alter table provincias 
    disable constraint prbincia_pk;



desc provincias;
