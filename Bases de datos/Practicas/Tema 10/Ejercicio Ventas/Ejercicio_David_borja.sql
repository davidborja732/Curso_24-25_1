--
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
--
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