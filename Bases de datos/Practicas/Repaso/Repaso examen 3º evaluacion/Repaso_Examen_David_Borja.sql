-- 1. Incrementar en un 20% el precio de los productos que no aparezcan en ningún pedido
UPDATE producto
SET precio = precio * 1.2
WHERE codigo_producto NOT IN (SELECT DISTINCT codigo_producto FROM detalle_pedido);

-- 2. Incrementar el límite de crédito en un 20% para clientes que hayan comprado productos 'Ornamentales'
UPDATE cliente
SET limite_credito = limite_credito * 1.2
WHERE codigo_cliente IN (
    SELECT DISTINCT codigo_cliente
    FROM pedido
    JOIN detalle_pedido USING (codigo_pedido)
    JOIN producto USING (codigo_producto)
    WHERE gama = 'Ornamentales'
);

-- 3. Creación de usuario, permisos y vista
CREATE USER AWEB IDENTIFIED BY 'aweb';

GRANT CREATE VIEW TO AWEB;

CREATE VIEW vista_empleado AS
SELECT * FROM empleado;

GRANT ALL PRIVILEGES ON vista_empleado TO AWEB;

INSERT INTO empleado (codigo_empleado, nombre, apellido1, extension, email, codigo_oficina)
VALUES (
    (SELECT MAX(codigo_empleado) + 1 FROM vista_empleado),
    'Ana', 'Lopez', '2837', 'ana@jardineria.es', 'TAL-ES'
);

-- 4. Reducción en un 20% del precio de productos cuyo coste sea mayor que la media de la gama 'Herramientas'
UPDATE producto
SET precio = precio * 0.8
WHERE coste > (SELECT AVG(coste) FROM producto WHERE gama = 'Herramientas');

-- 5. Procedimiento para actualizar comentarios de pedidos retrasados
DELIMITER $$

CREATE PROCEDURE actualizar_comentarios_retraso(IN codigo INT)
BEGIN
    DECLARE comentario_actual VARCHAR(255);
    DECLARE entregado DATE;
    DECLARE cursor_pedido CURSOR FOR
        SELECT comentarios, fecha_entrega
        FROM pedido WHERE codigo_pedido = codigo;

    OPEN cursor_pedido;
    FETCH cursor_pedido INTO comentario_actual, entregado;

    IF entregado > (SELECT fecha_esperada FROM pedido WHERE codigo_pedido = codigo) THEN
        UPDATE pedido SET comentarios = CONCAT(comentario_actual, ' - Entrega retrasada')
        WHERE codigo_pedido = codigo;
    END IF;

    CLOSE cursor_pedido;
END$$

DELIMITER ;

-- 6. Procedimiento para contar clientes atendidos por empleados de una oficina
DELIMITER $$

CREATE PROCEDURE contar_clientes_por_oficina(IN codigo_oficina VARCHAR(10))
BEGIN
    DECLARE cantidad INT;

    IF NOT EXISTS (SELECT codigo_oficina FROM oficina WHERE codigo_oficina = codigo_oficina) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La oficina introducida no existe';
    ELSE
        SELECT COUNT(DISTINCT codigo_cliente)
        INTO cantidad
        FROM cliente
        WHERE codigo_cliente IN (
            SELECT codigo_cliente FROM pedido WHERE codigo_empleado IN (
                SELECT codigo_empleado FROM empleado WHERE codigo_oficina = codigo_oficina
            )
        );

        SELECT cantidad AS 'Número de clientes atendidos';
    END IF;
END$$

DELIMITER ;

-- 7. Función para obtener importe de pedido o producto más caro
DELIMITER $$

CREATE FUNCTION obtener_datos_pedido(codigo_pedido INT, opcion INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE resultado DECIMAL(10,2);

    IF opcion = 1 THEN
        SELECT SUM(precio * cantidad) INTO resultado FROM detalle_pedido
        WHERE codigo_pedido = codigo_pedido;
    ELSEIF opcion = 2 THEN
        SELECT nombre INTO resultado FROM producto
        WHERE codigo_producto = (
            SELECT codigo_producto FROM detalle_pedido WHERE codigo_pedido = codigo_pedido ORDER BY precio DESC LIMIT 1
        );
        SET resultado = -1;
    END IF;

    RETURN resultado;
END$$

DELIMITER ;

-- 8. Función para obtener el importe total de los pedidos de un cliente
DELIMITER $$

CREATE FUNCTION total_pedidos_cliente(codigo_cliente INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(obtener_datos_pedido(codigo_pedido, 1)) INTO total
    FROM pedido WHERE codigo_cliente = codigo_cliente;

    RETURN total;
END$$

DELIMITER ;

-- 9. Trigger para guardar productos borrados en la tabla productos_antiguos
CREATE TRIGGER guardar_producto_borrado
AFTER DELETE ON producto
FOR EACH ROW
BEGIN
    INSERT INTO productos_antiguos (codigo_producto, nombre, fecha_borrado)
    VALUES (OLD.codigo_producto, OLD.nombre, NOW());

    DELETE FROM detalle_pedido WHERE codigo_producto = OLD.codigo_producto;
END;

