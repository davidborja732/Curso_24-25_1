USE `ventas`;
-- Ejercicio 1: Crear AUDITACATEGORIAS y triggers de inserción y borrado
DROP TABLE IF EXISTS `AUDITACATEGORIAS`;
CREATE TABLE `AUDITACATEGORIAS` (
  `fecha_auditoria` datetime DEFAULT NULL,
  `id_categoria_auditada` int DEFAULT NULL,
  `tipo_operacion` varchar(20) DEFAULT NULL
);DELIMITER $$CREATE TRIGGER `trg_categorias_insercion`
AFTER INSERT ON `categorias`
FOR EACH ROW
BEGIN
  INSERT INTO `AUDITACATEGORIAS` (`fecha_auditoria`, `id_categoria_auditada`, `tipo_operacion`)
  VALUES (NOW(), NEW.id_categoria, 'INSERCIÓN');
END$$CREATE TRIGGER `trg_categorias_borrado`
AFTER DELETE ON `categorias`
FOR EACH ROW
BEGIN
  INSERT INTO `AUDITACATEGORIAS` (`fecha_auditoria`, `id_categoria_auditada`, `tipo_operacion`)
  VALUES (NOW(), OLD.id_categoria, 'BORRADO');
END$$DELIMITER ;
-- Ejercicio 2: Añadir 'detalle_datos' y trigger de actualización
ALTER TABLE `AUDITACATEGORIAS`
ADD COLUMN `detalle_datos` TEXT;DELIMITER $$CREATE TRIGGER `trg_categorias_actualizacion`
AFTER UPDATE ON `categorias`
FOR EACH ROW
BEGIN
  DECLARE cambios_registrados TEXT;
  SET cambios_registrados = CONCAT(
    'Nombre Antiguo: ', OLD.nombre, ', Nombre Nuevo: ', NEW.nombre
  );
  INSERT INTO `AUDITACATEGORIAS` (`fecha_auditoria`, `id_categoria_auditada`, `tipo_operacion`, `detalle_datos`)
  VALUES (NOW(), NEW.id_categoria, 'MODIFICACIÓN', cambios_registrados);
END$$DELIMITER ;-- Ejercicio 3: Añadir columnas a CLIENTES
ALTER TABLE `clientes`
ADD COLUMN `fecha_ultima_modificacion` DATE,
ADD COLUMN `tipo_ultima_modificacion` VARCHAR(20),
ADD COLUMN `modificado_por_usuario` VARCHAR(100);-- Ejercicio 4: Función para obtener el siguiente ID de CLIENTES
DELIMITER $$CREATE FUNCTION `obtener_siguiente_id_cliente`() RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE siguiente_id INT;
  SELECT IFNULL(MAX(id_cliente), 0) + 1 INTO siguiente_id FROM clientes;
  RETURN siguiente_id;
END$$DELIMITER ;-- Ejercicio 5: Trigger de inserción en CLIENTES usando la función
DELIMITER $$CREATE TRIGGER `trg_clientes_antes_insercion`
BEFORE INSERT ON `clientes`
FOR EACH ROW
BEGIN
  SET NEW.id_cliente = obtener_siguiente_id_cliente();
  SET NEW.fecha_ultima_modificacion = CURDATE();
  SET NEW.tipo_ultima_modificacion = 'INSERCIÓN';
  SET NEW.modificado_por_usuario = CURRENT_USER();
END$$DELIMITER ;-- Ejercicio 6: Trigger de actualización en CLIENTES
DELIMITER $$CREATE TRIGGER `trg_clientes_despues_actualizacion`
AFTER UPDATE ON `clientes`
FOR EACH ROW
BEGIN
  UPDATE `clientes`
  SET
    `fecha_ultima_modificacion` = CURDATE(),
    `tipo_ultima_modificacion` = 'ACTUALIZACIÓN',
    `modificado_por_usuario` = CURRENT_USER()
  WHERE `id_cliente` = NEW.id_cliente;
END$$DELIMITER ;-- Ejercicio 7: Creación simulada de la tabla POBLACIONES (asumiendo que el script ya se ejecutó)
DROP TABLE IF EXISTS `POBLACIONES`;
CREATE TABLE `POBLACIONES` (
  `id_poblacion` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre_poblacion` VARCHAR(100),
  `codigo_postal` VARCHAR(10) UNIQUE
);INSERT INTO `POBLACIONES` (`nombre_poblacion`, `codigo_postal`) VALUES
('Madrid', '28001'),
('Barcelona', '08002'),
('Valencia', '46003'),
('Sevilla', '41004'),
('Zaragoza', '50001'),
('Toledo', '45001'),
('Dosbarrios', '45137'),
('Escalonilla', '45915'),
('Castroviejo', '26637');-- Ejercicio 8: Trigger para validar código postal en CLIENTES
DELIMITER $$CREATE TRIGGER `trg_clientes_validar_cp`
BEFORE INSERT ON `clientes`
FOR EACH ROW
BEGIN
  DECLARE existe_cp INT;
  SELECT COUNT(*) INTO existe_cp FROM `POBLACIONES` WHERE `codigo_postal` = NEW.codigo_postal;
  IF existe_cp = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El código postal del cliente no existe en la tabla POBLACIONES.';
  END IF;
END$$DELIMITER ;-- Ejercicio 9: Crear copia_pedidos_historicos
DROP TABLE IF EXISTS `copia_pedidos_historicos`;
CREATE TABLE `copia_pedidos_historicos` LIKE `pedidos`;-- Ejercicio 10: Evento para archivar pedidos antiguos
SET GLOBAL event_scheduler = ON;DELIMITER $$CREATE EVENT `evt_archivar_pedidos_antiguos`
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    INSERT INTO `copia_pedidos_historicos` (`id_pedido`, `id_cliente`, `fecha_pedido`, `total`)
    SELECT `id_pedido`, `id_cliente`, `fecha_pedido`, `total`
    FROM `pedidos`
    WHERE `fecha_pedido` < '2008-01-01'
    ON DUPLICATE KEY UPDATE
        `id_cliente` = VALUES(`id_cliente`),
        `fecha_pedido` = VALUES(`fecha_pedido`),
        `total` = VALUES(`total`);    DELETE FROM `pedidos`
    WHERE `fecha_pedido` < '2008-01-01';
END$$DELIMITER ;