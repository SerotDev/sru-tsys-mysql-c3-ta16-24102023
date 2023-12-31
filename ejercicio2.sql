﻿-- EJERCICIO 2

-- 2.1. Obtener los apellidos de los empleados.
select APELLIDOS from empleados;

-- 2.2. Obtener los apellidos de los empleados sin repeticiones.
select distinct APELLIDOS from empleados;

-- 2.3. Obtener todos los datos de los empleados que se apellidan 'Smith'
select * from empleados where APELLIDOS = 'Smith';

-- 2.4. Obtener todos los datos de los empleados que se apellidan 'Smith' y los que se apellidan 'Rogers'.
select * from empleados where APELLIDOS in ('Smith','Rogers');

-- 2.5. Obtener todos los datos de los empleados que trabajan para el departamento 14.
select * from empleados where Departamento = 14;

-- 2.6. Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77.
select * from empleados where DEPARTAMENTO in (37,77);

-- 2.7. Obtener todos los datos de los empleados cuyo apellido comience por 'P'.
select * from empleados where APELLIDOS like 'P%';

-- 2.8. Obtener el presupuesto total de todos los departamentos.
select sum(PRESUPUESTO) as PRESUPUESTO_TOTAL from departamentos;

-- 2.9. Obtener el numero de empleados en cada departamento.
select DEPARTAMENTO, count(DEPARTAMENTO) as CANTIDAD_EMPLEADOS from empleados group by DEPARTAMENTO;

-- 2.10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
select * from empleados inner join departamentos on empleados.DEPARTAMENTO = departamentos.CODIGO;

-- 2.11. Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento.
select e.NOMBRE, APELLIDOS, d.NOMBRE as DEPARTAMENTO, PRESUPUESTO as PRESUPUESTO_DEPARTAMENTO from empleados e inner join departamentos d on e.DEPARTAMENTO = d.CODIGO;

-- 2.12. Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000€.
select NOMBRE, APELLIDOS from empleados where DEPARTAMENTO in (select CODIGO from departamentos where PRESUPUESTO > 60000);

-- 2.13. Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.
select * from departamentos where PRESUPUESTO > (select avg(PRESUPUESTO) from departamentos);

-- 2.14. Obtener los nombres (únicamente los nombres) de los departamentos que tienen más de dos empleados.
select NOMBRE from departamentos where CODIGO in (select DEPARTAMENTO from empleados group by DEPARTAMENTO having count(DEPARTAMENTO) >2);

-- 2.15. Añadir un nuevo departamento: 'Calidad', con presupuesto de 40.000 € y código11. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI: 89267109.
insert into departamentos values (11,'Calidad',40000);

-- 2.16. Aplicar un recorte presupuestario del 10% a todos los departamentos.
update departamentos set PRESUPUESTO = PRESUPUESTO * 0.9 where codigo is not null;

-- 2.17. Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14).
update empleados set DEPARTAMENTO = 14 where DEPARTAMENTO = 77;

-- 2.18. Despedir a todos los empleados que trabajan para el departamento de informática (código 14).
delete from empleados where DEPARTAMENTO = 14;

-- 2.19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €.
delete from empleados where DEPARTAMENTO in (select CODIGO from departamentos where PRESUPUESTO >= 60000);

-- 2.20. Despedir a todos los empleados.
delete from empleados where DNI is not null;
