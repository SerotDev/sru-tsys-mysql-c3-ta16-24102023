-- EJERCICIO 3

-- 3.1. Obtener todos los almacenes
SELECT * FROM almacenes;

-- 3.2. Obtener todas las cajas cuyo contenido tenga un valor superior a 150 €.
select * from cajas where VALOR > 150;

-- 3.3. Obtener los tipos de contenidos de las cajas.
select distinct CONTENIDO from cajas;

-- 3.4. Obtener el valor medio de todas las cajas.
select avg(VALOR) as VALOR_MEDIO_TOTAL from cajas;

-- 3.5. Obtener el valor medio de las cajas de cada almacen.
select ALMACEN, avg(VALOR) as VALOR_MEDIO from cajas group by ALMACEN;

-- 3.6. Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150 €.
select ALMACEN, avg(VALOR) as VALOR_MEDIO from cajas group by ALMACEN having avg(VALOR) > 150;

-- 3.7. Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra.
select NUMREFERENCIA, LUGAR from almacenes inner join cajas on almacenes.CODIGO = cajas.ALMACEN;

-- 3.8. Obtener el numero de cajas que hay en cada almacén.
select ALMACEN, count(ALMACEN) as NUMERO_DE_CAJAS from cajas group by ALMACEN;

-- 3.9. Obtener los códigos de los almacenes que están saturados (los almacenes donde el numero de cajas es superior a la capacidad).
select CODIGO as CODIGO_ALMACENES_SATURADOS from almacenes where CAPACIDAD < (select count(NUMREFERENCIA) from cajas where ALMACEN = CODIGO);

-- 3.10. Obtener los numeros de referencia de las cajas que están en Bilbao.
select NUMREFERENCIA, LUGAR from cajas inner join almacenes on CODIGO = cajas.ALMACEN where LUGAR = 'Bilbao';

-- 3.11. Insertar un nuevo almacén en Barcelona con capacidad para 3 cajas.
select @next_codigo_almacenes := max(CODIGO)+1 from almacenes;
insert into almacenes values(@next_codigo_almacenes,'Barcelona',3);

-- 3.12. Insertar una nueva caja, con número de referencia 'H5RT', con contenido 'Papel', valor 200, y situada en el almacén 2.
insert into cajas values('H5RT','Papel',200,2);

-- 3.13. Rebajar el valor de todas las cajas un 15%.
update cajas set VALOR = VALOR * 0.85 where NUMREFERENCIA is not null;

-- 3.14. Rebajar un 20% el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas.
select @valor_medio_cajas := avg(VALOR) from cajas;
update cajas set VALOR = VALOR * 0.80 where VALOR > @valor_medio_cajas;

-- 3.15. Eliminar todas las cajas cuyo valor sea inferior a 100 €.
delete from cajas where VALOR < 100;

-- 3.16. Vaciar el contenido de los almacenes que están saturados
delete from almacenes where CAPACIDAD < (select count(NUMREFERENCIA) from cajas where ALMACEN = almacenes.CODIGO);