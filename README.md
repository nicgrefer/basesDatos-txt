# basesDatos teoria consultas 
    -- Consulta de una tabla
    -- 1. Mostrar el nº y nombre de los departamentos
    select deptno, dname from scott.dept;
    --2. mostrar todos los datos de los departamentos
    select * from scott.dept;
    --  ordenamos por nombre del departamento
    select dname, deptno from scott.dept order by dname asc;
    --3. mostramos todos los departamenrtos con ales en lascolumnas
    select dname "Nº departamento", deptno "Nombre del departamento", loc "Ubicación" from scott.dept;

----------------------------------------------------------
    --TRABAJAMOS CON CONDICIONES: WHERE condición
    select * from scott.emp;
    select * from scott.dept;
    
    desc scott.emp;
    desc scott.dept;
    
    --Mostramos los empleados cuyo salario supera los 2000€
    select emp.empno, emp.name, emp.sal from scott.emp
    where emp.sal > 2000
    order by emp.sal;
    
    --Mostrar los empleados que tienen comisiones
    select emp.empno, emp.ename, emp.deptno
    from scott.emp
    where emp.deptno = 20
    order by emp.name;
    
    --Mostrar lo empleados que tienen comisiones
    select emp.empno, emp.name, emp.comm
    from scott.emp
    where emp.comm is not null;
    
    --Mostrar los empleados que no tienen comisiones asignadas
    select emp.empno, emp.name,emp.job, emp.comm
    from scott.emp
    where emp.comm is null;
    
    --Mostrar los empleados que no tienen manager asignado
    select emp.empno, emp.name,emp.job, emp.mgr
    from scott.emp
    where emp.mgr is null;
    
    --Mostrar como quedarian los salarios de los empleados tras un incremento del 5%
    select emp.empno, emp.ename, emp.sal "Salario actual", (emp.sal * 1.05) "Salario con subida del 5%"
    from scott.emp
    order by 4 desc;
    
    --Mostrar los departamentos ubicados en 'Dallas' y 'Boston'
    select dept.*from scott.dept
    where dept.loc = 'DALLAS' or dept.loc = 'BOSTON';
    
    --Mostrar los empleados que trabajan en el departamento 10 y tienen de jefe al empleado 7839
    select emp.empno, emp.ename, emp.deptno, emp.mgr
    from scott.dept
    where emp.dept=10 and emp.mgr=7839;

--------------------------16/12/2024--------------------------------

    desc scott.emp;
    desc scott.dept;
    
    
    selectfrom scott.emp order by 4;
    ---OPERADOR BETWEEN
    selectfrom scott.emp where emp.sal between 1000 and 2000 order by emp.sal desc;
    selectfrom scott.emp where emp.sal >= 1000 and emp.sal <= 2000 order by emp.sal desc;
    
    selectfrom scott.emp where emp.sal not between 1000 and 2000 order by emp.sal desc;
    selectfrom scott.emp where emp.sal < 1000 or emp.sal > 2000 order by emp.sal desc;
    
    
    --mostrar los empleados cuyo jefe es el 7782, 7902 o 7839
    selectfrom scott.emp where emp.mgr = 7782 or emp.mgr = 7902 or emp.mgr = 7839;
    selectfrom scott.emp where emp.mgr in(7782,7902,7839);
    
    --mostras los empleados cuyo jefe NO es el 7782, 7902 o 7839 
    selectfrom scott.emp where emp.mgr not in(7782,7902,7839);
    select*from scott.emp where emp.mgr != 7782 and emp.mgr != 7902 and emp.mgr != 7839;
    
    
    --mostrar los empleados contratados en  el año  81 
    --a)
    select emp.ename, emp.hiredate from scott.emp where emp.hiredate like '%-81';
    --b)
    select emp.ename, emp.hiredate from scott.emp where emp.hiredate between '01-JAN-81' and '31-DC-81';

    
    --mostrar los empleados cuyo nombre acaba en 's'
    select emp.ename from scott.emp where emp.ename like '%s' or emp.ename like '%S';
    --mostrar los empleados cuyo nombre tiene 4 caracteres y empieza por 'A'
    select emp.ename from scott.emp where emp.ename like 'W___' or emp.ename like 'w___';
    
    -- mostrar los empleados cuya comision sea 0
    select emp.ename from scott.emp where emp.com like "null";


----------------------------------------------------
    --Prueba de funciones oracle 
    select power (2,3) from dual;
    select round (3,456.1)from dual;
    
    select floor (3.4), floor (3.8) from dual;
    
    select * from scott.emp
    -- Muest al sueldo de los empleados aplicando las comisiones (emplearemos NVL(valor,expresión))
    
    select emp.empno, emp.ename, emp.sal "salario base", emp.comm "Comisión", 
        (emp.sal+nvl(emp.comm,0)) "Sueldo + comisión"
        from scott.emp;
    
    --  Funciones de grupos de valores
    
    select sum(emp.sal) "Salario del departamento" from scott.emp  where emp.deptno=20;
    
    -- mostrar el nº de empleados que existe 
    select count (emp.comm) from scott.emp;
    select count (emp.empno) from scott.emp;
    select count ()

------------------------------------------------------
08/01/2025

-- mostrar los datos del empleado con su departamento asociado pero quiero que salga el nombre

    select * from scott.emp;
    select * from scott.dept;

-- Cualificamos los datos que sacamos para que no se repitan, para ello hay que poner condiciones

    select emp.*,dept.dname "Nombre departamento" from scott.emp, scott.dept
        where emp.deptno=dept.deptno
        order by emp.deptno;

------
    -- Consultas multitabla script empresa
    -- Mostrar los vendedores (nombre,edad,fecha de contrato)
    -- junto con la oficina (ciudad) con los que estan asignado
    -- ordenado por ventas de vendedor
    --Mostrar los vendedores junto con la oficina (ciudad) a la que están asignados
    --ordenando los resultados por ventas del vendedor
    
    select repventas.nombre, repventas.edad, repventas.contrato,
           oficinas.oficina, oficinas.ciudad, repventas.ventas
    from repventas, oficinas
    where repventas.oficina_rep = oficinas.oficina
    order by repventas.ventas;


---------------------------------------------------------------
09/01/2025 
(empresa)

    -- Mostrar las oficinas junto con sus directores
    select oficinas.oficina, oficinas.ciudad, oficinas.dir,
        repventas.num_empl,repventas.nombre, repventas.titulo
    from repventas,oficinas
    	where oficinas.dir = repventas.num_empl
    order by oficinas.oficina;


    -- Mostrar los vendedores junto con sus directores
        select vendedores.num_empl "Nº vendedoe", vendedores.nombre "Nom. vendedor",
            directores.num_empl "Nº director", directores.nombre "Nom. director"
        from repventas vendedores, repventas directores --Creamos "Tablas virtuales" crando alias para mejorar el entendimiento
    											-- ya que ambas tablas son 1 
	where vendedores.director = directores.num_empl
    order by  vendedores.num_empl;

     -----------
-------
13/01/2025

	-- 1. Muestra las reguiones con los paises a los que pertenece
	
	select regions.region_id,regions.region_name, countries.country_id
	from hr.regions, hr.countries
		where regions.region_id = countries.region_id
	order by countries.region_id;
	
	-- 2. Muestra para cada empleado (id, nombre y apellido) los trabajos que han pasado y la fecha de inicio y fin
	
	SELECT employees.employee_id, employees.first_name, employees.last_name,
	       job_history.start_date, job_history.end_date, job_history.job_id
	FROM hr.employees, hr.job_history
	 where employees.employee_id = job_history.employee_id
	ORDER BY 3;
	
	-- 2.V2
	
	SELECT employees.employee_id, employees.first_name, employees.last_name,
	       job_history.start_date, job_history.end_date, job_history.job_id
	FROM hr.employees, hr.job_history, hr.jobs
	 	where employees.employee_id = job_history.employee_id
	    and jobs.job_id = job_history.job_id
	ORDER BY 3;
	
	-- 3. Muestra los empleados que tienen de jefe al empleado con código 100 o 108.
	-- 	Ademas que tenguen un salario de mas de 5000$, mostrando el puesto que ocupan y su salario
	
	select employees.employee_id, employees.first_name, employees.last_name, employees.manager_id,employees.salary,
	    jobs.job_id, jobs.job_title
	from hr.employees, hr.jobs
		where employees.job_id=jobs.job_id
		and employees.manager_id in (100,108)
		and employees.salary>5000;
	
	-- 3.V2
	
	select emp.employee_id, emp.first_name, emp.last_name, emp.manager_id,mg.first_name, mg.last_name,
	    emp.salary,
	    jobs.job_id, jobs.job_title
	from hr.employees emp, hr.jobs,hr.employees mg
		where emp.job_id=jobs.job_id
	    and emp.manager_id=mg.employee_id
		and emp.manager_id in (100,108)
		and emp.salary>5000
	order by 1;
	
	-- 4. Muestra las localidades junto con los departamentos que  
	
	SELECT locations.*, departments.department_id, departments.department_name
	FROM hr.locations, hr.departments
		where locations.location_id = departments.location_id
	order by departments.department_id;
	
	-- 4.V2
	
	SELECT locations.*, departments.department_id, departments.department_name
	FROM hr.locations, hr.departments
		where locations.location_id = departments.location_id
	    and locations.country_id <> 'US'
	order by departments.department_id;


----
revisar para que funcione 14/01/2025
	
	-- 6. mostrar los departamentos junto con el nombre del director 
	
	select departments.department_id "ID departamento",departments.department_name "Nombre Departamento", employees.employee_id "ID director"
	from hr.departments, hr.job_history
		where departments.manager_id =employees.manager_id;
	
	-- 6.V2 Que tamben muestre los que no tienen director
	select departments.department_id "ID departamento",departments.department_name "Nombre Departamento", job_history.employee_id "ID director"
	from hr.departments, hr.job_history
		where departments.manager_id =job_history.employee_id
	    or departments.manager_id is null;


-----
20/01/2025

Group by

	-- Muestra el salario medio por departamentos
	
	select * from hr.departments;
	select * from hr.employees order by  department_id;
	
	SELECT employees.department_id AS "id departamento",
	       departments.department_name AS "Nombre departamento", 
	       ROUND(AVG(employees.salary), 4) AS "media salario departamento"
	FROM hr.employees, hr.departments
	WHERE employees.department_id = departments.department_id
	GROUP BY employees.department_id, departments.department_name
	ORDER BY employees.department_id;
	
	
	-- Muestra el numero de cada paises que hay en cada región
	
	select * from hr.regions ;
	select * from hr.countries order by countries.region_id;
	
	
	SELECT countries.region_id AS "id Region",regions.region_name "Region", COUNT(*) AS "Numero de Paises"
	FROM hr.countries, hr.regions
	    where countries.region_id=regions.region_id
	GROUP BY countries.region_id,regions.region_name
	ORDER BY countries.region_id;
	
	-- Muestra el numero de empleados que tiene cada manager a su cargo
	
	select * from hr.employees order by  manager_id;
	
	select employees.manager_id , count (*) "Nº de empleados a su cargo"
	from hr.employees
	group by employees.manager_id
	order by 2 desc;
	
	-- Muestra el numero qde enpleados que hay en cada departamento
	
	select employees.department_id "id departamento" , count (*) "nº se empleados en departamento"
	from hr.employees
	group by employees.department_id
	order by employees.department_id;
	
	
	-- Muestra el numero de rotaciones ha realizado dentro de la empresa
	
	select job_history.employee_id "Id empleado", count (*) "nº rotaciones empleado"
	from  hr.job_history
	group by job_history.employee_id;
	
	
	
	-- Todabia no sabemos
	-- Muestra el numero de empleados que han pasado (rotado) por mas de un puesto en la empresa

