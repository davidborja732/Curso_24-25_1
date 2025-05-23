-- 1
CREATE PROCEDURE jardineria.Ejercicio_1()
BEGIN
	update producto SET precio_venta=precio_venta*0.2 WHERE codigo_producto NOT IN (SELECT codigo_producto FROM detalle_pedido);
END
-- 2
CREATE PROCEDURE jardineria.Ejercicio_2()
BEGIN
	update cliente SET limite_credito=(SELECT SUM(total)*0,2 FROM pago) 
	WHERE codigo_cliente IN (SELECT codigo_cliente FROM pedido WHERE codigo_pedido IN (SELECT codigo_pedido FROM detalle_pedido WHERE codigo_producto IN (SELECT codigo_producto FROM producto WHERE gama IN (SELECT gama FROM gama_producto WHERE gama="Ornamentales"))));  
END
-- 3

-- 4

-- 5

-- 6

-- 7

-- 8

-- 9
