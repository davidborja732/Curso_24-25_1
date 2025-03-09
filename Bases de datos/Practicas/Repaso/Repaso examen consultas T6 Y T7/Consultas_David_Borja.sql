-- 1
SELECT nombre FROM aviones
WHERE id_avion IN (SELECT id_avion FROM certificado WHERE id_emp IN (SELECT id_emp FROM empleados WHERE salario > 80000));
+--------------------------------+
| nombre                         |
+--------------------------------+
| Boeing 747-400                 |
| Boeing 737-800                 |
| Airbus A340-300                |
| British Aerospace Jetstream 41 |
| Embraer ERJ-145                |
| SAAB 340                       |
| Piper Archer III               |
| Tupolev 154                    |
| Lockheed L1011                 |
| Boeing 757-300                 |
| Boeing 777-300                 |
| Boeing 767-400ER               |
| Airbus A320                    |
| Airbus A319                    |
| Boeing 727                     |
+--------------------------------+
15 rows in set (0.00 sec)
-- 2
SELECT id_emp,certificado.id_avion,aviones.autonomia FROM certificado
INNER JOIN aviones ON certificado.id_avion = aviones.id_avion 
WHERE id_emp IN (SELECT id_emp FROM certificado GROUP BY id_emp HAVING COUNT(id_emp)>1);
+-----------+----------+-----------+
| id_emp    | id_avion | autonomia |
+-----------+----------+-----------+
| 142519864 |        1 |      8430 |
| 269734834 |        1 |      8430 |
| 550156548 |        1 |      8430 |
| 567354612 |        1 |      8430 |
|  11564812 |        2 |      3383 |
| 141582651 |        2 |      3383 |
| 142519864 |        2 |      3383 |
| 242518965 |        2 |      3383 |
| 269734834 |        2 |      3383 |
| 552455318 |        2 |      3383 |
| 556784565 |        2 |      3383 |
| 567354612 |        2 |      3383 |
| 142519864 |        3 |      7120 |
| 269734834 |        3 |      7120 |
| 390487451 |        3 |      7120 |
| 556784565 |        3 |      7120 |
| 567354612 |        3 |      7120 |
| 573284895 |        3 |      7120 |
| 269734834 |        4 |      1502 |
| 567354612 |        4 |      1502 |
| 573284895 |        4 |      1502 |
| 159542516 |        5 |      1530 |
| 269734834 |        5 |      1530 |
| 556784565 |        5 |      1530 |
| 567354612 |        5 |      1530 |
| 573284895 |        5 |      1530 |
| 269734834 |        6 |      2128 |
| 574489456 |        6 |      2128 |
| 142519864 |        7 |       520 |
| 159542516 |        7 |       520 |
| 269734834 |        7 |       520 |
| 552455318 |        7 |       520 |
| 567354612 |        7 |       520 |
| 269734834 |        8 |      4103 |
| 310454876 |        8 |      4103 |
| 355548984 |        8 |      4103 |
| 574489456 |        8 |      4103 |
| 269734834 |        9 |      6900 |
| 310454876 |        9 |      6900 |
| 355548984 |        9 |      6900 |
| 567354612 |        9 |      6900 |
|  11564812 |       10 |      4010 |
| 141582651 |       10 |      4010 |
| 142519864 |       10 |      4010 |
| 242518965 |       10 |      4010 |
| 269734834 |       10 |      4010 |
| 274878974 |       10 |      4010 |
| 567354612 |       10 |      4010 |
| 142519864 |       11 |      6441 |
| 269734834 |       11 |      6441 |
| 567354612 |       11 |      6441 |
| 141582651 |       12 |      6475 |
| 142519864 |       12 |      6475 |
| 269734834 |       12 |      6475 |
| 274878974 |       12 |      6475 |
| 550156548 |       12 |      6475 |
| 567354612 |       12 |      6475 |
| 142519864 |       13 |      2605 |
| 269734834 |       13 |      2605 |
| 390487451 |       13 |      2605 |
| 269734834 |       14 |      1805 |
| 390487451 |       14 |      1805 |
| 552455318 |       14 |      1805 |
| 269734834 |       15 |      1504 |
| 567354612 |       15 |      1504 |
+-----------+----------+-----------+
65 rows in set (0.00 sec)
-- 3
SELECT nombre,salario FROM empleados 
WHERE salario>(SELECT MIN(precio) FROM vuelos
WHERE origen="Los Angeles" AND destino = "Honolulu"
GROUP BY vuelo_no
HAVING MIN(precio)<=ALL(SELECT MIN(precio) FROM vuelos WHERE origen="Los Angeles" AND destino = "Honolulu" GROUP BY vuelo_no));
+------------------+-----------+
| nombre           | salario   |
+------------------+-----------+
| John Williams    | 153972.00 |
| Donald McDonald  |  18050.00 |
| Elizabeth Taylor |  32021.00 |
| Mary Johnson     | 178345.00 |
| Beatriz Asa      | 227489.00 |
| William Moore    |  48250.00 |
| James Smith      | 120433.00 |
| Barbara Wilson   |  43723.00 |
| Patricia Jones   |  24450.00 |
| Jorge Gracia     | 289950.00 |
| Bugs Bunny       |  20520.00 |
| Michael Miller   |  99890.00 |
| Miguel Gomez     |  48090.00 |
| Joseph Thompson  | 212156.00 |
| Chad Stewart     |  33546.00 |
| Enrique Salas    |  32899.00 |
| Angela Martinez  | 212156.00 |
| Robert Brown     |  44740.00 |
| Chandler Bing    |  18756.00 |
| Lawrence Sperry  | 212156.00 |
| Dana Scully      |  26789.00 |
| David Anderson   | 743001.00 |
| Richard Jackson  |  23980.00 |
| Linda Davis      | 127984.00 |
| William Ward     |  84476.00 |
| Karen Scott      | 205187.00 |
| Larry Kane       | 101745.00 |
| Dorothy Lewis    |  92013.00 |
| Mark Young       | 205187.00 |
| Lisa Walker      | 256481.00 |
| Eric Cooper      | 114323.00 |
| William Jones    | 105743.00 |
| Maria Lopez      |  15450.00 |
| Bruce Lee        |  20000.00 |
| Pobre Diablo     |   2000.00 |
| Jennifer Thomas  |  54921.00 |
+------------------+-----------+
36 rows in set (0.00 sec)
-- 4
SELECT aviones.nombre,AVG(empleados.salario) FROM aviones
INNER JOIN certificado ON aviones.id_avion = certificado.id_avion
INNER JOIN empleados ON certificado.id_emp=empleados.id_emp
WHERE autonomia>1000
GROUP BY aviones.nombre;
+--------------------------------+------------------------+
| nombre                         | AVG(empleados.salario) |
+--------------------------------+------------------------+
| Boeing 747-400                 |          244776.750000 |
| Boeing 737-800                 |          191700.250000 |
| Airbus A340-300                |          217597.666667 |
| British Aerospace Jetstream 41 |          220251.333333 |
| Embraer ERJ-145                |          182838.200000 |
| SAAB 340                       |          118113.500000 |
| Tupolev 154                    |          205001.250000 |
| Lockheed L1011                 |          242685.750000 |
| Boeing 757-300                 |          189508.571429 |
| Boeing 777-300                 |          257973.333333 |
| Boeing 767-400ER               |          209557.000000 |
| Airbus A320                    |          243198.333333 |
| Airbus A319                    |          201283.666667 |
| Boeing 727                     |          273215.500000 |
+--------------------------------+------------------------+
14 rows in set (0.00 sec)
-- 5
SELECT nombre,salario,salario+(salario*0.10) AS Aumento FROM empleados
WHERE id_emp IN (SELECT id_emp FROM certificado WHERE id_avion IN (SELECT id_avion FROM aviones WHERE NOMBRE LIKE 'Boeing%'));
+----------------+-----------+-------------+
| nombre         | salario   | Aumento     |
+----------------+-----------+-------------+
| John Williams  | 153972.00 | 169369.2000 |
| Mary Johnson   | 178345.00 | 196179.5000 |
| Beatriz Asa    | 227489.00 | 250237.9000 |
| James Smith    | 120433.00 | 132476.3000 |
| Jorge Gracia   | 289950.00 | 318945.0000 |
| Michael Miller |  99890.00 | 109879.0000 |
| Karen Scott    | 205187.00 | 225705.7000 |
| Larry Kane     | 101745.00 | 111919.5000 |
| Mark Young     | 205187.00 | 225705.7000 |
| Lisa Walker    | 256481.00 | 282129.1000 |
+----------------+-----------+-------------+
10 rows in set (0.00 sec)
-- 6
SELECT * FROM aviones 
WHERE id_avion IN (SELECT avion FROM vuelos WHERE origen="Los Angeles" AND destino = "Chicago" GROUP BY vuelo_no);
+----------+----------------+-----------+
| id_avion | nombre         | autonomia |
+----------+----------------+-----------+
|        2 | Boeing 737-800 |      3383 |
+----------+----------------+-----------+
1 row in set (0.01 sec
-- 7
SELECT nombre FROM empleados 
WHERE id_emp IN (SELECT id_emp FROM certificado WHERE id_avion IN (SELECT id_Avion FROM aviones WHERE NOMBRE NOT LIKE 'Boeing%' AND autonomia > 3000));
+-----------------+
| nombre          |
+-----------------+
| Beatriz Asa     |
| Jorge Gracia    |
| Lawrence Sperry |
| Mark Young      |
| Lisa Walker     |
| Eric Cooper     |
| Joseph Thompson |
| Angela Martinez |
| William Jones   |
+-----------------+
9 rows in set (0.01 sec)
-- 8
SELECT ((SELECT AVG(salario) FROM empleados WHERE id_emp IN (SELECT id_emp FROM certificado))-(SELECT AVG(salario) FROM empleados)) AS Diferencia;
+--------------+
| Diferencia   |
+--------------+
| 27927.722222 |
+--------------+
1 row in set (0.00 sec)
-- 9
SELECT nombre FROM aviones 
WHERE LENGTH(nombre)>10 AND id_avion IN (SELECT avion FROM vuelos WHERE origen="chicago" AND salida LIKE '%%-04-%%');
+----------------+
| nombre         |
+----------------+
| Boeing 757-300 |
| Lockheed L1011 |
+----------------+
2 rows in set (0.00 sec)
-- 10
SELECT e.nombre FROM empleados e
WHERE EXISTS (SELECT 1 FROM certificado c JOIN aviones a ON c.id_avion = a.id_avion WHERE c.id_emp = e.id_emp AND a.autonomia > 1000)
AND
NOT EXISTS (SELECT 1 FROM certificado c JOIN aviones a ON c.id_avion = a.id_avion WHERE c.id_emp = e.id_emp AND a.autonomia <= 1000);
+------------------+
| nombre           |
+------------------+
| Karen Scott      |
| John Williams    |
| Mary Johnson     |
| James Smith      |
| Mark Young       |
| Lawrence Sperry  |
| Eric Cooper      |
| Elizabeth Taylor |
| Robert Brown     |
| William Jones    |
| Joseph Thompson  |
| Angela Martinez  |
| Michael Miller   |
+------------------+
13 rows in set (0.00 sec)
-- 11
SELECT e.nombre FROM empleados e
WHERE EXISTS (SELECT * FROM certificado c JOIN aviones a ON c.id_avion = a.id_avion WHERE c.id_emp = e.id_emp AND a.autonomia > 800)
AND 
(SELECT COUNT(DISTINCT c.id_avion) FROM certificado c WHERE c.id_emp = e.id_emp) >= 3;
+-----------------+
| nombre          |
+-----------------+
| Beatriz Asa     |
| Jorge Gracia    |
| Lisa Walker     |
| Mary Johnson    |
| Larry Kane      |
| Mark Young      |
| Lawrence Sperry |
| Eric Cooper     |
+-----------------+
8 rows in set (0.00 sec)
-- 12
SELECT aviones.* FROM aviones
INNER JOIN vuelos ON aviones.id_avion = vuelos.avion
GROUP BY id_avion
HAVING SUM(distancia)>=ALL(SELECT SUM(distancia) FROM vuelos GROUP BY avion);
+----------+-----------------+-----------+
| id_avion | nombre          | autonomia |
+----------+-----------------+-----------+
|        5 | Embraer ERJ-145 |      1530 |
+----------+-----------------+-----------+
1 row in set (0.00 sec)
-- 13
SELECT empleados.*,aerolineas.nombre FROM empleados
INNER JOIN aerolineas ON empleados.aerolinea = aerolineas.id_aerolinea
WHERE salario IN (SELECT MIN(salario) FROM empleados GROUP BY aerolinea)
+-----------+-----------------+----------+-----------+-------------------+
| id_emp    | nombre          | salario  | aerolinea | nombre            |
+-----------+-----------------+----------+-----------+-------------------+
| 584419457 | Bruce Lee       | 20000.00 |       100 | KLM               |
| 574489457 | Maria Lopez     | 15450.00 |       200 | Avianca           |
| 594889447 | Pobre Diablo    |  2000.00 |       300 | Qantas            |
| 274489457 | Bugs Bunny      | 20520.00 |       400 | Aeroflot          |
| 374489457 | Chandler Bing   | 18756.00 |       500 | Czech Airlines    |
| 474489457 | Dana Scully     | 26789.00 |       600 | Delta Airlines    |
|  15645489 | Donald McDonald | 18050.00 |       700 | American Airlines |
| 274878974 | Michael Miller  | 99890.00 |       800 | Iberia            |
| 254099823 | Patricia Jones  | 24450.00 |       900 | Air France        |
| 356187925 | Robert Brown    | 44740.00 |      1000 | Emirates          |
+-----------+-----------------+----------+-----------+-------------------+
10 rows in set (0.00 sec)
-- 14
SELECT e.* FROM empleados e
WHERE e.salario > (SELECT AVG(e2.salario) FROM empleados e2 WHERE e2.aerolinea = e.aerolinea);
+-----------+-----------------+-----------+-----------+
| id_emp    | nombre          | salario   | aerolinea |
+-----------+-----------------+-----------+-----------+
|  11564812 | John Williams   | 153972.00 |       300 |
| 141582651 | Mary Johnson    | 178345.00 |       200 |
| 142519864 | Beatriz Asa     | 227489.00 |       700 |
| 242518965 | James Smith     | 120433.00 |       100 |
| 269734834 | Jorge Gracia    | 289950.00 |       800 |
| 310454876 | Joseph Thompson | 212156.00 |       200 |
| 355548984 | Angela Martinez | 212156.00 |       100 |
| 390487451 | Lawrence Sperry | 212156.00 |       700 |
| 486512566 | David Anderson  | 743001.00 |       500 |
| 489456522 | Linda Davis     | 127984.00 |       300 |
| 550156548 | Karen Scott     | 205187.00 |       600 |
| 552455348 | Dorothy Lewis   |  92013.00 |      1000 |
| 556784565 | Mark Young      | 205187.00 |       800 |
| 567354612 | Lisa Walker     | 256481.00 |       400 |
| 573284895 | Eric Cooper     | 114323.00 |       900 |
| 574489456 | William Jones   | 105743.00 |      1000 |
+-----------+-----------------+-----------+-----------+
16 rows in set (0.00 sec)
