USE `nba`;
-- Ejercicio 1
DROP TABLE IF EXISTS `AUDITORIA`;
CREATE TABLE `AUDITORIA` (
  `fecha_hora` datetime DEFAULT NULL,
  `tipo_operacion` varchar(50) DEFAULT NULL,
  `descripcion_evento` text
);
-- Ejercicio 2
DELIMITER $$
CREATE TRIGGER `trg_entrenadores_insercion`
AFTER INSERT ON `entrenadores`
FOR EACH ROW
BEGIN
  INSERT INTO `AUDITORIA` (`fecha_hora`, `tipo_operacion`, `descripcion_evento`)
  VALUES (NOW(), 'INSERCION', CONCAT('ENTRENADORES: ', NEW.dni));
END$$
DELIMITER ;
-- Ejercicio 3
DELIMITER $$
CREATE TRIGGER `trg_entrenadores_modificacion`
AFTER UPDATE ON `entrenadores`
FOR EACH ROW
BEGIN
  DECLARE descripcion_cambio TEXT;
  SET descripcion_cambio = CONCAT('ENTRENADORES - ID: ', OLD.id_entrenador);
  IF OLD.nombre <> NEW.nombre THEN
    SET descripcion_cambio = CONCAT(descripcion_cambio, ', Nombre: ', OLD.nombre, ' -> ', NEW.nombre);
  END IF;
  IF OLD.equipo <> NEW.equipo THEN
    SET descripcion_cambio = CONCAT(descripcion_cambio, ', Equipo: ', OLD.equipo, ' -> ', NEW.equipo);
  END IF;
  IF OLD.dni <> NEW.dni THEN
    SET descripcion_cambio = CONCAT(descripcion_cambio, ', DNI: ', OLD.dni, ' -> ', NEW.dni);
  END IF;
  INSERT INTO `AUDITORIA` (`fecha_hora`, `tipo_operacion`, `descripcion_evento`)
  VALUES (NOW(), 'MODIFICACION', descripcion_cambio);
END$$
DELIMITER ;
-- Ejercicio 4
DELIMITER $$
CREATE TRIGGER `trg_estadisticas_antes_insercion`
BEFORE INSERT ON `estadisticas`
FOR EACH ROW
BEGIN
  IF NEW.Puntos_por_partido < 0 THEN
    SET NEW.Puntos_por_partido = 0;
  END IF;
  IF NEW.Asistencias_por_partido < 0 THEN
    SET NEW.Asistencias_por_partido = 0;
  END IF;
  IF NEW.Rebotes_por_partido < 0 THEN
    SET NEW.Rebotes_por_partido = 0;
  END IF;
END$$
DELIMITER ;
-- Ejercicio 5
ALTER TABLE `entrenadores`
ADD COLUMN `email` VARCHAR(100) AFTER `nombre`;-- Ejercicio 6
DELIMITER $$
CREATE TRIGGER `trg_entrenadores_generar_email`
BEFORE INSERT ON `entrenadores`
FOR EACH ROW
BEGIN
  IF NEW.email IS NULL THEN
    SET NEW.email = CONCAT(REPLACE(NEW.nombre, ' ', ''), '@test.com');
  END IF;
END$$
DELIMITER ;
-- Ejercicio 7
DELIMITER $$
CREATE TRIGGER `trg_equipos_limite_ciudad`
BEFORE INSERT ON `equipos`
FOR EACH ROW
BEGIN
  DECLARE equipos_en_ciudad INT;
  SELECT COUNT(*) INTO equipos_en_ciudad
  FROM `equipos`
  WHERE `ciudad` = NEW.ciudad;  IF equipos_en_ciudad >= 5 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: No se pueden tener más de 5 equipos por ciudad.';
  END IF;
END$$
DELIMITER ;
-- Ejercicio 8
DELIMITER $$
CREATE TRIGGER `trg_jugadores_limite_salario`
BEFORE UPDATE ON `jugadores`
FOR EACH ROW
BEGIN
  IF NEW.salario > OLD.salario * 1.20 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El incremento salarial no puede ser superior al 20%.';
  END IF;
END$$
DELIMITER ;
-- Ejercicio 9
DELIMITER $$
CREATE TRIGGER `trg_partidos_puntos_minimos`
BEFORE INSERT ON `partidos`
FOR EACH ROW
BEGIN
  IF NEW.puntos_local < 0 THEN
    SET NEW.puntos_local = 0;
  END IF;
  IF NEW.puntos_visitante < 0 THEN
    SET NEW.puntos_visitante = 0;
  END IF;
END$$
DELIMITER ;
-- Ejercicio 10
DROP TABLE IF EXISTS `AUDITORIA_SALARIOS`;
CREATE TABLE `AUDITORIA_SALARIOS` (
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_jugador` int DEFAULT NULL,
  `salario_anterior` decimal(10,2) DEFAULT NULL,
  `salario_nuevo` decimal(10,2) DEFAULT NULL
);
