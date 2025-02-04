-- Multitablas David Borja
-- Consulta 1 
SELECT DNI,nombre,apellidos,beca,investigadores.facultad,facultades.NomFacultad AS Nombre_facultad,activo FROM investigadores
INNER JOIN facultades ON investigadores.facultad = facultades.IdFacultad;
+-----------+--------+-----------+----------+----------+----------------------+--------+
| DNI       | nombre | apellidos | beca     | facultad | Nombre_facultad      | activo |
+-----------+--------+-----------+----------+----------+----------------------+--------+
| 11111111X | Luis   | Lopez     |  5250.78 |        1 | Ciencias Matematicas | S      |
| 22222222K | Ana    | Gracia    |  3000.50 |        1 | Ciencias Matematicas | S      |
| 33333333P | Sonia  | Gomez     |  2000.50 |        1 | Ciencias Matematicas | S      |
| 44444444R | Raquel | Raya      |  8000.50 |        3 | Ciencias Quimicas    | N      |
| 55555555I | Pedro  | Martinez  | 45000.30 |        4 | Ciencias Geologicas  | S      |
| 66666666D | Sara   | Salas     |  8000.00 |        4 | Ciencias Geologicas  | S      |
+-----------+--------+-----------+----------+----------+----------------------+--------+
6 rows in set (0.00 sec)
-- Consulta 2
SELECT DNI,nombre,apellidos,beca,investigadores.facultad,facultades.NomFacultad AS Nombre_facultad,activo FROM investigadores
RIGHT JOIN facultades ON investigadores.facultad = facultades.IdFacultad;
+-----------+--------+-----------+----------+----------+----------------------+--------+
| DNI       | nombre | apellidos | beca     | facultad | Nombre_facultad      | activo |
+-----------+--------+-----------+----------+----------+----------------------+--------+
| 33333333P | Sonia  | Gomez     |  2000.50 |        1 | Ciencias Matematicas | S      |
| 22222222K | Ana    | Gracia    |  3000.50 |        1 | Ciencias Matematicas | S      |
| 11111111X | Luis   | Lopez     |  5250.78 |        1 | Ciencias Matematicas | S      |
| NULL      | NULL   | NULL      |     NULL |     NULL | Ciencias Fisicas     | NULL   |
| 44444444R | Raquel | Raya      |  8000.50 |        3 | Ciencias Quimicas    | N      |
| 66666666D | Sara   | Salas     |  8000.00 |        4 | Ciencias Geologicas  | S      |
| 55555555I | Pedro  | Martinez  | 45000.30 |        4 | Ciencias Geologicas  | S      |
+-----------+--------+-----------+----------+----------+----------------------+--------+
7 rows in set (0.00 sec)
-- Consulta 3
SELECT reservas.DNI,investigadores.nombre AS Nombre_Investigador, investigadores.apellidos AS Apellidos_Investigador, IdEquipo,FInicio,FFin FROM reservas
INNER JOIN investigadores ON reservas.DNI = investigadores.DNI;
+-----------+---------------------+------------------------+----------+------------+------------+
| DNI       | Nombre_Investigador | Apellidos_Investigador | IdEquipo | FInicio    | FFin       |
+-----------+---------------------+------------------------+----------+------------+------------+
| 11111111X | Luis                | Lopez                  | H555     | 2024-05-11 | 2024-12-06 |
| 11111111X | Luis                | Lopez                  | K111     | 2024-09-25 | 2024-11-03 |
| 33333333P | Sonia               | Gomez                  | M333     | 2024-10-03 | 2024-11-20 |
| 55555555I | Pedro               | Martinez               | K111     | 2024-11-15 | 2024-10-06 |
| 66666666D | Sara                | Salas                  | H222     | 2024-09-05 | 2024-10-06 |
+-----------+---------------------+------------------------+----------+------------+------------+
5 rows in set (0.02 sec)
-- Consulta 4
SELECT reservas.DNI,investigadores.nombre AS Nombre_Investigador, investigadores.apellidos AS Apellidos_Investigador, reservas.IdEquipo,equipos.Descripcion AS Descripcion_Equipo,FInicio,FFin FROM reservas
INNER JOIN investigadores ON reservas.DNI = investigadores.DNI
INNER JOIN equipos ON reservas.IdEquipo = equipos.IdEquipo
ORDER BY reservas.DNI;
+-----------+---------------------+------------------------+----------+------------------------------+------------+------------+
| DNI       | Nombre_Investigador | Apellidos_Investigador | IdEquipo | Descripcion_Equipo           | FInicio    | FFin       |
+-----------+---------------------+------------------------+----------+------------------------------+------------+------------+
| 11111111X | Luis                | Lopez                  | H555     | Telemetro laser SICK         | 2024-05-11 | 2024-12-06 |
| 11111111X | Luis                | Lopez                  | K111     | Lente para camara FUJINON-TV | 2024-09-25 | 2024-11-03 |
| 33333333P | Sonia               | Gomez                  | M333     | Fuente de Voltaje TEKTRONIX  | 2024-10-03 | 2024-11-20 |
| 55555555I | Pedro               | Martinez               | K111     | Lente para camara FUJINON-TV | 2024-11-15 | 2024-10-06 |
| 66666666D | Sara                | Salas                  | H222     | Multimetro digital FLUKE     | 2024-09-05 | 2024-10-06 |
+-----------+---------------------+------------------------+----------+------------------------------+------------+------------+
5 rows in set (0.00 sec)