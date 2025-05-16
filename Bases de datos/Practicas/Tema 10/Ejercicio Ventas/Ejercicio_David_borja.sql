-- 1
CREATE PROCEDURE ventas.Ejercicio_1()
BEGIN
	DECLARE v_apellido_cliente VARCHAR(50);
	DECLARE v_fecha DATE;
	DECLARE fin_cursor BOOL DEFAULT FALSE;
	 -- Declartacion cursor
	DECLARE cursor1 CURSOR FOR 
		SELECT clientes.apellidos,pedidos.fecha_pedido FROM clientes
		JOIN pedidos USING(id_cliente)
		ORDER BY clientes.apellidos;
	-- Declaramos manejo de errores para el cursor
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor=true;
	OPEN cursor1;
	bucle_cursor : LOOP
		FETCH cursor1 INTO v_apellido_cliente,v_fecha;
		IF fin_cursor THEN 
			LEAVE bucle_cursor;
		END IF;
		SELECT CONCAT(v_apellido_cliente," lo pidio en la fecha ",v_fecha) AS resultado;
	END LOOP;
	-- cerramos cursor1
	CLOSE cursor1;
END
-- 2
CREATE PROCEDURE ventas.Ejercicio_2()
BEGIN
	DECLARE v_descripcion VARCHAR(50);
	DECLARE v_num_productos INT;
	DECLARE fin_cursor BOOL DEFAULT FALSE;
	 -- Declartacion cursor
	DECLARE cursor1 CURSOR FOR 
		SELECT categorias.descripcion,count(*) FROM productos
		JOIN categorias USING(id_categoria)
		GROUP BY descripcion;
	-- Declaramos manejo de errores para el cursor
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor=true;
	OPEN cursor1;
	bucle_cursor : LOOP
		FETCH cursor1 INTO v_descripcion,v_num_productos;
		IF fin_cursor THEN 
			LEAVE bucle_cursor;
		END IF;
		SELECT CONCAT(v_descripcion," tiene ",v_num_productos) AS resultado;
	END LOOP;
	-- cerramos cursor1
	CLOSE cursor1;
END
CREATE PROCEDURE ventas.Ejercicio_3()
BEGIN 
-- 3
CREATE PROCEDURE ventas.eje3(apellido varchar(75))
BEGIN
	declare v_apellido varchar(50);
	declare v_id_cliente int;
	declare v_count int default -1 ;
	declare fin_cursor bool default FALSE;

	declare cursor1 cursor for
	select apellidos,id_cliente from
	clientes where apellidos like concat('%',apellido,'%');
	
	declare continue handler for not found set fin_cursor = true;
	
	open cursor1;
	
	bucle_cursor: loop
		
		fetch cursor1 into v_apellido,v_id_cliente;
		
		set v_count = v_count+1;
	
		if fin_cursor then
			leave bucle_cursor;
		End if;
		
		select CONCAT(v_apellido," ",v_id_cliente);
		
	end loop;
	
	SELECT v_count;
	close cursor1;
END
-- 4
CREATE PROCEDURE ventas.Ejercicio_4()
BEGIN
	declare v_apellido varchar(50);
	declare v_count int default -1 ;
	declare fin_cursor bool default FALSE;
	declare cursor1 cursor for
		select apellidos,SUM(pedidos.precio_total) AS total from clientes
		JOIN pedidos USING(id_cliente)
		ORDER BY SUM(pedidos.precio_total);
END
-- 5
CREATE PROCEDURE ventas.Ejercicio_5()
BEGIN
	DECLARE v_categoria INt;
	DECLARE v_nombre_producto VARCHAR(50);
	DECLARE v_suma INT;
	DECLARE fin_productos BOOL DEFAULT FALSE;
	DECLARE fin_categoria BOOL DEFAULT FALSE;
	DECLARE cursor_categorias CURSOR FOR 
		SELECT id_categoria FROM categorias;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_categoria=TRUE;
	OPEN cursor_categorias;
	bucle_categorias: LOOP 
		FETCH cursor_categorias INTO v_categoria;
		IF fin_categoria THEN 
			LEAVE bucle_categorias;
		END IF;
		BEGIN 
			DECLARE cursor_producto CURSOR FOR 
				SELECT p.nombre, SUM(dp.cantidad) FROM productos p
				JOIN detalles_pedidos dp USING (numero_producto)
				WHERE id_categoria=v_categoria
				GROUP BY p.nombre,id_categoria
				ORDER BY SUM(dp.cantidad) ASC
				limit 2;
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_categoria=TRUE;
			OPEN cursor_producto;
			bucle_producto: LOOP
				FETCH cursor_producto INTO v_nombre_producto,v_suma;
				IF fin_productos THEN 
					LEAVE bucle_producto;
				END IF;
				SELECT CONCAT(v_nombre_producto,' ',v_suma,' ',v_categoria);
				
			END LOOP bucle_producto;
			CLOSE cursor_producto;
			SET fin_categoria=FALSE;
		END;
	END LOOP bucle_categorias;
END
-- 6
CREATE PROCEDURE ventas.Ejercicio_6(IN p_descripcion VARCHAR(75))
BEGIN
	DECLARE v_id_cat INT;
	DECLARE v_existe INT;
	SELECT MAX(id_categoria) INTO v_id_cat FROM categorias;
	DECLARE categoria_existe CONDITION FOR SQLSTATE '45000';
	
	SELECT COUNT(*) INTO v_existe FROM categorias WHERE descripcion=p_descripcion;
	IF v_existe !=0 THEN 
		SIGNAL categoria_existe SET MESSAGE_TEXT='Ya existe esta descripcion';
	ELSE
		SET v_id_cat=v_id_cat+1;
		INSERT INTO categorias VALUES(v_id_cat,p_descripcion);
	END IF;
END
-- 7
CREATE PROCEDURE ventas.Ejercicio_7(IN u_numero_producto INT,IN u_nombre VARCHAR(75),IN u_descripcion VARCHAR(100),INT u_precio_venta DECIMAL(10,2),IN u_stock INT,INT u_id_categoria INT)
BEGIN
	INSERT INTO productos VALUES (u_numero_producto,u_nombre,u_descripcion,u_precio_venta,u_stock);	
END
-- 8
CREATE PROCEDURE ventas.Ejercicio_8(IN u_id_categoria INT,IN aumento INT)
BEGIN
	UPDATE productos SET precio_venta=precio_venta*aumento WHERE id_categoria=u_id_categoria;
END
-- 9
CREATE PROCEDURE ventas.Ejercicio_9()
BEGIN
	DECLARE v_precio_venta DECIMAL(10,2);
	DECLARE v_numero_producto INT;
	DECLARE v_id_categoria INT;
	DECLARE v_precio_medio DECIMAL(10,2);
	DECLARE v_precio_nuevo DECIMAL(10,2);
	DECLARE v_precio_diferencia DECIMAL(10,2);

	DECLARE fin_cursor_productos BOOL DEFAULT FALSE;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	DECLARE cursor_productos CURSOR FOR
	SELECT Numero_producto,precio_venta,id_categoria FROM productos;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor_productos=TRUE;
	OPEN cursor_productos;
    WHILE NOT fin_cursor_productos DO 
    	FETCH cursor_productos INTO v_numero_producto,v_precio_venta,v_id_categoria;
		SELECT AVG(precio_venta) INTO v_precio_medio FROM productos 
		WHERE id_categoria=v_id_categoria;
	
		IF v_precio_venta<v_precio_medio THEN
			SET v_precio_diferencia=v_precio_venta - v_precio_medio;
			SET v_precio_nuevo=v_precio_venta + v_precio_diferencia*0.50;
			UPDATE productos SET precio_venta=v_precio_nuevo WHERE numero_producto=v_numero_producto;
		END IF;
	END WHILE;
	CLOSE cursor_productos;
	
END
-- 10
DELIMITER //

CREATE PROCEDURE ListarIngresos()
BEGIN
    SELECT
        p.id AS 'Número de pedido',
        c.apellidos AS 'Cliente',
        e.apellidos AS 'Empleado que atendió',
        p.fechaCreacion AS 'Fecha del pedido',
        pr.nombre AS 'Nombre de producto',
        lp.cantidad AS 'Unidades pedidas',
        lp.precio_por_unidad AS 'Precio por unidad',
        (SELECT COUNT(*) FROM LineaPedido WHERE pedido_id = p.id) AS 'Número de líneas del pedido',
        SUM(lp.cantidad * lp.precio_por_unidad) AS 'Importe total del pedido'
    FROM Pedido p
    JOIN Cliente c ON p.cliente_id = c.id
    JOIN Empleado e ON p.empleado_id = e.id
    JOIN LineaPedido lp ON p.id = lp.pedido_id
    JOIN Producto pr ON lp.producto_id = pr.id
    GROUP BY p.id, c.apellidos, e.apellidos, p.fechaCreacion, pr.nombre, lp.cantidad, lp.precio_por_unidad;
   
    
    SELECT
        c.apellidos AS 'Cliente',
        SUM(p.total) AS 'Importe total de pedidos del cliente'
    FROM Pedido p
    JOIN Cliente c ON p.cliente_id = c.id
    GROUP BY c.apellidos;
   
    SELECT
        SUM(total) AS 'Importe total de todos los pedidos'
    FROM Pedido;
END //

DELIMITER ;


-- 11
DELIMITER //
CREATE PROCEDURE Ejercicio_11()
BEGIN
    DELETE FROM T_INGRESOS;  
    INSERT INTO T_INGRESOS (numero_pedido, cliente_apellidos, empleado_apellidos, fecha_pedido, importe_total)
    SELECT 
        p.id AS numero_pedido,
        c.apellidos AS cliente_apellidos,
        e.apellidos AS empleado_apellidos,
        p.fechaCreacion AS fecha_pedido,
        SUM(lp.cantidad * lp.precio_por_unidad) AS importe_total
    FROM Pedido p
    JOIN Cliente c ON p.cliente_id = c.id
    JOIN Empleado e ON p.empleado_id = e.id
    JOIN LineaPedido lp ON p.id = lp.pedido_id
    GROUP BY p.id, c.apellidos, e.apellidos, p.fechaCreacion;    
    SELECT 'Los ingresos han sido guardados correctamente en T_INGRESOS' AS mensaje;
END //
DELIMITER ;
