-- 1
update detalles_pedidos 
set precio = precio * 0.95
where numero_pedido in (select numero_pedido
from pedidos where id_cliente in 
(select id_cliente from pedidos
where fecha_pedido like '2007-10-%'
group by id_cliente
having sum(precio_total)>20000));
-- 3
update pedidos pe 
set precio_total =(select sum(precio*cantidad) 
from detalles_pedidos dp
where dp.numero_pedido = pe.numero_pedido
group by numero_pedido)
where pe.id_cliente in (select id_cliente 
from (select * from pedidos) as tabla
where fecha_pedido
like '2007-10-%'
group by id_cliente
having sum(precio_total)>20000);
--3
where id_categoria = 2 and p.precio_venta <= round (1.45 * (select min(precio_por_mayor)
from productos_proveedores pv
where p.numero_producto = pv.numero_producto));
--4
update productos p
set precio_venta = round (1.35 * (select max(precio_por_mayor)
from productos_proveedores pv
where p.numero_producto = pv.numero_producto),0)
where id_categoria = (select id_categoria where id_categoria like '%Accesorios%');
--5
insert into empleados (id_empleado, nombre, apellidos, direccion, ciudad, provincia, cod_postal, codigo_area, telefono)values ((select max(id_empleado) + 1 from (select * from empleados) as emp), 'Susana', 'Maroto', 
'Pinares 16', 'Villamanta', 'MADRID', '28610', 425, '555-7825');
--6  
insert into empleados (select ((select max(id_empleado) + 1 from (select * from empleados) as emp)),nombre, apellidos, direccion, ciudad, provincia, cod_postal, codigo_area, telefonofrom clientes where nombre = 'David' and apellidos = 'Sanz');
-- 7
insert into productos (numero_producto,nombre,precio_venta,id_categoria) values ((select max(numero_producto) FROM (SELECT * FROM productos) as pro)+1,"Super Mega Spinner",895,(SELECT id_categoria FROM categorias WHERE descripcion="bicicleta"));
-- 8
insert into clientes values ((select max(id_cliente) FROM (SELECT * FROM clientes) as pro)+1,"Maria","Baquero","Cantarranas 17","Braojos","Madrid",28737,area 425,555-9876);
-- 9
insert into proveedores values ((select max(id_prov) FROM (SELECT * FROM proveedores) as pro)+1,"Super Mega Bicicletas","Calle principal 12","castroviejo","la rioja",26637,"(941)555-6543","(941)555-6542","http://www.supermegabicicletas.com","ventas@supermegabicicletas.com");
