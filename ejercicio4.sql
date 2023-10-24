-- EJERCICIO 4

-- 4.1. Mostrar el nombre de todas las películas.
select NOMBRE from peliculas;

-- 4.2. Mostrar las distintas calificaciones de edad que existen.
select distinct CALIFICACIONEDAD from peliculas where CALIFICACIONEDAD is not null;

-- 4.3. Mostrar todas las películas que no han sido calificadas. 
select * from peliculas where CALIFICACIONEDAD is null;

-- 4.4. Mostrar todas las salas que no proyectan ninguna película.
select * from salas where PELICULA is null;

-- 4.5. Mostrar la información de todas las salas y, si se proyecta alguna película en la sala, mostrar también la información de la película.
select * from salas left join peliculas on peliculas.CODIGO = salas.PELICULA;

-- 4.6. Mostrar la información de todas las películas y, si se proyecta en alguna sala, mostrar también la información de la sala.
select * from peliculas left join salas on salas.PELICULA = peliculas.CODIGO;

-- 4.7. Mostrar los nombres de las películas que no se proyectan en ninguna sala.
select NOMBRE from peliculas where CODIGO not in (select PELICULA from salas where PELICULA is not null);

-- 4.8. Añadir una nueva película 'Uno, Dos, Tres', para mayores de 7 años.
select @next_codigo_peliculas := max(CODIGO)+1 from peliculas;
insert into peliculas VALUES(@next_codigo_peliculas,'Uno, Dos, Tres','PG');

-- 4.9. Hacer constar que todas las películas no calificadas han sido calificadas 'no recomendables para menores de 13 años'.
update peliculas set CALIFICACIONEDAD = 'PG-13' where CALIFICACIONEDAD is null;

-- 4.10. Eliminar todas las salas que proyectan películas recomendadas para todos los públicos.
delete from salas where PELICULA in(select CODIGO from peliculas where CALIFICACIONEDAD = 'G');