-- 1
UPDATE productos SET precio_venta=precio_venta*1.10;
ROLLBACK
-- 2
UPDATE productos SET precio_venta=precio_venta*1.04; 
-- 3
SELECT nombre,precio_venta,precio_venta*1.04 AS precio_subida FROM productos

-- 4
UPDATE productos SET precio_venta=precio_venta*1.04
WHERE id_categoria IN (SELECT id_categoria FROM cartagorias WHERE descripcion="Ropa");
-- 5
ALTER TABLE pedidos_historico MODIFY precio_total DECIMAL(7,2);
ALTER TABLE pedidos MODIFY precio_total DECIMAL(7,2);
-- 6
ROLLBACk;  
-- 7
INSERT INTO pedidos_historico SELECT * FROM pedidos;
-- 8
UPDATE productos SET precio_venta=precio_venta*0.05 WHERE id_categoria IN (SELECT id_categoria FROM categorias WHERE descripcion="Ropa");
UPDATE detalles_pedidos SET precio=precio*0.05 WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE id_categoria IN (SELECT id_categoria FROM categorias WHERE descripcion="Ropa"));
-- 9
  
-- 10
rollback;
Funciona correctamente
-- 11
 
-- 12

-- 13

-- 14
