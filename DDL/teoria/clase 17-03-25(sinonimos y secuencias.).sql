
-- Sinonimos
SELECT * FROM user_synonyms;
SELECT * FROM all_synonyms;


-- -> Creaccion para tabas de HR : Employees y departments

create or replace synonym my_emple for hr.Employees;
create or replace synonym my_depart for hr.departments;

select * from my_emple;

-- Secuencias
select * from user_sequences;

-- -> ejer secuencia que genere el numeramineto de la calse 'emple' 
select * from emple;

CREATE SEQUENCE secuencia_autocreciente
START WITH 1
MINVALUE 1
MAXVALUE 9999
INCREMENT BY 1;

desc emple;

insert into emple (EMP_NO,APELLIDO,DEPT_NO) values (secuencia_autocreciente.nextval,'Pepe',18);
insert into emple (EMP_NO,APELLIDO,DEPT_NO) values (secuencia_autocreciente.nextval,'Ana',20);

select * from emple order by 1; 




