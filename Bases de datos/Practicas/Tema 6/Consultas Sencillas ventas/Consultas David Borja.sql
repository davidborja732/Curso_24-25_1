-- 1
SELECT nombre FROM proveedores;
+------------------------+
| nombre                 |
+------------------------+
| Shinoman, Incorporated |
| Viscount               |
| Nikoma of America      |
| ProFormance            |
| Kona, Incorporated     |
| Big Sky Mountain Bikes |
| Dog Ear                |
| Sun Sports Suppliers   |
| Lone Star Bike Supply  |
| Armadillo Brand        |
| Astro Paper productos  |
+------------------------+
11 rows in set (0,00 sec)
-- 2
SELECT nombre, precio_venta FROM productos;
+---------------------------------------+--------------+
| nombre                                | precio_venta |
+---------------------------------------+--------------+
| Eagle FS-3 Mountain Bike              |      1800.00 |
| Dog Ear Cyclecomputer                 |        75.00 |
| Victoria Pro All Weather Llantas      |        54.95 |
| Dog Ear Helmet Mount Espejos          |         7.45 |
| Viscount Mountain Bike                |       635.00 |
| Viscount C-500 Wireless Bike Computer |        49.00 |
| Kryptonite Advanced 2000 U-Lock       |        50.00 |
| Nikoma Lok-Tight U-Lock               |        33.00 |
| Viscount Microshell Casco             |        36.00 |
| GT RTS-2 Mountain Bike                |      1650.00 |
| Shinoman 105 SC Frenos                |        23.50 |
| Shinoman Dura-Ace Auriculares         |        67.50 |
| Eagle SA-120 Pedales sin clip         |       139.95 |
| ProFormance clip para pedal 2G        |         4.99 |
| ProFormance ATB Pedal todo-terreno    |        28.00 |
| Shinoman Deluxe TX-30 Pedal           |        45.00 |
| Viscount CardioSport Sport Watch      |       179.00 |
| Viscount Tru-Beat pulsometro          |        47.00 |
| Dog Ear Monster guantes               |        15.00 |
| Dog Ear Aero-Flow Hinchador           |        55.00 |
| Pro-Sport 'Dillo Gafas de sol         |        82.00 |
| Ultra-Pro Rain maillot                |        85.00 |
| StaDry Cycling culote                 |        69.00 |
| King Cobra Casco                      |       139.00 |
| Glide-O-Matic Cycling Casco           |       125.00 |
| X-Pro All Weather Llantas             |        24.00 |
| Turbo Twin Llantas                    |        29.00 |
| Ultra-2K Competition Llanta           |        34.00 |
| Clear Shade 85-T Gafas                |        45.00 |
| True Grip Competition Guantes         |        22.00 |
| Kool-Breeze Rocket Top Jersey         |        32.00 |
| Wonder Wool Cycle Calcetines          |        19.00 |
| TransPort Bicycle Parrilla            |        27.00 |
| HP Deluxe Alforjas                    |        39.00 |
| Cosmic Elite Road Warrior Ruedas      |       165.00 |
| AeroFlo ATB Ruedas                    |       189.00 |
| Cycle-Doc Pro Repair Stand            |       166.00 |
| Road Warrior soporte para maletero    |       175.00 |
| Ultimate Export 2G baca para bibileta |       180.00 |
+---------------------------------------+--------------+
39 rows in set (0,00 sec)
-- 3
SELECT DISTINCT provincia FROM clientes;
+-----------+
| provincia |
+-----------+
| MADRID    |
| TOLEDO    |
| ORENSE    |
| CACERES   |
+-----------+
4 rows in set (0,00 sec)
-- 4
SELECT nombre, ciudad FROM proveedores 
ORDER BY ciudad;
+------------------------+--------------+
| nombre                 | ciudad       |
+------------------------+--------------+
| ProFormance            | Ademuz       |
| Big Sky Mountain Bikes | Albatana     |
| Nikoma of America      | Batres       |
| Shinoman, Incorporated | Belmonte     |
| Astro Paper productos  | Castroviejo  |
| Armadillo Brand        | Dosbarrios   |
| Lone Star Bike Supply  | Escalonilla  |
| Dog Ear                | Navalon      |
| Kona, Incorporated     | Robledo      |
| Viscount               | Santa Amalia |
| Sun Sports Suppliers   | Saucedilla   |
+------------------------+--------------+
11 rows in set (0,00 sec)
-- 5
SELECT CONCAT(pag_web," es la pagina web de ",nombre) AS Pagina FROM proveedores
    -> WHERE pag_web != 'NULL';
+----------------------------------------------------------------------+
| Pagina                                                               |
+----------------------------------------------------------------------+
| http://www.shinoman.com/ es la pagina web de Shinoman, Incorporated |
| http://www.viscountbikes.com/ es la pagina web de Viscount          |
| http://www.nikomabikes.com/ es la pagina web de Nikoma of America   |
| http://www.ProFormBikes.com/ es la pagina web de ProFormance        |
| http://www.konabikes.com/ es la pagina web de Kona, Incorporated    |
| http://www.DilloBikes.com/ es la pagina web de Armadillo Brand      |
+----------------------------------------------------------------------+
6 rows in set (0,00 sec)

-- 6
SELECT numero_pedido, DATEDIFF (fecha_envio, fecha_pedido) AS DIAS FROM pedidos LIMIT 10;
+---------------+------+
| numero_pedido | DIAS |
+---------------+------+
|             1 |    3 |
|             2 |    2 |
|             3 |    3 |
|             4 |    2 |
|             5 |    0 |
|             6 |    4 |
|             7 |    3 |
|             8 |    0 |
|             9 |    3 |
|            11 |    2 |
+---------------+------+
10 rows in set (0,00 sec)
-- 7
SELECT (precio_venta*stock) AS Valor_Inventario FROM productos 
LIMIT 10;
+------------------+
| Valor_Inventario |
+------------------+
|         14400.00 |
|          1500.00 |
|          1099.00 |
|            89.40 |
|          3175.00 |
|          1470.00 |
|          1000.00 |
|           396.00 |
|           720.00 |
|          8250.00 |
+------------------+
10 rows in set (0,00 sec)
-- 8
SELECT (precio_venta-(precio_venta*0.05)) AS precio_reducido FROM product
os;
+-----------------+
| precio_reducido |
+-----------------+
|       1710.0000 |
|         71.2500 |
|         52.2025 |
|          7.0775 |
|        603.2500 |
|         46.5500 |
|         47.5000 |
|         31.3500 |
|         34.2000 |
|       1567.5000 |
|         22.3250 |
|         64.1250 |
|        132.9525 |
|          4.7405 |
|         26.6000 |
|         42.7500 |
|        170.0500 |
|         44.6500 |
|         14.2500 |
|         52.2500 |
|         77.9000 |
|         80.7500 |
|         65.5500 |
|        132.0500 |
|        118.7500 |
|         22.8000 |
|         27.5500 |
|         32.3000 |
|         42.7500 |
|         20.9000 |
|         30.4000 |
|         18.0500 |
|         25.6500 |
|         37.0500 |
|        156.7500 |
|        179.5500 |
|        157.7000 |
|        166.2500 |
|        171.0000 |
+-----------------+
39 rows in set (0,00 sec)
-- 9
SELECT * FROM pedidos  ORDER BY id_cliente, fecha_pedido DESC LIMIT 5;
+---------------+--------------+-------------+------------+-------------+--------------+
| numero_pedido | fecha_pedido | fecha_envio | id_cliente | id_empleado | precio_total |
+---------------+--------------+-------------+------------+-------------+--------------+
|           931 | 2008-02-27   | 2008-02-27  |       1001 |         707 |       225.00 |
|           898 | 2008-02-21   | 2008-02-24  |       1001 |         708 |       727.50 |
|           887 | 2008-02-20   | 2008-02-23  |       1001 |         705 |      1493.60 |
|           855 | 2008-02-14   | 2008-02-15  |       1001 |         704 |       117.00 |
|           851 | 2008-02-13   | 2008-02-13  |       1001 |         702 |      1502.40 |
+---------------+--------------+-------------+------------+-------------+--------------+
5 rows in set (0,00 sec)
-- 10
SELECT nombre,direccion FROM proveedores
ORDER BY nombre;
+------------------------+---------------------------+
| nombre                 | direccion                 |
+------------------------+---------------------------+
| Armadillo Brand        | Calle de al lado 123      |
| Astro Paper productos  | Avda. del Rio 56          |
| Big Sky Mountain Bikes | Carretera del Sol 20      |
| Dog Ear                | Avda. Mar Salada 57       |
| Kona, Incorporated     | Apartado de correos 28429 |
| Lone Star Bike Supply  | Calle del rey 74          |
| Nikoma of America      | Carretera del Norte 88    |
| ProFormance            | Calle San Cirilo 29       |
| Shinoman, Incorporated | Calle Sur 34              |
| Sun Sports Suppliers   | Apartado 10082            |
| Viscount               | Calle Comercio 19         |
+------------------------+---------------------------+
11 rows in set (0.00 sec)
-- 11
SELECT nombre,apellidos FROM clientes
WHERE apellidos="Sanz";
+--------+-----------+
| nombre | apellidos |
+--------+-----------+
| David  | Sanz      |
+--------+-----------+
1 row in set (0.00 sec)
-- 12
SELECT * FROM pedidos
WHERE fecha_envio < fecha_pedido;
Empty set (0.00 sec)
-- 13
SELECT nombre, apellidos FROM clientes
WHERE ciudad="Somosierra" AND apellidos LIKE 'S%';
+--------+-----------+
| nombre | apellidos |
+--------+-----------+
| Julia  | Sandoval  |
+--------+-----------+
1 row in set (0.00 sec)
-- 14
SELECT nombre, apellidos FROM clientes
WHERE apellidos LIKE 'Pe%';
+---------+-----------+
| nombre  | apellidos |
+---------+-----------+
| Nicolas | Pelayo    |
| Raquel  | Pelayo    |
| Maria   | Pelayo    |
| Lucas   | Pelayo    |
+---------+-----------+
4 rows in set (0.00 sec)
-- 15
SELECT nombre, apellidos FROM clientes
WHERE ciudad="Somosierra" OR provincia="ORENSE";
+---------+-----------+
| nombre  | apellidos |
+---------+-----------+
| Maria   | Salgado   |
| Andres  | Cervera   |
| Jaime   | Vives     |
| Manuela | Seidel    |
| Julia   | Sandoval  |
| Lucas   | Pelayo    |
+---------+-----------+
6 rows in set (0.00 sec)
-- 16 
SELECT nombre, telefono FROM clientes
WHERE provincia="CACERES" OR provincia="ORENSE";
+----------+----------+
| nombre   | telefono |
+----------+----------+
| Maria    | 555-2526 |
| Nicolas  | 555-2541 |
| Raquel   | 555-2546 |
| Samuel   | 555-2611 |
| Daniel   | 555-2616 |
| Jaime    | 555-2636 |
| Manuela  | 555-2641 |
| David    | 555-2646 |
| Zacarias | 555-2721 |
| Camilo   | 555-0037 |
| Lucas    | 555-2316 |
+----------+----------+
11 rows in set (0.00 sec)
-- 17
SELECT * FROM pedidos
WHERE id_cliente=1001 AND fecha_pedido=fecha_envio;
+---------------+--------------+-------------+------------+-------------+--------------+
| numero_pedido | fecha_pedido | fecha_envio | id_cliente | id_empleado | precio_total |
+---------------+--------------+-------------+------------+-------------+--------------+
|           137 | 2007-09-23   | 2007-09-23  |       1001 |         706 |      1235.65 |
|           817 | 2008-02-08   | 2008-02-08  |       1001 |         705 |      1530.90 |
|           851 | 2008-02-13   | 2008-02-13  |       1001 |         702 |      1502.40 |
|           931 | 2008-02-27   | 2008-02-27  |       1001 |         707 |       225.00 |
+---------------+--------------+-------------+------------+-------------+--------------+
4 rows in set (0.00 sec)
-- 18
SELECT nombre,apellidos,provincia,cod_postal FROM clientes
    -> WHERE apellidos='Pelayo' OR provincia="CACERES" OR cod_postal LIKE '%9';
+-----------+-----------+-----------+------------+
| nombre    | apellidos | provincia | cod_postal |
+-----------+-----------+-----------+------------+
| Guillermo | Torres    | MADRID    | 28019      |
| Nicolas   | Pelayo    | CACERES   | 10199      |
| Raquel    | Pelayo    | CACERES   | 10199      |
| Samuel    | Abadia    | CACERES   | 10263      |
| Daniel    | Gil       | CACERES   | 10926      |
| David     | Sanz      | CACERES   | 10538      |
| Zacarias  | Escudero  | CACERES   | 10209      |
| Camilo    | Viescas   | CACERES   | 10809      |
| Maria     | Pelayo    | TOLEDO    | 45915      |
| Lucas     | Pelayo    | ORENSE    | 32208      |
+-----------+-----------+-----------+------------+
10 rows in set (0.00 sec)
-- 19
SELECT * FROM proveedores
WHERE provincia IN ('CACERES','SORIA','MADRID');
+---------+------------------------+---------------------------+------------+-----------+------------+----------------+----------------+-----------------------------+--------------------------+
| id_prov | nombre                 | direccion                 | ciudad     | provincia | cod_postal | telefono       | fax            | pag_web                     | email                    |
+---------+------------------------+---------------------------+------------+-----------+------------+----------------+----------------+-----------------------------+--------------------------+
|       1 | Shinoman, Incorporated | Calle Sur 34              | Belmonte   | MADRID    | 28001      | (91) 888-1234  | (91) 888-1235  | http://www.shinoman.com/    | Sales@Shiniman.com       |
|       3 | Nikoma of America      | Carretera del Norte 88    | Batres     | MADRID    | 28324      | (91) 666-1234  | (91) 666-1235  | http://www.nikomabikes.com/ | BuyBikes@NikomaBikes.com |
|       5 | Kona, Incorporated     | Apartado de correos 28429 | Robledo    | MADRID    | 28052      | (91) 333-1234  | (91) 333-1235  | http://www.konabikes.com/   | Sales@KonaBikes.com      |
|       8 | Sun Sports Suppliers   | Apartado 10082            | Saucedilla | CACERES   | 10003      | (927) 777-9876 | (310) 777-9877 | NULL                        | NULL                     |
+---------+------------------------+---------------------------+------------+-----------+------------+----------------+----------------+-----------------------------+--------------------------+
4 rows in set (0.00 sec)
-- 20
SELECT * FROM clientes
    -> WHERE ciudad NOT IN ('Robledo','Somosierra');
+------------+-----------+-----------+-----------------------------+--------------+-----------+------------+-------------+----------+
| id_cliente | nombre    | apellidos | direccion                   | ciudad       | provincia | cod_postal | codigo_area | telefono |
+------------+-----------+-----------+-----------------------------+--------------+-----------+------------+-------------+----------+
|       1002 | Guillermo | Torres    | Calle del Rio 122           | Daganzo      | MADRID    | 28019      |         425 | 555-2681 |
|       1003 | German    | Higueras  | Ruta 2, apartado 203B       | Acebeda (La) | MADRID    | 28002      |         253 | 555-2676 |
|       1004 | Roberto   | Blanes    | Avenida del Monte 672       | Hontanar     | TOLEDO    | 45201      |         713 | 555-2491 |
|       1007 | Maria     | Salgado   | Avenida Pirineos 901        | O Pereiro    | ORENSE    | 32208      |         503 | 555-2526 |
|       1008 | Nicolas   | Pelayo    | Valle Oeste 233             | Santa Ana    | CACERES   | 10199      |         619 | 555-2541 |
|       1010 | Angel     | Sanchez   | Carretera del Rio 667       | Ajofrin      | TOLEDO    | 45710      |         512 | 555-2571 |
|       1011 | Ana       | Higueras  | Ruta 2, apartado 203B       | Venturada    | MADRID    | 28072      |         425 | 555-2631 |
|       1012 | Lisa      | Colomer   | Calle Zurita 13             | Belmonte     | MADRID    | 28006      |         425 | 555-2556 |
|       1013 | Raquel    | Pelayo    |  Buena Vista 21             | Santa Ana    | CACERES   | 10199      |         619 | 555-2546 |
|       1014 | Samuel    | Abadia    | Avda de los Alpes 60        | Plasencia    | CACERES   | 10263      |         760 | 555-2611 |
|       1015 | Daniel    | Gil       | Calle del Mar 26            | Santa Ana    | CACERES   | 10926      |         530 | 555-2616 |
|       1016 | Jaime     | Vives     | Serrano 101                 | Seiro        | ORENSE    | 32301      |         503 | 555-2636 |
|       1017 | Manuela   | Seidel    | Coso 68                     | Mundil       | ORENSE    | 32501      |         541 | 555-2641 |
|       1018 | David     | Sanz      | Calle de Vallejuelo 31      | Fresnedoso   | CACERES   | 10538      |         510 | 555-2646 |
|       1019 | Zacarias  | Escudero  | Calle de kioto 123          | Garvin       | CACERES   | 10209      |         818 | 555-2721 |
|       1020 | Joaquin   | Bou       | Tamesis 24                  | Belmonte     | MADRID    | 28006      |         425 | 555-2726 |
|       1021 | Estella   | Punset    | Paseo Rosales 250           | Dosbarrios   | TOLEDO    | 45260      |         972 | 555-9938 |
|       1022 | Camilo    | Viescas   | Carretera Cuatro Vientos 45 | Ladrillar    | CACERES   | 10809      |         562 | 555-0037 |
|       1024 | Marcos    | Rosales   | Calle abogados 32           | Escalonilla  | TOLEDO    | 45915      |         915 | 555-2286 |
|       1025 | Maria     | Pelayo    | Carretera de Castellon 44   | Escalonilla  | TOLEDO    | 45915      |         915 | 555-2291 |
|       1026 | Luis      | Donoso    | Avda del Oeste 45           | San Roman    | TOLEDO    | 45284      |         210 | 555-2311 |
|       1027 | Lucas     | Pelayo    | Avda del Sur 87             | O Pereiro    | ORENSE    | 32208      |         503 | 555-2316 |
+------------+-----------+-----------+-----------------------------+--------------+-----------+------------+-------------+----------+
22 rows in set (0.00 sec)
-- 21
SELECT numero_pedido, id_cliente,fecha_pedido FROM pedidos
WHERE id_cliente=1001
ORDER BY fecha_pedido;
+---------------+------------+--------------+
| numero_pedido | id_cliente | fecha_pedido |
+---------------+------------+--------------+
|             2 |       1001 | 2007-09-01   |
|             7 |       1001 | 2007-09-01   |
|            16 |       1001 | 2007-09-02   |
|            55 |       1001 | 2007-09-09   |
|           107 |       1001 | 2007-09-16   |
|           137 |       1001 | 2007-09-23   |
|           138 |       1001 | 2007-09-24   |
|           151 |       1001 | 2007-09-27   |
|           154 |       1001 | 2007-09-29   |
|           213 |       1001 | 2007-10-11   |
|           320 |       1001 | 2007-11-02   |
|           346 |       1001 | 2007-11-07   |
|           349 |       1001 | 2007-11-08   |
|           394 |       1001 | 2007-11-18   |
|           408 |       1001 | 2007-11-23   |
|           413 |       1001 | 2007-11-24   |
|           425 |       1001 | 2007-11-26   |
|           426 |       1001 | 2007-11-26   |
|           443 |       1001 | 2007-11-29   |
|           452 |       1001 | 2007-11-30   |
|           475 |       1001 | 2007-12-06   |
|           501 |       1001 | 2007-12-11   |
|           564 |       1001 | 2007-12-24   |
|           567 |       1001 | 2007-12-25   |
|           596 |       1001 | 2007-12-31   |
|           608 |       1001 | 2008-01-02   |
|           632 |       1001 | 2008-01-07   |
|           649 |       1001 | 2008-01-09   |
|           657 |       1001 | 2008-01-10   |
|           701 |       1001 | 2008-01-17   |
|           723 |       1001 | 2008-01-21   |
|           732 |       1001 | 2008-01-23   |
|           817 |       1001 | 2008-02-08   |
|           851 |       1001 | 2008-02-13   |
|           855 |       1001 | 2008-02-14   |
|           887 |       1001 | 2008-02-20   |
|           898 |       1001 | 2008-02-21   |
|           931 |       1001 | 2008-02-27   |
+---------------+------------+--------------+
38 rows in set (0.00 sec)
-- 22
SELECT * FROM productos
WHERE nombre LIKE 'DOG%'
ORDER BY nombre;
+-----------------+------------------------------+-------------+--------------+-------+--------------+
| numero_producto | nombre                       | descripcion | precio_venta | stock | id_categoria |
+-----------------+------------------------------+-------------+--------------+-------+--------------+
|              21 | Dog Ear Aero-Flow Hinchador  | NULL        |        55.00 |    25 |            1 |
|               3 | Dog Ear Cyclecomputer        | NULL        |        75.00 |    20 |            1 |
|               5 | Dog Ear Helmet Mount Espejos | NULL        |         7.45 |    12 |            1 |
|              20 | Dog Ear Monster guantes      | NULL        |        15.00 |    30 |            1 |
+-----------------+------------------------------+-------------+--------------+-------+--------------+
4 rows in set (0.00 sec)
-- 23
SELECT nombre FROM proveedores
WHERE ciudad IN ('Batres','Belmonte','Robledo');
+------------------------+
| nombre                 |
+------------------------+
| Shinoman, Incorporated |
| Nikoma of America      |
| Kona, Incorporated     |
+------------------------+
3 rows in set (0.00 sec)
-- 24
SELECT nombre FROM productos
WHERE precio_venta >= 125.000;
+---------------------------------------+
| nombre                                |
+---------------------------------------+
| Eagle FS-3 Mountain Bike              |
| Viscount Mountain Bike                |
| GT RTS-2 Mountain Bike                |
| Eagle SA-120 Pedales sin clip         |
| Viscount CardioSport Sport Watch      |
| King Cobra Casco                      |
| Glide-O-Matic Cycling Casco           |
| Cosmic Elite Road Warrior Ruedas      |
| AeroFlo ATB Ruedas                    |
| Cycle-Doc Pro Repair Stand            |
| Road Warrior soporte para maletero    |
| Ultimate Export 2G baca para bibileta |
+---------------------------------------+
12 rows in set (0.00 sec)
-- 25
SELECT nombre, apellidos FROM clientes
WHERE provincia="MADRID" AND ciudad="Belmonte" AND cod_postal=45915 AND 
id_cliente IN (SELECT id_cliente FROM pedidos WHERE fecha_pedido LIKE '%-05-%');
Empty set (0.00 sec)
-- 26
SELECT numero_pedido FROM pedidos
WHERE numero_pedido IN (SELECT numero_pedido FROM detalles_pedidos WHERE numero_producto IN (SELECT numero_producto FROM productos WHERE numero_producto > (SELECT numero_producto FROM productos WHERE nombre="Shinoman 105 SC Frenos")))
LIMIT 10;
+---------------+
| numero_pedido |
+---------------+
|             2 |
|             7 |
|            16 |
|           107 |
|           137 |
|           138 |
|           151 |
|           154 |
|           213 |
|           320 |
+---------------+
10 rows in set (0.00 sec)
-- 27
SELECT nombre FROM proveedores
WHERE id_prov IN (SELECT id_prov FROM productos_proveedores WHERE numero_producto IN 
(SELECT numero_producto FROM productos WHERE nombre LIKE 'C%' AND numero_producto IN 
(SELECT numero_producto FROM detalles_pedidos WHERE numero_pedido IN 
(SELECT numero_pedido FROM pedidos WHERE fecha_envio < '2008-03-01')
)));
+------------------------+
| nombre                 |
+------------------------+
| Big Sky Mountain Bikes |
| Dog Ear                |
| Sun Sports Suppliers   |
| Lone Star Bike Supply  |
| Armadillo Brand        |
+------------------------+
5 rows in set (0.00 sec)
-- 28
SELECT nombre FROM proveedores
WHERE id_prov IN (SELECT id_prov FROM productos_proveedores WHERE numero_producto IN
(SELECT numero_producto FROM productos WHERE nombre LIKE 'V%' AND numero_producto NOT IN
(SELECT numero_producto FROM detalles_pedidos)
));
+------------------------+
| nombre                 |
+------------------------+
| Big Sky Mountain Bikes |
| Lone Star Bike Supply  |
+------------------------+
2 rows in set (0.00 sec)
-- 29
SELECT * FROM clientes
WHERE ciudad NOT IN (SELECT ciudad FROM empleados);
+------------+----------+-----------+-----------------------------+--------------+-----------+------------+-------------+----------+
| id_cliente | nombre   | apellidos | direccion                   | ciudad       | provincia | cod_postal | codigo_area | telefono |
+------------+----------+-----------+-----------------------------+--------------+-----------+------------+-------------+----------+
|       1003 | German   | Higueras  | Ruta 2, apartado 203B       | Acebeda (La) | MADRID    | 28002      |         253 | 555-2676 |
|       1004 | Roberto  | Blanes    | Avenida del Monte 672       | Hontanar     | TOLEDO    | 45201      |         713 | 555-2491 |
|       1007 | Maria    | Salgado   | Avenida Pirineos 901        | O Pereiro    | ORENSE    | 32208      |         503 | 555-2526 |
|       1008 | Nicolas  | Pelayo    | Valle Oeste 233             | Santa Ana    | CACERES   | 10199      |         619 | 555-2541 |
|       1010 | Angel    | Sanchez   | Carretera del Rio 667       | Ajofrin      | TOLEDO    | 45710      |         512 | 555-2571 |
|       1011 | Ana      | Higueras  | Ruta 2, apartado 203B       | Venturada    | MADRID    | 28072      |         425 | 555-2631 |
|       1013 | Raquel   | Pelayo    |  Buena Vista 21             | Santa Ana    | CACERES   | 10199      |         619 | 555-2546 |
|       1014 | Samuel   | Abadia    | Avda de los Alpes 60        | Plasencia    | CACERES   | 10263      |         760 | 555-2611 |
|       1015 | Daniel   | Gil       | Calle del Mar 26            | Santa Ana    | CACERES   | 10926      |         530 | 555-2616 |
|       1016 | Jaime    | Vives     | Serrano 101                 | Seiro        | ORENSE    | 32301      |         503 | 555-2636 |
|       1017 | Manuela  | Seidel    | Coso 68                     | Mundil       | ORENSE    | 32501      |         541 | 555-2641 |
|       1018 | David    | Sanz      | Calle de Vallejuelo 31      | Fresnedoso   | CACERES   | 10538      |         510 | 555-2646 |
|       1019 | Zacarias | Escudero  | Calle de kioto 123          | Garvin       | CACERES   | 10209      |         818 | 555-2721 |
|       1021 | Estella  | Punset    | Paseo Rosales 250           | Dosbarrios   | TOLEDO    | 45260      |         972 | 555-9938 |
|       1022 | Camilo   | Viescas   | Carretera Cuatro Vientos 45 | Ladrillar    | CACERES   | 10809      |         562 | 555-0037 |
|       1024 | Marcos   | Rosales   | Calle abogados 32           | Escalonilla  | TOLEDO    | 45915      |         915 | 555-2286 |
|       1025 | Maria    | Pelayo    | Carretera de Castellon 44   | Escalonilla  | TOLEDO    | 45915      |         915 | 555-2291 |
|       1027 | Lucas    | Pelayo    | Avda del Sur 87             | O Pereiro    | ORENSE    | 32208      |         503 | 555-2316 |
+------------+----------+-----------+-----------------------------+--------------+-----------+------------+-------------+----------+
18 rows in set (0.00 sec)
-- 30

-- 31
SELECT nombre FROM productos
WHERE id_categoria = (SELECT id_categoria FROM categorias WHERE descripcion="Componentes");
+------------------------------------+
| nombre                             |
+------------------------------------+
| Victoria Pro All Weather Llantas   |
| Shinoman 105 SC Frenos             |
| Shinoman Dura-Ace Auriculares      |
| Eagle SA-120 Pedales sin clip      |
| ProFormance clip para pedal 2G     |
| ProFormance ATB Pedal todo-terreno |
| Shinoman Deluxe TX-30 Pedal        |
| Cosmic Elite Road Warrior Ruedas   |
| AeroFlo ATB Ruedas                 |
+------------------------------------+
9 rows in set (0.03 sec)
-- 32
SELECT * FROM productos
WHERE precio_venta >= ALL (SELECT precio_venta FROM productos);
+-----------------+--------------------------+-------------+--------------+-------+--------------+
| numero_producto | nombre                   | descripcion | precio_venta | stock | id_categoria |
+-----------------+--------------------------+-------------+--------------+-------+--------------+
|               2 | Eagle FS-3 Mountain Bike | NULL        |      1800.00 |     8 |            2 |
+-----------------+--------------------------+-------------+--------------+-------+--------------+
1 row in set (0.00 sec)
-- 33
SELECT * FROM productos
WHERE precio_venta < (SELECT precio_venta FROM productos WHERE nombre="Eagle SA-120 Pedales sin clip")
ORDER BY precio_venta;
+-----------------+---------------------------------------+-------------+--------------+-------+--------------+
| numero_producto | nombre                                | descripcion | precio_venta | stock | id_categoria |
+-----------------+---------------------------------------+-------------+--------------+-------+--------------+
|              15 | ProFormance clip para pedal 2G        | NULL        |         4.99 |    40 |            4 |
|               5 | Dog Ear Helmet Mount Espejos          | NULL        |         7.45 |    12 |            1 |
|              20 | Dog Ear Monster guantes               | NULL        |        15.00 |    30 |            1 |
|              33 | Wonder Wool Cycle Calcetines          | NULL        |        19.00 |    30 |            3 |
|              31 | True Grip Competition Guantes         | NULL        |        22.00 |    20 |            1 |
|              12 | Shinoman 105 SC Frenos                | NULL        |        23.50 |    16 |            4 |
|              27 | X-Pro All Weather Llantas             | NULL        |        24.00 |    20 |            6 |
|              34 | TransPort Bicycle Parrilla            | NULL        |        27.00 |    14 |            1 |
|              16 | ProFormance ATB Pedal todo-terreno    | NULL        |        28.00 |    40 |            4 |
|              28 | Turbo Twin Llantas                    | NULL        |        29.00 |    18 |            6 |
|              32 | Kool-Breeze Rocket Top Jersey         | NULL        |        32.00 |    12 |            3 |
|               9 | Nikoma Lok-Tight U-Lock               | NULL        |        33.00 |    12 |            1 |
|              29 | Ultra-2K Competition Llanta           | NULL        |        34.00 |    22 |            6 |
|              10 | Viscount Microshell Casco             | NULL        |        36.00 |    20 |            1 |
|              35 | HP Deluxe Alforjas                    | NULL        |        39.00 |    10 |            1 |
|              17 | Shinoman Deluxe TX-30 Pedal           | NULL        |        45.00 |    60 |            4 |
|              30 | Clear Shade 85-T Gafas                | NULL        |        45.00 |    14 |            1 |
|              19 | Viscount Tru-Beat pulsometro          | NULL        |        47.00 |    20 |            1 |
|               7 | Viscount C-500 Wireless Bike Computer | NULL        |        49.00 |    30 |            1 |
|               8 | Kryptonite Advanced 2000 U-Lock       | NULL        |        50.00 |    20 |            1 |
|               4 | Victoria Pro All Weather Llantas      | NULL        |        54.95 |    20 |            4 |
|              21 | Dog Ear Aero-Flow Hinchador           | NULL        |        55.00 |    25 |            1 |
|              13 | Shinoman Dura-Ace Auriculares         | NULL        |        67.50 |    20 |            4 |
|              24 | StaDry Cycling culote                 | NULL        |        69.00 |    22 |            3 |
|               3 | Dog Ear Cyclecomputer                 | NULL        |        75.00 |    20 |            1 |
|              22 | Pro-Sport 'Dillo Gafas de sol         | NULL        |        82.00 |    18 |            1 |
|              23 | Ultra-Pro Rain maillot                | NULL        |        85.00 |    30 |            3 |
|              26 | Glide-O-Matic Cycling Casco           | NULL        |       125.00 |    24 |            1 |
|              25 | King Cobra Casco                      | NULL        |       139.00 |    30 |            1 |
+-----------------+---------------------------------------+-------------+--------------+-------+--------------+
29 rows in set (0.00 sec)
-- 34
SELECT * FROM productos
WHERE precio_venta > ALL (SELECT precio_venta FROM productos WHERE id_categoria=(SELECT id_categoria FROM categorias WHERE descripcion="Componentes"));
+-----------------+--------------------------+-------------+--------------+-------+--------------+
| numero_producto | nombre                   | descripcion | precio_venta | stock | id_categoria |
+-----------------+--------------------------+-------------+--------------+-------+--------------+
|               2 | Eagle FS-3 Mountain Bike | NULL        |      1800.00 |     8 |            2 |
|               6 | Viscount Mountain Bike   | NULL        |       635.00 |     5 |            2 |
|              11 | GT RTS-2 Mountain Bike   | NULL        |      1650.00 |     5 |            2 |
+-----------------+--------------------------+-------------+--------------+-------+--------------+
3 rows in set (0.00 sec)
-- 35
SELECT * FROM clientes
WHERE ciudad = (SELECT ciudad FROM clientes WHERE id_cliente=1001) AND id_cliente NOT IN ("1001");
+------------+--------+------------+------------------------+---------+-----------+------------+-------------+----------+
| id_cliente | nombre | apellidos  | direccion              | ciudad  | provincia | cod_postal | codigo_area | telefono |
+------------+--------+------------+------------------------+---------+-----------+------------+-------------+----------+
|       1005 | Daniel | Manzanares | Camino Viejo 4110      | Robledo | MADRID    | 28052      |         425 | 555-2506 |
|       1006 | Juan   | Viescas    | Ronda Noreste, num 383 | Robledo | MADRID    | 28052      |         425 | 555-2511 |
|       1028 | Javier | Tirado     | Calle Mayor 42         | Robledo | MADRID    | 28052      |         425 | 555-9999 |
+------------+--------+------------+------------------------+---------+-----------+------------+-------------+----------+
3 rows in set (0.00 sec)
-- 36
SELECT * FROM productos
WHERE precio_venta IN (SELECT MIN(precio_venta) FROM productos GROUP BY id_categoria);
+-----------------+------------------------------------+-------------+--------------+-------+--------------+
| numero_producto | nombre                             | descripcion | precio_venta | stock | id_categoria |
+-----------------+------------------------------------+-------------+--------------+-------+--------------+
|               5 | Dog Ear Helmet Mount Espejos       | NULL        |         7.45 |    12 |            1 |
|               6 | Viscount Mountain Bike             | NULL        |       635.00 |     5 |            2 |
|              15 | ProFormance clip para pedal 2G     | NULL        |         4.99 |    40 |            4 |
|              27 | X-Pro All Weather Llantas          | NULL        |        24.00 |    20 |            6 |
|              33 | Wonder Wool Cycle Calcetines       | NULL        |        19.00 |    30 |            3 |
|              39 | Road Warrior soporte para maletero | NULL        |       175.00 |     6 |            5 |
+-----------------+------------------------------------+-------------+--------------+-------+--------------+
6 rows in set (0.00 sec)
-- 37
SELECT * FROM categorias
WHERE id_categoria NOT IN (SELECT id_categoria FROM productos);
+--------------+-------------+
| id_categoria | descripcion |
+--------------+-------------+
|            7 | Scooters    |
+--------------+-------------+
1 row in set (0.00 sec)
-- 38
SELECT pedidos.*, clientes.nombre,empleados.nombre FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente=clientes.id_cliente
INNER JOIN empleados ON pedidos.id_empleado=empleados.id_empleado
LIMIT 30;
+---------------+--------------+-------------+------------+-------------+--------------+---------+--------+
| numero_pedido | fecha_pedido | fecha_envio | id_cliente | id_empleado | precio_total | nombre  | nombre |
+---------------+--------------+-------------+------------+-------------+--------------+---------+--------+
|           660 | 2008-01-11   | 2008-01-14  |       1027 |         702 |      2937.55 | Lucas   | Maria  |
|           237 | 2007-10-17   | 2007-10-19  |       1027 |         702 |      4732.33 | Lucas   | Maria  |
|            68 | 2007-09-11   | 2007-09-12  |       1027 |         702 |       273.54 | Lucas   | Maria  |
|            37 | 2007-09-07   | 2007-09-11  |       1027 |         702 |      1718.78 | Lucas   | Maria  |
|           630 | 2008-01-07   | 2008-01-09  |       1026 |         702 |     13851.14 | Luis    | Maria  |
|           557 | 2007-12-23   | 2007-12-23  |       1026 |         702 |      8430.09 | Luis    | Maria  |
|            22 | 2007-09-03   | 2007-09-07  |       1026 |         702 |      6456.16 | Luis    | Maria  |
|           925 | 2008-02-26   | 2008-02-26  |       1025 |         702 |      2907.63 | Maria   | Maria  |
|           896 | 2008-02-21   | 2008-02-24  |       1025 |         702 |      6634.00 | Maria   | Maria  |
|           103 | 2007-09-15   | 2007-09-16  |       1025 |         702 |      9373.54 | Maria   | Maria  |
|            67 | 2007-09-10   | 2007-09-11  |       1025 |         702 |       877.00 | Maria   | Maria  |
|           391 | 2007-11-17   | 2007-11-17  |       1024 |         702 |      5478.55 | Marcos  | Maria  |
|           315 | 2007-11-01   | 2007-11-05  |       1024 |         702 |      8799.15 | Marcos  | Maria  |
|           120 | 2007-09-20   | 2007-09-21  |       1024 |         702 |      3904.25 | Marcos  | Maria  |
|           911 | 2008-02-24   | 2008-02-26  |       1023 |         702 |       705.75 | Julia   | Maria  |
|           889 | 2008-02-20   | 2008-02-24  |       1023 |         702 |       136.00 | Julia   | Maria  |
|           626 | 2008-01-06   | 2008-01-10  |       1023 |         702 |      6612.00 | Julia   | Maria  |
|           620 | 2008-01-05   | 2008-01-07  |       1023 |         702 |      8927.12 | Julia   | Maria  |
|           591 | 2007-12-30   | 2008-01-02  |       1023 |         702 |      2991.50 | Julia   | Maria  |
|           405 | 2007-11-20   | 2007-11-23  |       1023 |         702 |      6988.65 | Julia   | Maria  |
|           432 | 2007-11-27   | 2007-11-30  |       1022 |         702 |      1204.12 | Camilo  | Maria  |
|           192 | 2007-10-06   | 2007-10-09  |       1022 |         702 |      1293.14 | Camilo  | Maria  |
|           187 | 2007-10-06   | 2007-10-07  |       1022 |         702 |       624.68 | Camilo  | Maria  |
|           178 | 2007-10-04   | 2007-10-07  |       1022 |         702 |       927.25 | Camilo  | Maria  |
|           868 | 2008-02-16   | 2008-02-18  |       1021 |         702 |      1231.90 | Estella | Maria  |
|           749 | 2008-01-25   | 2008-01-29  |       1021 |         702 |       200.00 | Estella | Maria  |
|           944 | 2008-02-28   | 2008-03-02  |       1020 |         702 |      7768.90 | Joaquin | Maria  |
|           935 | 2008-02-27   | 2008-03-01  |       1020 |         702 |      5510.00 | Joaquin | Maria  |
|           873 | 2008-02-17   | 2008-02-18  |       1020 |         702 |      7168.95 | Joaquin | Maria  |
|           536 | 2007-12-17   | 2007-12-20  |       1020 |         702 |      1719.87 | Joaquin | Maria  |
+---------------+--------------+-------------+------------+-------------+--------------+---------+--------+
30 rows in set (0,01 sec)
-- 40
SELECT pedidos.*,productos.descripcion, clientes.nombre FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente=clientes.id_cliente
INNER JOIN detalles_pedidos ON pedidos.numero_pedido=detalles_pedidos.numero_pedido
INNER JOIN productos ON detalles_pedidos.numero_producto=productos.numero_producto
ORDER BY clientes.id_cliente
LIMIT 30;
+---------------+--------------+-------------+------------+-------------+--------------+-------------+--------+
| numero_pedido | fecha_pedido | fecha_envio | id_cliente | id_empleado | precio_total | descripcion | nombre |
+---------------+--------------+-------------+------------+-------------+--------------+-------------+--------+
|           349 | 2007-11-08   | 2007-11-09  |       1001 |         703 |       725.80 | NULL        | Susana |
|           154 | 2007-09-29   | 2007-10-02  |       1001 |         703 |      1360.05 | NULL        | Susana |
|            16 | 2007-09-02   | 2007-09-06  |       1001 |         707 |      2007.54 | NULL        | Susana |
|           443 | 2007-11-29   | 2007-12-02  |       1001 |         704 |      2123.95 | NULL        | Susana |
|           723 | 2008-01-21   | 2008-01-24  |       1001 |         707 |      1276.10 | NULL        | Susana |
|           596 | 2007-12-31   | 2008-01-04  |       1001 |         702 |      1793.45 | NULL        | Susana |
|           501 | 2007-12-11   | 2007-12-14  |       1001 |         702 |       548.95 | NULL        | Susana |
|           107 | 2007-09-16   | 2007-09-20  |       1001 |         703 |      1240.40 | NULL        | Susana |
|           426 | 2007-11-26   | 2007-11-29  |       1001 |         707 |      1294.00 | NULL        | Susana |
|           657 | 2008-01-10   | 2008-01-13  |       1001 |         706 |       773.00 | NULL        | Susana |
|           138 | 2007-09-24   | 2007-09-27  |       1001 |         702 |      1122.70 | NULL        | Susana |
|           394 | 2007-11-18   | 2007-11-21  |       1001 |         702 |       130.97 | NULL        | Susana |
|           649 | 2008-01-09   | 2008-01-13  |       1001 |         707 |       686.76 | NULL        | Susana |
|           887 | 2008-02-20   | 2008-02-23  |       1001 |         705 |      1493.60 | NULL        | Susana |
|            16 | 2007-09-02   | 2007-09-06  |       1001 |         707 |      2007.54 | NULL        | Susana |
|           137 | 2007-09-23   | 2007-09-23  |       1001 |         706 |      1235.65 | NULL        | Susana |
|           501 | 2007-12-11   | 2007-12-14  |       1001 |         702 |       548.95 | NULL        | Susana |
|           851 | 2008-02-13   | 2008-02-13  |       1001 |         702 |      1502.40 | NULL        | Susana |
|           567 | 2007-12-25   | 2007-12-27  |       1001 |         703 |       882.50 | NULL        | Susana |
|           213 | 2007-10-11   | 2007-10-12  |       1001 |         707 |       492.96 | NULL        | Susana |
|           564 | 2007-12-24   | 2007-12-26  |       1001 |         706 |       214.00 | NULL        | Susana |
|            55 | 2007-09-09   | 2007-09-11  |       1001 |         707 |        36.00 | NULL        | Susana |
|           346 | 2007-11-07   | 2007-11-11  |       1001 |         702 |      1253.70 | NULL        | Susana |
|           608 | 2008-01-02   | 2008-01-06  |       1001 |         706 |       633.05 | NULL        | Susana |
|           608 | 2008-01-02   | 2008-01-06  |       1001 |         706 |       633.05 | NULL        | Susana |
|           851 | 2008-02-13   | 2008-02-13  |       1001 |         702 |      1502.40 | NULL        | Susana |
|           817 | 2008-02-08   | 2008-02-08  |       1001 |         705 |      1530.90 | NULL        | Susana |
|           138 | 2007-09-24   | 2007-09-27  |       1001 |         702 |      1122.70 | NULL        | Susana |
|             7 | 2007-09-01   | 2007-09-04  |       1001 |         708 |       467.85 | NULL        | Susana |
|           425 | 2007-11-26   | 2007-11-30  |       1001 |         707 |       286.00 | NULL        | Susana |
+---------------+--------------+-------------+------------+-------------+--------------+-------------+--------+
30 rows in set (0,02 sec)
-- 41
ysql> SELECT productos.*, categorias.descripcion FROM productos
    -> INNER JOIN categorias ON productos.id_categoria = categorias.id_categoria;
+-----------------+---------------------------------------+-------------+--------------+-------+--------------+--------------------+
| numero_producto | nombre                                | descripcion | precio_venta | stock | id_categoria | descripcion        |
+-----------------+---------------------------------------+-------------+--------------+-------+--------------+--------------------+
|               3 | Dog Ear Cyclecomputer                 | NULL        |        75.00 |    20 |            1 | Accesorios         |
|               5 | Dog Ear Helmet Mount Espejos          | NULL        |         7.45 |    12 |            1 | Accesorios         |
|               7 | Viscount C-500 Wireless Bike Computer | NULL        |        49.00 |    30 |            1 | Accesorios         |
|               8 | Kryptonite Advanced 2000 U-Lock       | NULL        |        50.00 |    20 |            1 | Accesorios         |
|               9 | Nikoma Lok-Tight U-Lock               | NULL        |        33.00 |    12 |            1 | Accesorios         |
|              10 | Viscount Microshell Casco             | NULL        |        36.00 |    20 |            1 | Accesorios         |
|              18 | Viscount CardioSport Sport Watch      | NULL        |       179.00 |    12 |            1 | Accesorios         |
|              19 | Viscount Tru-Beat pulsometro          | NULL        |        47.00 |    20 |            1 | Accesorios         |
|              20 | Dog Ear Monster guantes               | NULL        |        15.00 |    30 |            1 | Accesorios         |
|              21 | Dog Ear Aero-Flow Hinchador           | NULL        |        55.00 |    25 |            1 | Accesorios         |
|              22 | Pro-Sport 'Dillo Gafas de sol         | NULL        |        82.00 |    18 |            1 | Accesorios         |
|              25 | King Cobra Casco                      | NULL        |       139.00 |    30 |            1 | Accesorios         |
|              26 | Glide-O-Matic Cycling Casco           | NULL        |       125.00 |    24 |            1 | Accesorios         |
|              30 | Clear Shade 85-T Gafas                | NULL        |        45.00 |    14 |            1 | Accesorios         |
|              31 | True Grip Competition Guantes         | NULL        |        22.00 |    20 |            1 | Accesorios         |
|              34 | TransPort Bicycle Parrilla            | NULL        |        27.00 |    14 |            1 | Accesorios         |
|              35 | HP Deluxe Alforjas                    | NULL        |        39.00 |    10 |            1 | Accesorios         |
|              38 | Cycle-Doc Pro Repair Stand            | NULL        |       166.00 |    12 |            1 | Accesorios         |
|               2 | Eagle FS-3 Mountain Bike              | NULL        |      1800.00 |     8 |            2 | Bicicletas         |
|               6 | Viscount Mountain Bike                | NULL        |       635.00 |     5 |            2 | Bicicletas         |
|              11 | GT RTS-2 Mountain Bike                | NULL        |      1650.00 |     5 |            2 | Bicicletas         |
|              23 | Ultra-Pro Rain maillot                | NULL        |        85.00 |    30 |            3 | Ropa               |
|              24 | StaDry Cycling culote                 | NULL        |        69.00 |    22 |            3 | Ropa               |
|              32 | Kool-Breeze Rocket Top Jersey         | NULL        |        32.00 |    12 |            3 | Ropa               |
|              33 | Wonder Wool Cycle Calcetines          | NULL        |        19.00 |    30 |            3 | Ropa               |
|               4 | Victoria Pro All Weather Llantas      | NULL        |        54.95 |    20 |            4 | Componentes        |
|              12 | Shinoman 105 SC Frenos                | NULL        |        23.50 |    16 |            4 | Componentes        |
|              13 | Shinoman Dura-Ace Auriculares         | NULL        |        67.50 |    20 |            4 | Componentes        |
|              14 | Eagle SA-120 Pedales sin clip         | NULL        |       139.95 |    20 |            4 | Componentes        |
|              15 | ProFormance clip para pedal 2G        | NULL        |         4.99 |    40 |            4 | Componentes        |
|              16 | ProFormance ATB Pedal todo-terreno    | NULL        |        28.00 |    40 |            4 | Componentes        |
|              17 | Shinoman Deluxe TX-30 Pedal           | NULL        |        45.00 |    60 |            4 | Componentes        |
|              36 | Cosmic Elite Road Warrior Ruedas      | NULL        |       165.00 |    22 |            4 | Componentes        |
|              37 | AeroFlo ATB Ruedas                    | NULL        |       189.00 |    40 |            4 | Componentes        |
|              39 | Road Warrior soporte para maletero    | NULL        |       175.00 |     6 |            5 | **** para el coche |
|              40 | Ultimate Export 2G baca para bibileta | NULL        |       180.00 |     8 |            5 | **** para el coche |
|              27 | X-Pro All Weather Llantas             | NULL        |        24.00 |    20 |            6 | Ruedas             |
|              28 | Turbo Twin Llantas                    | NULL        |        29.00 |    18 |            6 | Ruedas             |
|              29 | Ultra-2K Competition Llanta           | NULL        |        34.00 |    22 |            6 | Ruedas             |
+-----------------+---------------------------------------+-------------+--------------+-------+--------------+--------------------+
39 rows in set (0,01 sec)
-- 42
SELECT detalles_pedidos.numero_pedido,productos.descripcion,detalles_pedidos.precio,detalles_pedidos.cantidad FROM detalles_pedidos
INNER JOIN productos ON detalles_pedidos.numero_producto=productos.numero_producto
LIMIT 30;
+---------------+-------------+---------+----------+
| numero_pedido | descripcion | precio  | cantidad |
+---------------+-------------+---------+----------+
|             6 | NULL        | 1746.00 |        5 |
|           105 | NULL        | 1746.00 |        5 |
|           111 | NULL        | 1746.00 |        6 |
|           152 | NULL        | 1800.00 |        3 |
|           237 | NULL        | 1800.00 |        2 |
|           265 | NULL        | 1800.00 |        4 |
|           356 | NULL        | 1800.00 |        1 |
|           375 | NULL        | 1800.00 |        2 |
|           404 | NULL        | 1746.00 |        5 |
|           469 | NULL        | 1746.00 |        5 |
|           661 | NULL        | 1800.00 |        3 |
|           666 | NULL        | 1800.00 |        3 |
|           741 | NULL        | 1800.00 |        4 |
|           783 | NULL        | 1800.00 |        3 |
|           854 | NULL        | 1746.00 |        5 |
|           862 | NULL        | 1746.00 |        6 |
|           902 | NULL        | 1800.00 |        4 |
|            21 | NULL        |   75.00 |        3 |
|            93 | NULL        |   75.00 |        1 |
|           100 | NULL        |   75.00 |        3 |
|           212 | NULL        |   75.00 |        2 |
|           364 | NULL        |   75.00 |        3 |
|           525 | NULL        |   75.00 |        2 |
|           555 | NULL        |   72.75 |        5 |
|           619 | NULL        |   75.00 |        3 |
|           644 | NULL        |   75.00 |        2 |
|           647 | NULL        |   75.00 |        1 |
|           726 | NULL        |   75.00 |        2 |
|           775 | NULL        |   75.00 |        3 |
|            36 | NULL        |    7.45 |        1 |
+---------------+-------------+---------+----------+
30 rows in set (0,01 sec)
-- 43
SELECT DISTINCT detalles_pedidos.numero_producto,proveedores.nombre FROM detalles_pedidos
INNER JOIN productos ON detalles_pedidos.numero_producto=productos.numero_producto
INNER JOIN productos_proveedores ON productos.numero_producto= productos_proveedores.numero_producto
INNER JOIN proveedores ON productos_proveedores.id_prov= proveedores.id_prov
WHERE proveedores.provincia="Madrid";
+-----------------+------------------------+
| numero_producto | nombre                 |
+-----------------+------------------------+
|              12 | Shinoman, Incorporated |
|              13 | Shinoman, Incorporated |
|              17 | Shinoman, Incorporated |
|               9 | Nikoma of America      |
|              11 | Nikoma of America      |
|              26 | Nikoma of America      |
|              27 | Nikoma of America      |
|              28 | Nikoma of America      |
|              29 | Kona, Incorporated     |
+-----------------+------------------------+
9 rows in set (0,01 sec)
-- 44
SELECT clientes.nombre,pedidos.numero_pedido,pedidos.id_empleado,empleados.nombre FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente=clientes.id_cliente
INNER JOIN empleados ON pedidos.id_empleado=empleados.id_empleado
LIMIT 20;
+-----------+---------------+-------------+--------+
| nombre    | numero_pedido | id_empleado | nombre |
+-----------+---------------+-------------+--------+
| Samuel    |             6 |         702 | Maria  |
| Samuel    |            17 |         702 | Maria  |
| Samuel    |            21 |         702 | Maria  |
| Luis      |            22 |         702 | Maria  |
| Lucas     |            37 |         702 | Maria  |
| Manuela   |            38 |         702 | Maria  |
| Samuel    |            56 |         702 | Maria  |
| Maria     |            67 |         702 | Maria  |
| Lucas     |            68 |         702 | Maria  |
| Maria     |           103 |         702 | Maria  |
| Angel     |           113 |         702 | Maria  |
| Marcos    |           120 |         702 | Maria  |
| Susana    |           138 |         702 | Maria  |
| David     |           142 |         702 | Maria  |
| German    |           153 |         702 | Maria  |
| Manuela   |           165 |         702 | Maria  |
| Camilo    |           178 |         702 | Maria  |
| Guillermo |           182 |         702 | Maria  |
| Manuela   |           185 |         702 | Maria  |
| Camilo    |           187 |         702 | Maria  |
+-----------+---------------+-------------+--------+
20 rows in set (0,01 sec)
-- 45
SELECT productos.*,categorias.descripcion FROM productos 
INNER JOIN categorias ON productos.id_categoria=categorias.id_categoria
INNER JOIN productos_proveedores ON productos.numero_producto= productos_proveedores.numero_producto
INNER JOIN proveedores ON productos_proveedores.id_prov= proveedores.id_prov
WHERE proveedores.provincia="Valencia";
+-----------------+------------------------------------+-------------+--------------+-------+--------------+--------------------+
| numero_producto | nombre                             | descripcion | precio_venta | stock | id_categoria | descripcion        |
+-----------------+------------------------------------+-------------+--------------+-------+--------------+--------------------+
|              15 | ProFormance clip para pedal 2G     | NULL        |         4.99 |    40 |            4 | Componentes        |
|              16 | ProFormance ATB Pedal todo-terreno | NULL        |        28.00 |    40 |            4 | Componentes        |
|               3 | Dog Ear Cyclecomputer              | NULL        |        75.00 |    20 |            1 | Accesorios         |
|               5 | Dog Ear Helmet Mount Espejos       | NULL        |         7.45 |    12 |            1 | Accesorios         |
|              20 | Dog Ear Monster guantes            | NULL        |        15.00 |    30 |            1 | Accesorios         |
|              21 | Dog Ear Aero-Flow Hinchador        | NULL        |        55.00 |    25 |            1 | Accesorios         |
|              24 | StaDry Cycling culote              | NULL        |        69.00 |    22 |            3 | Ropa               |
|              31 | True Grip Competition Guantes      | NULL        |        22.00 |    20 |            1 | Accesorios         |
|              32 | Kool-Breeze Rocket Top Jersey      | NULL        |        32.00 |    12 |            3 | Ropa               |
|              36 | Cosmic Elite Road Warrior Ruedas   | NULL        |       165.00 |    22 |            4 | Componentes        |
|              39 | Road Warrior soporte para maletero | NULL        |       175.00 |     6 |            5 | **** para el coche |
+-----------------+------------------------------------+-------------+--------------+-------+--------------+--------------------+
11 rows in set (0,00 sec)
-- 46
SELECT pedidos.fecha_pedido,productos.descripcion,detalles_pedidos.cantidad FROM pedidos
INNER JOIN detalles_pedidos ON pedidos.numero_pedido=detalles_pedidos.numero_pedido
INNER JOIN productos ON detalles_pedidos.numero_producto=productos.numero_producto
WHERE pedidos.id_cliente = (SELECT id_cliente FROM clientes WHERE nombre="Susana" AND apellidos="Viescas")
LIMIT 30;
+--------------+-------------+----------+
| fecha_pedido | descripcion | cantidad |
+--------------+-------------+----------+
| 2007-09-01   | NULL        |        4 |
| 2007-09-01   | NULL        |        4 |
| 2007-09-01   | NULL        |        3 |
| 2007-09-01   | NULL        |        2 |
| 2007-09-02   | NULL        |        1 |
| 2007-09-02   | NULL        |        2 |
| 2007-09-02   | NULL        |        3 |
| 2007-09-02   | NULL        |        4 |
| 2007-09-02   | NULL        |        3 |
| 2007-09-02   | NULL        |        6 |
| 2007-09-02   | NULL        |        6 |
| 2007-09-09   | NULL        |        1 |
| 2007-09-16   | NULL        |        2 |
| 2007-09-16   | NULL        |        3 |
| 2007-09-16   | NULL        |        5 |
| 2007-09-16   | NULL        |        1 |
| 2007-09-16   | NULL        |        4 |
| 2007-09-23   | NULL        |        3 |
| 2007-09-23   | NULL        |        2 |
| 2007-09-23   | NULL        |        1 |
| 2007-09-23   | NULL        |        5 |
| 2007-09-24   | NULL        |        4 |
| 2007-09-24   | NULL        |        3 |
| 2007-09-24   | NULL        |        5 |
| 2007-09-24   | NULL        |        1 |
| 2007-09-24   | NULL        |        4 |
| 2007-09-24   | NULL        |        2 |
| 2007-09-27   | NULL        |        4 |
| 2007-09-29   | NULL        |        4 |
| 2007-09-29   | NULL        |        5 |
+--------------+-------------+----------+
30 rows in set (0,00 sec)



