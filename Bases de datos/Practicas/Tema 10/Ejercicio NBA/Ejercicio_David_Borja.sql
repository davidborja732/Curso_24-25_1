-- 1
CREATE PROCEDURE nba.Ejercicio_1(in nombre_equipo VARCHAR(20))
begin
	select ciudad,conferencia,division from equipos where nombre=nombre_equipo;
END
-- 2
CREATE PROCEDURE nba.Ejercicio_2()
begin
	select equipos.*, COUNT(jugadores.codigo) from equipos
	join jugadores on equipos.id_equipo=jugadores.equipo
	where jugadores.equipo=equipos.id_equipo
	group by equipo.id_equipo;
END
-- 3
CREATE PROCEDURE nba.Ejercicio_3(in nombre_jugador VARCHAR(20))
begin
	select jugadores.nombre,estadisticas.Puntos_por_partido,estadisticas.temporada from jugadores 
	join estadisticas on jugadores.codigo=estadisticas.jugador
	where jugadores.nombre=nombre_jugador;
END
-- 4
CREATE PROCEDURE nba.Ejercicio_4(in nombre_jugador VARCHAR(20))
begin
	SET sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
	select jugadores.nombre,MAX(estadisticas.Puntos_por_partido),AVG(estadisticas.Puntos_por_partido),MIN(estadisticas.Puntos_por_partido) from jugadores 
	join estadisticas on jugadores.codigo=estadisticas.jugador
	where jugadores.nombre=nombre_jugador;
END
-- 5 

-- 6

-- 7

-- 8
