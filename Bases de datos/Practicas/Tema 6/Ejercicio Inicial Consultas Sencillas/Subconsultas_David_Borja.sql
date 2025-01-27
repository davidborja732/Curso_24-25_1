-- Consulta 1
SELECT nombre FROM investigadores 
WHERE facultad = (SELECT IdFacultad FROM facultades WHERE NomFacultad="Ciencias Matematicas");
+--------+
| nombre |
+--------+
| Luis   |
| Ana    |
| Sonia  |
+--------+
3 rows in set (0.00 sec)
-- Consulta 2
SELECT * FROM reservas
WHERE IdEquipo=(SELECT IdEquipo FROM equipos WHERE descripcion="Telemetro laser SICK");
+-----------+----------+------------+------------+
| DNI       | IdEquipo | FInicio    | FFin       |
+-----------+----------+------------+------------+
| 11111111X | H555     | 2024-05-11 | 2024-12-06 |
+-----------+----------+------------+------------+
1 row in set (0.00 sec)
-- Consulta 3
SELECT * FROM reservas
WHERE DNI IN (SELECT DNI FROM investigadores WHERE facultad=(SELECT IdFacultad FROM facultades WHERE NomFacultad="Ciencias Geologicas"));
+-----------+----------+------------+------------+
| DNI       | IdEquipo | FInicio    | FFin       |
+-----------+----------+------------+------------+
| 55555555I | K111     | 2024-11-15 | 2024-10-06 |
| 66666666D | H222     | 2024-09-05 | 2024-10-06 |
+-----------+----------+------------+------------+
2 rows in set (0.00 sec)
-- Consulta 4
SELECT * FROM reservas
WHERE DNI IN (SELECT DNI FROM investigadores WHERE facultad=(SELECT IdFacultad FROM facultades WHERE NomFacultad="Ciencias Geologicas") AND beca>2000 AND beca<6000);
Empty set (0.00 sec)
-- Consulta 5
SELECT * FROM reservas
WHERE DNI IN (SELECT DNI FROM investigadores WHERE facultad=(SELECT IdFacultad FROM facultades WHERE NomFacultad="Ciencias Geologicas")) AND IdEquipo="H222";
+-----------+----------+------------+------------+
| DNI       | IdEquipo | FInicio    | FFin       |
+-----------+----------+------------+------------+
| 66666666D | H222     | 2024-09-05 | 2024-10-06 |
+-----------+----------+------------+------------+
1 row in set (0.00 sec)

-- Consulta 6
SELECT * FROM reservas
WHERE DNI IN (SELECT DNI FROM investigadores WHERE facultad=(SELECT IdFacultad FROM facultades WHERE NomFacultad="Ciencias Geologicas")) AND IdEquipo = (SELECT IdEquipo FROM equipos WHERE IdFacultad=(SELECT IdFacultad FROM facultades WHERE NomFacultad="Ciencias Quimicas"));
Empty set (0.00 sec)


