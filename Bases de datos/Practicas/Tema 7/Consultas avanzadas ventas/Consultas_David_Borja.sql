-- 1
SELECT numero_producto,nombre,descripcion,ROUND(precio_venta,1),stock,id_categoria FROM productos
WHERE stock<=10;
+-----------------+---------------------------------------+-------------+-----------------------+-------+--------------+
| numero_producto | nombre                                | descripcion | ROUND(precio_venta,1) | stock | id_categoria |
+-----------------+---------------------------------------+-------------+-----------------------+-------+--------------+
|               2 | Eagle FS-3 Mountain Bike              | NULL        |                1800.0 |     8 |            2 |
|               6 | Viscount Mountain Bike                | NULL        |                 635.0 |     5 |            2 |
|              11 | GT RTS-2 Mountain Bike                | NULL        |                1650.0 |     5 |            2 |
|              35 | HP Deluxe Alforjas                    | NULL        |                  39.0 |    10 |            1 |
|              39 | Road Warrior soporte para maletero    | NULL        |                 175.0 |     6 |            5 |
|              40 | Ultimate Export 2G baca para bibileta | NULL        |                 180.0 |     8 |            5 |
+-----------------+---------------------------------------+-------------+-----------------------+-------+--------------+
6 rows in set (0.00 sec) 
-- 2
SELECT (SQRT(49) + ABS(-5)) AS operacion;
+-----------+
| operacion |
+-----------+
|        12 |
+-----------+
1 row in set (0.01 sec)
-- 3
SELECT AVG(precio_venta) FROM productos;
+-------------------+
| AVG(precio_venta) |
+-------------------+
|        170.290769 |
+-------------------+
1 row in set (0.00 sec)
-- 4
SELECT UPPER(nombre),UPPER(apellidos) FROM empleados
WHERE id_empleado IN (SELECT id_empleado FROM pedidos WHERE numero_pedido IN (SELECT numero_pedido FROM detalles_pedidos WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE precio_venta > (SELECT AVG(precio_venta) FROM productos))))
ORDER BY nombre;
+---------------+------------------+
| UPPER(nombre) | UPPER(apellidos) |
+---------------+------------------+
| CAROL         | VIESCAS          |
| CATALINA      | PELAYO           |
| DAVID         | VIESCAS          |
| MARIA         | TORRES           |
| MATEO         | BERGES           |
| PEDRO         | DONOSO           |
| SUSANA        | MAESTRE          |
+---------------+------------------+
7 rows in set (0.00 sec)
-- 5
SELECT COUNT(numero_producto) FROM productos
WHERE id_categoria =3;
+------------------------+
| COUNT(numero_producto) |
+------------------------+
|                      4 |
+------------------------+
1 row in set (0.00 sec)
-- 6
SELECT MAX(precio_venta),MIN(precio_venta) FROM productos;
+-------------------+-------------------+
| MAX(precio_venta) | MIN(precio_venta) |
+-------------------+-------------------+
|           1800.00 |              4.99 |
+-------------------+-------------------+
1 row in set (0.00 sec)
-- 7
SELECT * FROM productos
WHERE precio_venta = (SELECT MAX(precio_venta) FROM productos);
+-----------------+--------------------------+-------------+--------------+-------+--------------+
| numero_producto | nombre                   | descripcion | precio_venta | stock | id_categoria |
+-----------------+--------------------------+-------------+--------------+-------+--------------+
|               2 | Eagle FS-3 Mountain Bike | NULL        |      1800.00 |     8 |            2 |
+-----------------+--------------------------+-------------+--------------+-------+--------------+
1 row in set (0.00 sec)
-- 8
SELECT * FROM productos
WHERE id_categoria IN (SELECT id_categoria FROM categorias WHERE descripcion IN (SELECT descripcion FROM categorias HAVING LENGTH(descripcion) > 8));
+-----------------+---------------------------------------+-------------+--------------+-------+--------------+
| numero_producto | nombre                                | descripcion | precio_venta | stock | id_categoria |
+-----------------+---------------------------------------+-------------+--------------+-------+--------------+
|               3 | Dog Ear Cyclecomputer                 | NULL        |        75.00 |    20 |            1 |
|               5 | Dog Ear Helmet Mount Espejos          | NULL        |         7.45 |    12 |            1 |
|               7 | Viscount C-500 Wireless Bike Computer | NULL        |        49.00 |    30 |            1 |
|               8 | Kryptonite Advanced 2000 U-Lock       | NULL        |        50.00 |    20 |            1 |
|               9 | Nikoma Lok-Tight U-Lock               | NULL        |        33.00 |    12 |            1 |
|              10 | Viscount Microshell Casco             | NULL        |        36.00 |    20 |            1 |
|              18 | Viscount CardioSport Sport Watch      | NULL        |       179.00 |    12 |            1 |
|              19 | Viscount Tru-Beat pulsometro          | NULL        |        47.00 |    20 |            1 |
|              20 | Dog Ear Monster guantes               | NULL        |        15.00 |    30 |            1 |
|              21 | Dog Ear Aero-Flow Hinchador           | NULL        |        55.00 |    25 |            1 |
|              22 | Pro-Sport 'Dillo Gafas de sol         | NULL        |        82.00 |    18 |            1 |
|              25 | King Cobra Casco                      | NULL        |       139.00 |    30 |            1 |
|              26 | Glide-O-Matic Cycling Casco           | NULL        |       125.00 |    24 |            1 |
|              30 | Clear Shade 85-T Gafas                | NULL        |        45.00 |    14 |            1 |
|              31 | True Grip Competition Guantes         | NULL        |        22.00 |    20 |            1 |
|              34 | TransPort Bicycle Parrilla            | NULL        |        27.00 |    14 |            1 |
|              35 | HP Deluxe Alforjas                    | NULL        |        39.00 |    10 |            1 |
|              38 | Cycle-Doc Pro Repair Stand            | NULL        |       166.00 |    12 |            1 |
|               2 | Eagle FS-3 Mountain Bike              | NULL        |      1800.00 |     8 |            2 |
|               6 | Viscount Mountain Bike                | NULL        |       635.00 |     5 |            2 |
|              11 | GT RTS-2 Mountain Bike                | NULL        |      1650.00 |     5 |            2 |
|               4 | Victoria Pro All Weather Llantas      | NULL        |        54.95 |    20 |            4 |
|              12 | Shinoman 105 SC Frenos                | NULL        |        23.50 |    16 |            4 |
|              13 | Shinoman Dura-Ace Auriculares         | NULL        |        67.50 |    20 |            4 |
|              14 | Eagle SA-120 Pedales sin clip         | NULL        |       139.95 |    20 |            4 |
|              15 | ProFormance clip para pedal 2G        | NULL        |         4.99 |    40 |            4 |
|              16 | ProFormance ATB Pedal todo-terreno    | NULL        |        28.00 |    40 |            4 |
|              17 | Shinoman Deluxe TX-30 Pedal           | NULL        |        45.00 |    60 |            4 |
|              36 | Cosmic Elite Road Warrior Ruedas      | NULL        |       165.00 |    22 |            4 |
|              37 | AeroFlo ATB Ruedas                    | NULL        |       189.00 |    40 |            4 |
|              39 | Road Warrior soporte para maletero    | NULL        |       175.00 |     6 |            5 |
|              40 | Ultimate Export 2G baca para bibileta | NULL        |       180.00 |     8 |            5 |
+-----------------+---------------------------------------+-------------+--------------+-------+--------------+
32 rows in set (0.00 sec)
-- 9
SELECT RPAD(nombre,10,'+') FROM empleados
WHERE LENGTH(nombre) <=10;
+---------------------+
| RPAD(nombre,10,'*') |
+---------------------+
| Maria*****          |
| Mateo*****          |
| Carol*****          |
| Pedro*****          |
| David*****          |
| Catalina**          |
| Susana****          |
| Domingo***          |
+---------------------+
8 rows in set (0.00 sec)
-- 10
SELECT COUNT(nombre) FROM productos
 WHERE descripcion IS NULL;
+---------------+
| COUNT(nombre) |
+---------------+
|            39 |
+---------------+
1 row in set (0.00 sec)
-- 11
SELECT numero_pedido,pedidos.id_cliente,clientes.nombre,MONTH(fecha_pedido) FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente
LIMIT 32;
+---------------+------------+--------+---------------------+
| numero_pedido | id_cliente | nombre | MONTH(fecha_pedido) |
+---------------+------------+--------+---------------------+
|             2 |       1001 | Susana |                   9 |
|             7 |       1001 | Susana |                   9 |
|            16 |       1001 | Susana |                   9 |
|            55 |       1001 | Susana |                   9 |
|           107 |       1001 | Susana |                   9 |
|           137 |       1001 | Susana |                   9 |
|           138 |       1001 | Susana |                   9 |
|           151 |       1001 | Susana |                   9 |
|           154 |       1001 | Susana |                   9 |
|           213 |       1001 | Susana |                  10 |
|           320 |       1001 | Susana |                  11 |
|           346 |       1001 | Susana |                  11 |
|           349 |       1001 | Susana |                  11 |
|           394 |       1001 | Susana |                  11 |
|           408 |       1001 | Susana |                  11 |
|           413 |       1001 | Susana |                  11 |
|           425 |       1001 | Susana |                  11 |
|           426 |       1001 | Susana |                  11 |
|           443 |       1001 | Susana |                  11 |
|           452 |       1001 | Susana |                  11 |
|           475 |       1001 | Susana |                  12 |
|           501 |       1001 | Susana |                  12 |
|           564 |       1001 | Susana |                  12 |
|           567 |       1001 | Susana |                  12 |
|           596 |       1001 | Susana |                  12 |
|           608 |       1001 | Susana |                   1 |
|           632 |       1001 | Susana |                   1 |
|           649 |       1001 | Susana |                   1 |
|           657 |       1001 | Susana |                   1 |
|           701 |       1001 | Susana |                   1 |
|           723 |       1001 | Susana |                   1 |
|           732 |       1001 | Susana |                   1 |
+---------------+------------+--------+---------------------+
32 rows in set (0.00 sec)
-- 12
SELECT numero_pedido,pedidos.id_cliente,clientes.nombre,DATE_FORMAT(fecha_pedido, "%d-%m-%Y") FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente
LIMIT 20;
+---------------+------------+--------+---------------------------------------+
| numero_pedido | id_cliente | nombre | DATE_FORMAT(fecha_pedido, "%d-%m-%Y") |
+---------------+------------+--------+---------------------------------------+
|             2 |       1001 | Susana | 01-09-2007                            |
|             7 |       1001 | Susana | 01-09-2007                            |
|            16 |       1001 | Susana | 02-09-2007                            |
|            55 |       1001 | Susana | 09-09-2007                            |
|           107 |       1001 | Susana | 16-09-2007                            |
|           137 |       1001 | Susana | 23-09-2007                            |
|           138 |       1001 | Susana | 24-09-2007                            |
|           151 |       1001 | Susana | 27-09-2007                            |
|           154 |       1001 | Susana | 29-09-2007                            |
|           213 |       1001 | Susana | 11-10-2007                            |
|           320 |       1001 | Susana | 02-11-2007                            |
|           346 |       1001 | Susana | 07-11-2007                            |
|           349 |       1001 | Susana | 08-11-2007                            |
|           394 |       1001 | Susana | 18-11-2007                            |
|           408 |       1001 | Susana | 23-11-2007                            |
|           413 |       1001 | Susana | 24-11-2007                            |
|           425 |       1001 | Susana | 26-11-2007                            |
|           426 |       1001 | Susana | 26-11-2007                            |
|           443 |       1001 | Susana | 29-11-2007                            |
|           452 |       1001 | Susana | 30-11-2007                            |
+---------------+------------+--------+---------------------------------------+
20 rows in set (0.00 sec)
-- 13
SELECT DATE_ADD(CURDATE(), INTERVAL 1 WEEK) AS Proximo_Viernes;
+-----------------+
| Proximo_Viernes |
+-----------------+
| 2025-02-21      |
+-----------------+
1 row in set (0.00 sec)
-- 14
SELECT nombre FROM productos
ORDER BY LENGTH(nombre);
+---------------------------------------+
| nombre                                |
+---------------------------------------+
| King Cobra Casco                      |
| AeroFlo ATB Ruedas                    |
| HP Deluxe Alforjas                    |
| Turbo Twin Llantas                    |
| Dog Ear Cyclecomputer                 |
| StaDry Cycling culote                 |
| Viscount Mountain Bike                |
| GT RTS-2 Mountain Bike                |
| Shinoman 105 SC Frenos                |
| Clear Shade 85-T Gafas                |
| Ultra-Pro Rain maillot                |
| Nikoma Lok-Tight U-Lock               |
| Dog Ear Monster guantes               |
| Eagle FS-3 Mountain Bike              |
| Viscount Microshell Casco             |
| X-Pro All Weather Llantas             |
| Cycle-Doc Pro Repair Stand            |
| TransPort Bicycle Parrilla            |
| Shinoman Deluxe TX-30 Pedal           |
| Dog Ear Aero-Flow Hinchador           |
| Glide-O-Matic Cycling Casco           |
| Ultra-2K Competition Llanta           |
| Viscount Tru-Beat pulsometro          |
| Wonder Wool Cycle Calcetines          |
| Dog Ear Helmet Mount Espejos          |
| Pro-Sport 'Dillo Gafas de sol         |
| Eagle SA-120 Pedales sin clip         |
| Shinoman Dura-Ace Auriculares         |
| True Grip Competition Guantes         |
| Kool-Breeze Rocket Top Jersey         |
| ProFormance clip para pedal 2G        |
| Kryptonite Advanced 2000 U-Lock       |
| Viscount CardioSport Sport Watch      |
| Cosmic Elite Road Warrior Ruedas      |
| Victoria Pro All Weather Llantas      |
| ProFormance ATB Pedal todo-terreno    |
| Road Warrior soporte para maletero    |
| Viscount C-500 Wireless Bike Computer |
| Ultimate Export 2G baca para bibileta |
+---------------------------------------+
39 rows in set (0.00 sec)
-- 15
SELECT COUNT(numero_producto) FROM detalles_pedidos
WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE precio_venta > (SELECT AVG(precio_venta) FROM productos
WHERE id_categoria = (SELECT id_categoria FROM categorias WHERE descripcion="componentes")));
+------------------------+
| COUNT(numero_producto) |
+------------------------+
|                   1229 |
+------------------------+
1 row in set (0.00 sec)
-- 16
SELECT SUM(precio_venta) FROM productos
WHERE id_categoria = (SELECT id_categoria FROM categorias WHERE descripcion="ropa");
+-------------------+
| SUM(precio_venta) |
+-------------------+
|            205.00 |
+-------------------+
1 row in set (0.00 sec)
-- 17
SELECT COUNT(numero_pedido) FROM pedidos
WHERE id_cliente IN (SELECT id_cliente FROM clientes WHERE ciudad="Robledo");
+----------------------+
| COUNT(numero_pedido) |
+----------------------+
|                   92 |
+----------------------+
1 row in set (0.00 sec)
-- 18
SELECT COUNT(numero_producto) FROM productos
WHERE id_categoria = (SELECT id_categoria FROM categorias WHERE descripcion="Bicicletas") AND
numero_producto IN (SELECT numero_producto FROM productos_proveedores WHERE id_prov IN 
(SELECT id_prov FROM proveedores WHERE provincia="Madrid"));
+------------------------+
| COUNT(numero_producto) |
+------------------------+
|                      1 |
+------------------------+
1 row in set (0.02 sec)
-- 19
SELECT COUNT(DISTINCT id_empleado) FROM pedidos
WHERE numero_pedido IN (SELECT numero_pedido FROM detalles_pedidos WHERE numero_producto IN
(SELECT numero_producto FROM productos WHERE precio_venta=(SELECT MAX(precio_venta) FROM productos)));
+-----------------------------+
| COUNT(DISTINCT id_empleado) |
+-----------------------------+
|                           5 |
+-----------------------------+
1 row in set (0.00 sec)
-- 20

-- 21
SELECT id_cliente FROM pedidos 
WHERE fecha_pedido BETWEEN '2007-11-20' AND '2007-11-23';
+------------+
| id_cliente |
+------------+
|       1004 |
|       1007 |
|       1026 |
|       1003 |
|       1017 |
|       1006 |
|       1019 |
|       1023 |
|       1012 |
|       1001 |
|       1024 |
|       1008 |
+------------+
12 rows in set (0.00 sec)
-- 22 
SELECT DISTINCT id_empleado FROM pedidos
WHERE fecha_pedido = (SELECT MAX(fecha_pedido) FROM pedidos);
+-------------+
| id_empleado |
+-------------+
|         702 |
|         704 |
|         705 |
|         706 |
|         707 |
+-------------+
5 rows in set (0.01 sec)
-- 23
SELECT productos_proveedores.numero_producto,(precio_venta-productos_proveedores.precio_por_mayor) AS Beneficio FROM productos
INNER JOIN productos_proveedores ON productos.numero_producto=productos_proveedores.numero_producto
WHERE (precio_venta-productos_proveedores.precio_por_mayor)=(SELECT MAX(precio_venta-productos_proveedores.precio_por_mayor) FROM 
productos INNER JOIN productos_proveedores ON productos.numero_producto=productos_proveedores.numero_producto);
+-----------------+-----------+
| numero_producto | Beneficio |
+-----------------+-----------+
|              11 |    573.38 |
+-----------------+-----------+
1 row in set (0.00 sec)
-- 24
SELECT id_prov,MAX(dias_envio) FROM productos_proveedores
WHERE dias_envio IN (SELECT MAX(dias_envio) FROM productos_proveedores) 
GROUP BY id_prov;
+---------+-----------------+
| id_prov | MAX(dias_envio) |
+---------+-----------------+
|       6 |              15 |
|       7 |              15 |
|      10 |              15 |
+---------+-----------------+
3 rows in set (0.00 sec)
-- 25
SELECT SUM(precio*cantidad) AS Recaudacion FROM detalles_pedidos;
+-------------+
| Recaudacion |
+-------------+
|  2176593.48 |
+-------------+
1 row in set (0.01 sec)
-- 26
SELECT id_categoria,nombre,MAX(precio_venta) FROM productos
GROUP BY id_categoria;
+--------------+------------------------------------+-------------------+
| id_categoria | nombre                             | MAX(precio_venta) |
+--------------+------------------------------------+-------------------+
|            1 | Dog Ear Cyclecomputer              |            179.00 |
|            2 | Eagle FS-3 Mountain Bike           |           1800.00 |
|            3 | Ultra-Pro Rain maillot             |             85.00 |
|            4 | Victoria Pro All Weather Llantas   |            189.00 |
|            5 | Road Warrior soporte para maletero |            180.00 |
|            6 | X-Pro All Weather Llantas          |             34.00 |
+--------------+------------------------------------+-------------------+
6 rows in set (0,00 sec)
-- 27
SELECT id_categoria,AVG(precio_venta) FROM productos
GROUP BY id_categoria;
+--------------+-------------------+
| id_categoria | AVG(precio_venta) |
+--------------+-------------------+
|            1 |         66.191667 |
|            2 |       1361.666667 |
|            3 |         51.250000 |
|            4 |         79.765556 |
|            5 |        177.500000 |
|            6 |         29.000000 |
+--------------+-------------------+
6 rows in set (0.00 sec)
-- 28
SELECT categorias.id_categoria,categorias.descripcion,MAX(precio_venta) FROM productos
INNER JOIN categorias ON productos.id_categoria=categorias.id_categoria
GROUP BY productos.id_categoria
ORDER BY productos.id_categoria;
+--------------+--------------------+-------------------+
| id_categoria | descripcion        | MAX(precio_venta) |
+--------------+--------------------+-------------------+
|            1 | Accesorios         |            179.00 |
|            2 | Bicicletas         |           1800.00 |
|            3 | Ropa               |             85.00 |
|            4 | Componentes        |            189.00 |
|            5 | **** para el coche |            180.00 |
|            6 | Ruedas             |             34.00 |
+--------------+--------------------+-------------------+
6 rows in set (0.00 sec)
-- 29
SELECT id_categoria,COUNT(numero_producto) FROM productos
GROUP BY id_categoria;
+--------------+------------------------+
| id_categoria | COUNT(numero_producto) |
+--------------+------------------------+
|            1 |                     18 |
|            2 |                      3 |
|            3 |                      4 |
|            4 |                      9 |
|            5 |                      2 |
|            6 |                      3 |
+--------------+------------------------+
6 rows in set (0.00 sec)
-- 30
SELECT categorias.descripcion,productos.id_categoria,COUNT(numero_producto) FROM productos
INNER JOIN categorias ON productos.id_categoria=categorias.id_categoria
GROUP BY productos.id_categoria
HAVING COUNT(numero_producto) >= ALL (SELECT COUNT(numero_producto) FROM productos
INNER JOIN categorias ON productos.id_categoria=categorias.id_categoria
GROUP BY productos.id_categoria);
+-------------+--------------+------------------------+
| descripcion | id_categoria | COUNT(numero_producto) |
+-------------+--------------+------------------------+
| Accesorios  |            1 |                     18 |
+-------------+--------------+------------------------+
1 row in set (0,00 sec)
-- 31
SELECT productos.id_categoria,SUM(precio*cantidad) FROM detalles_pedidos
INNER JOIN productos ON detalles_pedidos.numero_producto=productos.numero_producto
WHERE detalles_pedidos.numero_pedido IN (SELECT numero_pedido FROM pedidos WHERE id_cliente=1001)
GROUP BY productos.id_categoria
ORDER BY productos.id_categoria;
+--------------+----------------------+
| id_categoria | SUM(precio*cantidad) |
+--------------+----------------------+
|            1 |             12652.62 |
|            3 |              1092.85 |
|            4 |              9922.33 |
|            5 |              6987.20 |
|            6 |              1481.48 |
+--------------+----------------------+
5 rows in set (0,00 sec)
-- 32
SELECT categorias.descripcion FROM productos
INNER JOIN categorias ON productos.id_categoria=categorias.id_categoria
GROUP BY productos.id_categoria
HAVING COUNT(productos.id_categoria)>5;
+-------------+
| descripcion |
+-------------+
| Accesorios  |
| Componentes |
+-------------+
2 rows in set (0,00 sec)
-- 33
SELECT clientes.nombre,clientes.apellidos,SUM(detalles_pedidos.precio*detalles_pedidos.cantidad) FROM pedidos
INNER JOIN detalles_pedidos ON pedidos.numero_pedido = detalles_pedidos.numero_pedido
INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente
WHERE detalles_pedidos.numero_producto IN (SELECT numero_producto FROM productos WHERE id_categoria=1)
GROUP BY pedidos.id_cliente
HAVING SUM(detalles_pedidos.precio*detalles_pedidos.cantidad)>14000;
+-----------+------------+--------------------------------------------------------+
| nombre    | apellidos  | SUM(detalles_pedidos.precio*detalles_pedidos.cantidad) |
+-----------+------------+--------------------------------------------------------+
| Guillermo | Torres     |                                               16932.79 |
| Roberto   | Blanes     |                                               16297.80 |
| Daniel    | Manzanares |                                               15364.81 |
| Jaime     | Vives      |                                               14359.26 |
| Manuela   | Seidel     |                                               17447.00 |
| Marcos    | Rosales    |                                               15623.19 |
+-----------+------------+--------------------------------------------------------+
6 rows in set (0,02 sec)
-- 34
SELECT id_empleado,SUM(precio_total) FROM pedidos
GROUP BY id_empleado;
+-------------+-------------------+
| id_empleado | SUM(precio_total) |
+-------------+-------------------+
|         702 |         590874.16 |
|         703 |         459096.87 |
|         704 |         597457.38 |
|         705 |         557236.91 |
|         706 |         501506.25 |
|         707 |         736127.67 |
|         708 |         681234.24 |
+-------------+-------------------+
7 rows in set (0,01 sec)
-- 35
SELECT id_empleado,SUM(precio_total) FROM pedidos
WHERE id_empleado IN (701,702,703)
GROUP BY id_empleado;
+-------------+-------------------+
| id_empleado | SUM(precio_total) |
+-------------+-------------------+
|         702 |         590874.16 |
|         703 |         459096.87 |
+-------------+-------------------+
2 rows in set (0,00 sec)
-- 36
SELECT empleados.id_empleado,empleados.nombre,SUM(precio_total) FROM pedidos
INNER JOIN empleados ON pedidos.id_empleado = empleados.id_empleado
GROUP BY id_empleado
LIMIT 3;
+-------------+--------+-------------------+
| id_empleado | nombre | SUM(precio_total) |
+-------------+--------+-------------------+
|         702 | Maria  |         590874.16 |
|         703 | Mateo  |         459096.87 |
|         704 | Carol  |         597457.38 |
+-------------+--------+-------------------+
3 rows in set (0,01 sec)
-- 37
SELECT proveedores.nombre,productos.nombre,dias_envio FROM productos_proveedores
INNER JOIN productos ON productos_proveedores.numero_producto=productos.numero_producto
INNER JOIN proveedores ON productos_proveedores.id_prov = proveedores.id_prov
WHERE dias_envio =(SELECT MIN(dias_envio) FROM productos_proveedores);
+------------------------+-------------------------------+------------+
| nombre                 | nombre                        | dias_envio |
+------------------------+-------------------------------+------------+
| Shinoman, Incorporated | Shinoman 105 SC Frenos        |          2 |
| Shinoman, Incorporated | Shinoman Dura-Ace Auriculares |          2 |
| Shinoman, Incorporated | Shinoman Deluxe TX-30 Pedal   |          2 |
+------------------------+-------------------------------+------------+
3 rows in set (0,00 sec)
-- 38
SELECT numero_producto, SUM(cantidad) FROM detalles_pedidos
GROUP BY numero_producto
HAVING SUM(cantidad)>=ALL (SELECT SUM(cantidad) FROM detalles_pedidos GROUP BY numero_producto);
+-----------------+---------------+
| numero_producto | SUM(cantidad) |
+-----------------+---------------+
|              11 |           609 |
+-----------------+---------------+
1 row in set (0,03 sec)
-- 39
SELECT id_prov, COUNT(numero_producto) FROM productos_proveedores
GROUP BY id_prov
HAVING COUNT(numero_producto) <= (SELECT AVG(productos_media) FROM (SELECT COUNT(numero_producto) AS productos_media FROM productos_proveedores
GROUP BY id_prov) AS subconsulta);
+---------+------------------------+
| id_prov | COUNT(numero_producto) |
+---------+------------------------+
|       1 |                      3 |
|       2 |                      6 |
|       3 |                      5 |
|       4 |                      2 |
|       5 |                      1 |
|       8 |                      5 |
|      10 |                      6 |
+---------+------------------------+
7 rows in set (0.00 sec)
-- 40
SELECT numero_pedido,sum(cantidad) FROM detalles_pedidos
GROUP BY numero_pedido
ORDER BY sum(cantidad)
LIMIT 20;
+---------------+---------------+
| numero_pedido | sum(cantidad) |
+---------------+---------------+
|           832 |             1 |
|           417 |             1 |
|            93 |             1 |
|           527 |             1 |
|           814 |             1 |
|           504 |             1 |
|            36 |             1 |
|            55 |             1 |
|           424 |             1 |
|           129 |             1 |
|           857 |             1 |
|           197 |             1 |
|           324 |             1 |
|             9 |             1 |
|           174 |             1 |
|           142 |             1 |
|           255 |             1 |
|           766 |             1 |
|           522 |             1 |
|           565 |             1 |
+---------------+---------------+
20 rows in set (0,01 sec)
-- 41
SELECT pedidos.numero_pedido,sum(detalles_pedidos.cantidad),clientes.nombre,clientes.apellidos FROM pedidos
INNER JOIN detalles_pedidos ON pedidos.numero_pedido = detalles_pedidos.numero_pedido
INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente
GROUP BY pedidos.numero_pedido
LIMIT 20;
+---------------+--------------------------------+-----------+-----------+
| numero_pedido | sum(detalles_pedidos.cantidad) | nombre    | apellidos |
+---------------+--------------------------------+-----------+-----------+
|             1 |                             22 | David     | Sanz      |
|             2 |                              8 | Susana    | Viescas   |
|             3 |                             23 | Guillermo | Torres    |
|             4 |                             15 | Andres    | Cervera   |
|             5 |                              8 | Marcos    | Rosales   |
|             6 |                             30 | Samuel    | Abadia    |
|             7 |                              5 | Susana    | Viescas   |
|             8 |                             16 | German    | Higueras  |
|             9 |                              1 | Maria     | Salgado   |
|            11 |                             24 | Joaquin   | Bou       |
|            12 |                              2 | Marcos    | Rosales   |
|            13 |                              5 | Marcos    | Rosales   |
|            14 |                              6 | Raquel    | Pelayo    |
|            16 |                             25 | Susana    | Viescas   |
|            17 |                             26 | Samuel    | Abadia    |
|            18 |                             17 | Jaime     | Vives     |
|            19 |                             26 | Lucas     | Pelayo    |
|            20 |                              6 | Ana       | Higueras  |
|            21 |                             14 | Samuel    | Abadia    |
|            22 |                             15 | Luis      | Donoso    |
+---------------+--------------------------------+-----------+-----------+
20 rows in set (0,00 sec)
-- 42
SELECT id_cliente,COUNT(numero_pedido) FROM pedidos
GROUP BY id_cliente 
HAVING COUNT(numero_pedido) <= ALL(SELECT COUNT(numero_pedido) FROM pedidos GROUP BY id_cliente);
+------------+----------------------+
| id_cliente | COUNT(numero_pedido) |
+------------+----------------------+
|       1019 |                   18 |
+------------+----------------------+
-- 43
SELECT id_empleado,COUNT(numero_pedido) FROM pedidos
GROUP BY id_empleado 
HAVING COUNT(numero_pedido) >= ALL(SELECT COUNT(numero_pedido) FROM pedidos GROUP BY id_empleado);
+-------------+----------------------+
| id_empleado | COUNT(numero_pedido) |
+-------------+----------------------+
|         707 |                  140 |
+-------------+----------------------+
1 row in set (0.01 sec)
-- 44
SELECT dp.numero_pedido,dp.numero_producto,dp.precio FROM detalles_pedidos dp
INNER JOIN productos p ON dp.numero_producto=p.numero_producto
WHERE (dp.numero_pedido,dp.precio) IN (SELECT numero_pedido,MIN(precio) FROM detalles_pedidos GROUP BY numero_pedido)
GROUP BY dp.numero_pedido
ORDER BY dp.numero_pedido
LIMIT 20;
+---------------+-----------------+--------+
| numero_pedido | numero_producto | precio |
+---------------+-----------------+--------+
|             1 |              16 |  28.00 |
|             2 |              27 |  24.00 |
|             3 |              31 |  21.34 |
|             4 |               9 |  33.00 |
|             5 |              31 |  22.00 |
|             6 |              12 |  22.80 |
|             7 |              27 |  24.00 |
|             8 |              34 |  27.00 |
|             9 |              24 |  69.00 |
|            11 |              31 |  21.34 |
|            12 |              10 |  36.00 |
|            13 |              28 |  29.00 |
|            14 |              14 | 139.95 |
|            16 |              34 |  26.19 |
|            17 |              19 |  47.00 |
|            18 |              20 |  15.00 |
|            19 |              20 |  15.00 |
|            20 |              37 | 183.33 |
|            21 |              33 |  18.43 |
|            22 |              29 |  34.00 |
+---------------+-----------------+--------+
20 rows in set (0.00 sec)
-- 45
SELECT numero_pedido FROM detalles_pedidos
WHERE numero_producto IN (1,2,6,11)
INTERSECT
SELECT numero_pedido FROM detalles_pedidos
WHERE numero_producto IN (10,25,26);
+---------------+
| numero_pedido |
+---------------+
|           105 |
|           111 |
|           375 |
|           741 |
|           783 |
|             1 |
|             3 |
|            11 |
|            19 |
|            39 |
+---------------+
10 rows in set (0.00 sec)
-- 46
SELECT numero_pedido FROM detalles_pedidos
WHERE numero_producto IN (1,2,6,11)
EXCEPT
SELECT numero_pedido FROM detalles_pedidos
WHERE numero_producto IN (10,25,26);
+---------------+
| numero_pedido |
+---------------+
|             6 |
|           152 |
|           237 |
|           265 |
|           356 |
|           404 |
|           469 |
|           661 |
|           666 |
|           854 |
+---------------+
10 rows in set (0.00 sec)
-- 47
-- Con union=
	SELECT numero_pedido FROM detalles_pedidos
	WHERE numero_producto IN (1,2,6,11)
	UNION
	SELECT numero_pedido FROM detalles_pedidos
	WHERE numero_producto IN (10,25,26);
-- Sin Union 
	SELECT DISTINCT numero_pedido FROM detalles_pedidos
	WHERE numero_producto IN (1,2,6,11,10,25,26);
+---------------+
| numero_pedido |
+---------------+
|             6 |
|           105 |
|           111 |
|           152 |
|           237 |
|           265 |
|           356 |
|           375 |
|           404 |
|           469 |
+---------------+
10 rows in set (0.00 sec)
-- 48
SELECT clientes.nombre FROM clientes
INNER JOIN pedidos ON clientes.id_cliente=pedidos.id_cliente
INNER JOIN empleados ON pedidos.id_empleado=empleados.id_empleado
WHERE clientes.nombre=empleados.nombre
GROUP BY clientes.nombre;
+--------+
| nombre |
+--------+
| Susana |
| Maria  |
| David  |
+--------+
3 rows in set (0.00 sec)
-- 49
SELECT nombre FROM clientes
WHERE clientes.nombre NOT IN (SELECT nombre FROM empleados)
GROUP BY nombre;
+-----------+
| nombre    |
+-----------+
| Guillermo |
| German    |
| Roberto   |
| Daniel    |
| Juan      |
| Nicolas   |
| Andres    |
| Angel     |
| Ana       |
| Lisa      |
| Raquel    |
| Samuel    |
| Jaime     |
| Manuela   |
| Zacarias  |
| Joaquin   |
| Estella   |
| Camilo    |
| Julia     |
| Marcos    |
| Luis      |
| Lucas     |
| Javier    |
+-----------+
23 rows in set (0.00 sec)
-- 50
SELECT ciudad FROM clientes
WHERE ciudad NOT IN (SELECT ciudad FROM empleados)
GROUP BY ciudad;
+--------------+
| ciudad       |
+--------------+
| Acebeda (La) |
| Hontanar     |
| O Pereiro    |
| Santa Ana    |
| Ajofrin      |
| Venturada    |
| Plasencia    |
| Seiro        |
| Mundil       |
| Fresnedoso   |
| Garvin       |
| Dosbarrios   |
| Ladrillar    |
| Escalonilla  |
+--------------+
14 rows in set (0.00 sec)
-- 51
SELECT id_cliente FROM pedidos
WHERE numero_pedido IN (SELECT numero_pedido FROM detalles_pedidos WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE nombre LIKE '%Bike%'))
INTERSECT
SELECT id_cliente FROM pedidos
WHERE numero_pedido IN (SELECT numero_pedido FROM detalles_pedidos WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE nombre LIKE '%Casco%'));
+------------+
| id_cliente |
+------------+
|       1014 |
|       1005 |
|       1021 |
|       1017 |
|       1027 |
|       1018 |
|       1004 |
|       1019 |
|       1012 |
|       1024 |
|       1013 |
|       1010 |
|       1006 |
|       1002 |
|       1020 |
|       1008 |
|       1026 |
|       1025 |
|       1016 |
|       1007 |
|       1009 |
|       1003 |
|       1022 |
|       1015 |
|       1001 |
+------------+
25 rows in set (0.00 sec)
-- 52
SELECT id_cliente FROM pedidos
WHERE numero_pedido IN (SELECT numero_pedido FROM detalles_pedidos WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE nombre LIKE '%Bike%'))
EXCEPT
SELECT id_cliente FROM pedidos
WHERE numero_pedido IN (SELECT numero_pedido FROM detalles_pedidos WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE nombre LIKE '%Casco%'));
+------------+
| id_cliente |
+------------+
|       1011 |
|       1023 |
+------------+
2 rows in set (0.00 sec)
-- 53
SELECT id_cliente FROM pedidos
WHERE numero_pedido IN (SELECT numero_pedido FROM detalles_pedidos WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE nombre LIKE '%Bike%'))
UNION
SELECT id_cliente FROM pedidos
WHERE numero_pedido IN (SELECT numero_pedido FROM detalles_pedidos WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE nombre LIKE '%Casco%'));
+------------+
| id_cliente |
+------------+
|       1014 |
|       1005 |
|       1021 |
|       1017 |
|       1027 |
|       1018 |
|       1004 |
|       1019 |
|       1011 |
|       1012 |
|       1024 |
|       1013 |
|       1010 |
|       1006 |
|       1002 |
|       1020 |
|       1008 |
|       1026 |
|       1025 |
|       1023 |
|       1016 |
|       1007 |
|       1009 |
|       1003 |
|       1022 |
|       1015 |
|       1001 |
+------------+
27 rows in set (0.00 sec)
-- 54
SELECT id_cliente,COUNT(numero_pedido) FROM pedidos
WHERE fecha_pedido LIKE '2007-%%-%%'
GROUP BY id_cliente;
+------------+----------------------+
| id_cliente | COUNT(numero_pedido) |
+------------+----------------------+
|       1001 |                   25 |
|       1002 |                   23 |
|       1003 |                   25 |
|       1004 |                   26 |
|       1005 |                   17 |
|       1006 |                   14 |
|       1007 |                   21 |
|       1008 |                   15 |
|       1009 |                   23 |
|       1010 |                   20 |
|       1011 |                   22 |
|       1012 |                   17 |
|       1013 |                   16 |
|       1014 |                   22 |
|       1015 |                   16 |
|       1016 |                   20 |
|       1017 |                   27 |
|       1018 |                   16 |
|       1019 |                    8 |
|       1020 |                   21 |
|       1021 |                   26 |
|       1022 |                   11 |
|       1023 |                   14 |
|       1024 |                   24 |
|       1025 |                   23 |
|       1026 |                   16 |
|       1027 |                   16 |
+------------+----------------------+
27 rows in set (0.00 sec)
-- 55
SELECT clientes.id_cliente,clientes.nombre FROM clientes
INNER JOIN pedidos ON clientes.id_cliente=pedidos.id_cliente
GROUP BY id_cliente
HAVING COUNT(pedidos.numero_pedido)>=ALL(SELECT COUNT(numero_pedido) FROM pedidos GROUP BY id_cliente);
+------------+---------+
| id_cliente | nombre  |
+------------+---------+
|       1017 | Manuela |
+------------+---------+
1 row in set (0.01 sec)
-- 56
SELECT productos.nombre,SUM(precio*cantidad) FROM detalles_pedidos
INNER JOIN productos ON detalles_pedidos.numero_producto = productos.numero_producto
GROUP BY productos.nombre
ORDER BY SUM(precio*cantidad) DESC
LIMIT 10;
+---------------------------------------+----------------------+
| nombre                                | SUM(precio*cantidad) |
+---------------------------------------+----------------------+
| GT RTS-2 Mountain Bike                |            987822.00 |
| Viscount Mountain Bike                |            354412.55 |
| Eagle FS-3 Mountain Bike              |            116802.00 |
| AeroFlo ATB Ruedas                    |             67021.29 |
| Ultimate Export 2G baca para bibileta |             62092.80 |
| Road Warrior soporte para maletero    |             58087.75 |
| Cycle-Doc Pro Repair Stand            |             56255.74 |
| Cosmic Elite Road Warrior Ruedas      |             55308.00 |
| King Cobra Casco                      |             49529.87 |
| Glide-O-Matic Cycling Casco           |             49266.25 |
+---------------------------------------+----------------------+
10 rows in set (0.01 sec)
-- 57
SELECT clientes.id_cliente,clientes.nombre,clientes.apellidos FROM clientes
INNER JOIN pedidos ON clientes.id_cliente=pedidos.id_cliente
GROUP BY pedidos.id_cliente 
HAVING COUNT(numero_pedido)>5;
+------------+-----------+------------+
| id_cliente | nombre    | apellidos  |
+------------+-----------+------------+
|       1001 | Susana    | Viescas    |
|       1002 | Guillermo | Torres     |
|       1003 | German    | Higueras   |
|       1004 | Roberto   | Blanes     |
|       1005 | Daniel    | Manzanares |
|       1006 | Juan      | Viescas    |
|       1007 | Maria     | Salgado    |
|       1008 | Nicolas   | Pelayo     |
|       1009 | Andres    | Cervera    |
|       1010 | Angel     | Sanchez    |
|       1011 | Ana       | Higueras   |
|       1012 | Lisa      | Colomer    |
|       1013 | Raquel    | Pelayo     |
|       1014 | Samuel    | Abadia     |
|       1015 | Daniel    | Gil        |
|       1016 | Jaime     | Vives      |
|       1017 | Manuela   | Seidel     |
|       1018 | David     | Sanz       |
|       1019 | Zacarias  | Escudero   |
|       1020 | Joaquin   | Bou        |
|       1021 | Estella   | Punset     |
|       1022 | Camilo    | Viescas    |
|       1023 | Julia     | Sandoval   |
|       1024 | Marcos    | Rosales    |
|       1025 | Maria     | Pelayo     |
|       1026 | Luis      | Donoso     |
|       1027 | Lucas     | Pelayo     |
+------------+-----------+------------+
27 rows in set (0.00 sec)
-- 58
SELECT detalles_pedidos.numero_producto,productos.id_categoria FROM detalles_pedidos
INNER JOIN productos ON detalles_pedidos.numero_producto = productos.numero_producto
GROUP BY detalles_pedidos.numero_producto
HAVING SUM(cantidad)>=ALL(SELECT SUM(cantidad) FROM detalles_pedidos
GROUP BY numero_producto);
+-----------------+--------------+
| numero_producto | id_categoria |
+-----------------+--------------+
|              11 |            2 |
+-----------------+--------------+
1 row in set (0.03 sec)
-- 59
SELECT id_cliente FROM pedidos
WHERE numero_pedido IN (SELECT DISTINCT numero_pedido FROM detalles_pedidos WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE id_categoria=1))
GROUP BY id_cliente;
+------------+
| id_cliente |
+------------+
|       1001 |
|       1002 |
|       1003 |
|       1004 |
|       1005 |
|       1006 |
|       1007 |
|       1008 |
|       1009 |
|       1010 |
|       1011 |
|       1012 |
|       1013 |
|       1014 |
|       1015 |
|       1016 |
|       1017 |
|       1018 |
|       1019 |
|       1020 |
|       1021 |
|       1022 |
|       1023 |
|       1024 |
|       1025 |
|       1026 |
|       1027 |
+------------+
27 rows in set (0.00 sec)
-- 60
SELECT MIN(fecha_pedido) AS Primera,MAX(fecha_pedido) AS Ultimo,DATEDIFF(MAX(fecha_pedido),MIN(fecha_pedido)) AS Diferencia FROM pedidos
WHERE id_cliente=1003;
+------------+------------+------------+
| Primera    | Ultimo     | Diferencia |
+------------+------------+------------+
| 2007-09-01 | 2008-02-16 |        168 |
+------------+------------+------------+
1 row in set (0.00 sec)
-- 61
SELECT ciudad,provincia,cod_postal FROM clientes
GROUP BY ciudad
HAVING COUNT(id_cliente) >= ALL(SELECT COUNT(id_cliente) FROM clientes GROUP BY ciudad);
+---------+-----------+------------+
| ciudad  | provincia | cod_postal |
+---------+-----------+------------+
| Robledo | MADRID    | 28052      |
+---------+-----------+------------+
1 row in set (0.00 sec)
-- 62
SELECT proveedores.nombre,productos.nombre,MAX(precio_por_mayor) FROM productos_proveedores
INNER JOIN proveedores ON productos_proveedores.id_prov = proveedores.id_prov
INNER JOIN productos ON productos_proveedores.numero_producto = productos.numero_producto
GROUP BY productos_proveedores.id_prov;
+------------------------+---------------------------------+-----------------------+
| nombre                 | nombre                          | MAX(precio_por_mayor) |
+------------------------+---------------------------------+-----------------------+
| Shinoman, Incorporated | Shinoman 105 SC Frenos          |                 41.68 |
| Viscount               | Viscount Mountain Bike          |                403.22 |
| Nikoma of America      | Nikoma Lok-Tight U-Lock         |               1076.62 |
| ProFormance            | ProFormance clip para pedal 2G  |                 18.76 |
| Kona, Incorporated     | Ultra-2K Competition Llanta     |                 23.38 |
| Big Sky Mountain Bikes | Eagle FS-3 Mountain Bike        |               1269.00 |
| Dog Ear                | Dog Ear Cyclecomputer           |                126.44 |
| Sun Sports Suppliers   | Kryptonite Advanced 2000 U-Lock |                 39.32 |
| Lone Star Bike Supply  | Eagle FS-3 Mountain Bike        |               1477.81 |
| Armadillo Brand        | Pro-Sport 'Dillo Gafas de sol   |                128.65 |
+------------------------+---------------------------------+-----------------------+
10 rows in set (0.01 sec)
-- 63
SELECT id_prov,productos.nombre,precio_por_mayor FROM productos_proveedores pp
INNER JOIN productos ON pp.numero_producto = productos.numero_producto 
WHERE precio_por_mayor >= (SELECT AVG(precio_por_mayor) FROM productos_proveedores WHERE id_prov = pp.id_prov)
ORDER BY id_prov;
+---------+---------------------------------------+------------------+
| id_prov | nombre                                | precio_por_mayor |
+---------+---------------------------------------+------------------+
|       1 | Shinoman Dura-Ace Auriculares         |            41.68 |
|       2 | Viscount Mountain Bike                |           403.22 |
|       3 | GT RTS-2 Mountain Bike                |          1076.62 |
|       4 | ProFormance ATB Pedal todo-terreno    |            18.76 |
|       5 | Ultra-2K Competition Llanta           |            23.38 |
|       6 | Eagle FS-3 Mountain Bike              |          1269.00 |
|       6 | Cosmic Elite Road Warrior Ruedas      |           122.88 |
|       6 | AeroFlo ATB Ruedas                    |           125.99 |
|       6 | Road Warrior soporte para maletero    |           137.55 |
|       6 | Ultimate Export 2G baca para bibileta |           154.87 |
|       7 | Dog Ear Cyclecomputer                 |            54.19 |
|       7 | StaDry Cycling culote                 |            53.88 |
|       7 | Cosmic Elite Road Warrior Ruedas      |           119.21 |
|       7 | Road Warrior soporte para maletero    |           126.44 |
|       8 | Kryptonite Advanced 2000 U-Lock       |            39.32 |
|       8 | Clear Shade 85-T Gafas                |            33.30 |
|       9 | Eagle FS-3 Mountain Bike              |          1477.81 |
|       9 | Viscount Mountain Bike                |           448.73 |
|       9 | GT RTS-2 Mountain Bike                |          1178.65 |
|      10 | Pro-Sport 'Dillo Gafas de sol         |            63.55 |
|      10 | King Cobra Casco                      |           101.58 |
|      10 | Cycle-Doc Pro Repair Stand            |           128.65 |
+---------+---------------------------------------+------------------+
22 rows in set (0.01 sec)
