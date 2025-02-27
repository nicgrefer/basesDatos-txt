````
create table provincias (
    
);

CREATE TABLE personas (
    dni        VARCHAR2(9),
    nombre     VARCHAR2(100),
    apellido   VARCHAR2(100),
    edad       INTEGER,
    altura 	   number (3,2),
    fecha_mac  date,
    constraint personas_pk primary key (dni),
    constraint nombre_req check (nombre not is null),
    constraint apellido_req check (apellido not is null),
    constraint edad_positiva check (edad > 0),
    constraint fecha_nadc_defaul check (fecha_nac = sysdate)
);
````
