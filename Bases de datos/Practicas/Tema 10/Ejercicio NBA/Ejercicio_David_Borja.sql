USE `nba`;
-- Ejercicio 1
DELIMITER $$
CREATE PROCEDURE `obtener_datos_equipo`(IN nombre_equipo VARCHAR(50))
BEGIN
  SELECT ciudad, conferencia FROM equipos WHERE nombre = nombre_equipo;
END$$
DELIMITER ;
-- Ejercicio 2
DELIMITER $$
CREATE PROCEDURE `mostrar_equipos_y_jugadores`()
BEGIN
  SELECT e.nombre, e.ciudad, e.conferencia, COUNT(j.id_jugador) AS numero_jugadores
  FROM equipos e
  LEFT JOIN jugadores j ON e.id_equipo = j.equipo
  GROUP BY e.id_equipo;
END$$
DELIMITER ;
-- Ejercicio 3
DELIMITER $$
CREATE PROCEDURE `mostrar_estadisticas_jugador`(IN nombre_jugador VARCHAR(50))
BEGIN
  SELECT j.nombre, e.temporada, e.Puntos_por_partido
  FROM jugadores j
  JOIN estadisticas e ON j.id_jugador = e.jugador
  WHERE j.nombre = nombre_jugador;
END$$
DELIMITER ;
-- Ejercicio 4
DELIMITER $$
CREATE PROCEDURE `mostrar_max_min_media_puntos`(IN nombre_jugador VARCHAR(50))
BEGIN
  SELECT MAX(e.Puntos_por_partido) AS maximo_puntos,
         MIN(e.Puntos_por_partido) AS minimo_puntos,
         AVG(e.Puntos_por_partido) AS media_puntos
  FROM jugadores j
  JOIN estadisticas e ON j.id_jugador = e.jugador
  WHERE j.nombre = nombre_jugador;
END$$
DELIMITER ;
-- Ejercicio 5
DELIMITER $$
CREATE PROCEDURE `actualizar_salario_jugadores`()
BEGIN
  UPDATE jugadores j
  SET j.salario = (SELECT SUM(e.Puntos_por_partido) * 50
                   FROM estadisticas e
                   WHERE e.jugador = j.id_jugador);
END$$
DELIMITER ;
-- Ejercicio 6
DELIMITER $$
CREATE FUNCTION `obtener_estadisticas_por_posicion`(id_jugador_param INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE posicion_jugador VARCHAR(20);
  DECLARE resultado DECIMAL(10,2);  SELECT posicion INTO posicion_jugador FROM jugadores WHERE id_jugador = id_jugador_param;  IF posicion_jugador = 'Base' THEN
    SELECT SUM(Asistencias_por_partido) INTO resultado FROM estadisticas WHERE jugador = id_jugador_param;
  ELSEIF posicion_jugador = 'Alero' THEN
    SELECT SUM(Rebotes_por_partido) INTO resultado FROM estadisticas WHERE jugador = id_jugador_param;
  ELSEIF posicion_jugador = 'Pívot' THEN
    SELECT SUM(Puntos_por_partido) INTO resultado FROM estadisticas WHERE jugador = id_jugador_param;
  ELSE
    SELECT SUM(Puntos_por_partido) INTO resultado FROM estadisticas WHERE jugador = id_jugador_param;
  END IF;  RETURN resultado;
END$$
DELIMITER ;
-- Ejercicio 7
DELIMITER $$
CREATE PROCEDURE `mostrar_estadisticas_jugador_por_id`(IN id_jugador_param INT)
BEGIN
  SELECT J.nombre, obtener_estadisticas_por_posicion(id_jugador_param) AS estadistica_calculada
  FROM jugadores J
  WHERE J.id_jugador = id_jugador_param;
END$$
DELIMITER ;
-- Ejercicio 8
DELIMITER $$
CREATE PROCEDURE `mostrar_estadisticas_jugadores_equipo`(IN nombre_equipo_param VARCHAR(50))
BEGIN
  SELECT J.nombre, obtener_estadisticas_por_posicion(J.id_jugador) AS estadistica_calculada
  FROM jugadores J
  JOIN equipos E ON J.equipo = E.id_equipo
  WHERE E.nombre = nombre_equipo_param;
END$$
DELIMITER ;-- Ejercicio 9
DELIMITER $$
CREATE PROCEDURE `listar_todos_jugadores_y_equipos`()
BEGIN
  DECLARE hecho INT DEFAULT FALSE;
  DECLARE id_equipo_actual INT;
  DECLARE nombre_equipo_actual VARCHAR(50);
  DECLARE nombre_jugador_actual VARCHAR(50);
  DECLARE id_jugador_actual INT;  DECLARE cursor_equipos CURSOR FOR SELECT id_equipo, nombre FROM equipos;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET hecho = TRUE;  DROP TEMPORARY TABLE IF EXISTS temp_lista_jugadores;
  CREATE TEMPORARY TABLE temp_lista_jugadores (
    nombre_equipo VARCHAR(50),
    nombre_jugador VARCHAR(50)
  );  OPEN cursor_equipos;  bucle_equipos: LOOP
    FETCH cursor_equipos INTO id_equipo_actual, nombre_equipo_actual;
    IF hecho THEN
      LEAVE bucle_equipos;
    END IF;    BEGIN
      DECLARE hecho_jugadores INT DEFAULT FALSE;
      DECLARE cursor_jugadores CURSOR FOR SELECT id_jugador, nombre FROM jugadores WHERE equipo = id_equipo_actual;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET hecho_jugadores = TRUE;      OPEN cursor_jugadores;
      bucle_jugadores: LOOP
        FETCH cursor_jugadores INTO id_jugador_actual, nombre_jugador_actual;
        IF hecho_jugadores THEN
          LEAVE bucle_jugadores;
        END IF;
        INSERT INTO temp_lista_jugadores (nombre_equipo, nombre_jugador) VALUES (nombre_equipo_actual, nombre_jugador_actual);
      END LOOP bucle_jugadores;
      CLOSE cursor_jugadores;
    END;  END LOOP bucle_equipos;
  CLOSE cursor_equipos;  SELECT * FROM temp_lista_jugadores;
  DROP TEMPORARY TABLE temp_lista_jugadores;
END$$
DELIMITER ;-- Ejercicio 10
DROP TABLE IF EXISTS `entrenadores_nuevos`;
CREATE TABLE `entrenadores_nuevos` (
  `dni_entrenador` varchar(20) PRIMARY KEY,
  `nombre` varchar(50),
  `procedencia` varchar(50),
  `equipo` int,
  FOREIGN KEY (`equipo`) REFERENCES `equipos`(`id_equipo`)
);INSERT INTO `entrenadores_nuevos` (`dni_entrenador`, `nombre`, `procedencia`, `equipo`) VALUES
('77788899A', 'Pep Guardiola', 'España', NULL),
('12345678B', 'Phil Jackson', 'EEUU', 1);DELIMITER $$
CREATE PROCEDURE `insertar_entrenador`(
  IN p_dni VARCHAR(20),
  IN p_nombre VARCHAR(50),
  IN p_procedencia VARCHAR(50),
  IN p_nombre_equipo VARCHAR(50)
)
BEGIN
  DECLARE id_equipo_asociado INT;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar el entrenador. Verifique los datos.';
  END;  SELECT id_equipo INTO id_equipo_asociado FROM equipos WHERE nombre = p_nombre_equipo;  IF id_equipo_asociado IS NULL AND p_nombre_equipo IS NOT NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El equipo especificado no existe.';
  END IF;  START TRANSACTION;
  INSERT INTO `entrenadores_nuevos` (`dni_entrenador`, `nombre`, `procedencia`, `equipo`)
  VALUES (p_dni, p_nombre, p_procedencia, id_equipo_asociado);
  COMMIT;
END$$
DELIMITER ;

