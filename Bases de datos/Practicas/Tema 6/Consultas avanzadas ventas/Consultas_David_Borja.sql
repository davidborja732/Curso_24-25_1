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
SELECT RPAD(nombre,10,'*') FROM empleados
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
GROUP BY id_categoria;
+--------------------+--------------+------------------------+
| descripcion        | id_categoria | COUNT(numero_producto) |
+--------------------+--------------+------------------------+
| Accesorios         |            1 |                     18 |
| Bicicletas         |            2 |                      3 |
| Ropa               |            3 |                      4 |
| Componentes        |            4 |                      9 |
| **** para el coche |            5 |                      2 |
| Ruedas             |            6 |                      3 |
+--------------------+--------------+------------------------+
6 rows in set (0.00 sec)
-- 31

-- 32

-- 33

-- 34

-- 35
