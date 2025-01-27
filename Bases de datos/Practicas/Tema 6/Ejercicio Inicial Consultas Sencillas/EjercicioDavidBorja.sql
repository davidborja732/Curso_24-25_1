--Consulta 1
SELECT * FROM investigadores
    -> ORDER BY facultad;
+-----------+--------+-----------+----------+----------+--------+
| DNI       | nombre | apellidos | beca     | facultad | activo |
+-----------+--------+-----------+----------+----------+--------+
| 11111111X | Luis   | Lopez     |  5250.78 |        1 | S      |
| 22222222K | Ana    | Gracia    |  3000.50 |        1 | S      |
| 33333333P | Sonia  | Gomez     |  2000.50 |        1 | S      |
| 44444444R | Raquel | Raya      |  8000.50 |        3 | N      |
| 55555555I | Pedro  | Martinez  | 45000.30 |        4 | S      |
| 66666666D | Sara   | Salas     |  8000.00 |        4 | S      |
+-----------+--------+-----------+----------+----------+--------+
6 rows in set (0,00 sec)
-- consulta 2
SELECT nombre AS NomInvestigador,apellidos AS ApellInvestigador, DNI FROM investigadores
    -> ORDER BY apellidos;
+-----------------+-------------------+-----------+
| NomInvestigador | ApellInvestigador | DNI       |
+-----------------+-------------------+-----------+
| Sonia           | Gomez             | 33333333P |
| Ana             | Gracia            | 22222222K |
| Luis            | Lopez             | 11111111X |
| Pedro           | Martinez          | 55555555I |
| Raquel          | Raya              | 44444444R |
| Sara            | Salas             | 66666666D |
+-----------------+-------------------+-----------+
6 rows in set (0,00 sec)
--Consulta 3
SELECT IdFacultad FROM facultades
    -> WHERE NomFacultad LIKE 'Ciencias%';
+------------+
| IdFacultad |
+------------+
|          1 |
|          2 |
|          3 |
|          4 |
+------------+
4 rows in set (0,01 sec)
--Consulta 4
SELECT * FROM equipos 
    -> WHERE IdFacultad=4;
Empty set (0,00 sec)
--Consulta 5
SELECT * FROM equipos 
    -> WHERE IdEquipo LIKE 'H%';
+----------+------------+--------------------------+
| IdEquipo | IdFacultad | Descripcion              |
+----------+------------+--------------------------+
| H222     |          2 | Multimetro digital FLUKE |
| H555     |          3 | Telemetro laser SICK     |
+----------+------------+--------------------------+
2 rows in set (0,01 sec)
--Consulta 6
SELECT * FROM equipos 
    -> WHERE IdEquipo NOT LIKE 'H%';
+----------+------------+------------------------------+
| IdEquipo | IdFacultad | Descripcion                  |
+----------+------------+------------------------------+
| K111     |          2 | Lente para camara FUJINON-TV |
| M222     |          3 | Cámara digital SONY          |
| M333     |          3 | Fuente de Voltaje TEKTRONIX  |
+----------+------------+------------------------------+
3 rows in set (0,00 sec)
--Consulta 7
SELECT * FROM investigadores
    -> WHERE facultad=4 OR facultad=2;
+-----------+--------+-----------+----------+----------+--------+
| DNI       | nombre | apellidos | beca     | facultad | activo |
+-----------+--------+-----------+----------+----------+--------+
| 55555555I | Pedro  | Martinez  | 45000.30 |        4 | S      |
| 66666666D | Sara   | Salas     |  8000.00 |        4 | S      |
+-----------+--------+-----------+----------+----------+--------+
2 rows in set (0,00 sec)
--Consulta 8
SELECT DNI,IdEquipo,FInicio FROM reservas 
     -> WHERE FInicio LIKE '2024-11-%'; 
+-----------+----------+------------+
| DNI       | IdEquipo | FInicio    |
+-----------+----------+------------+
| 55555555I | K111     | 2024-11-15 |
+-----------+----------+------------+
1 row in set (0,00 sec)
--Consulta 9
SELECT DNI,IdEquipo,FFin FROM reservas WHERE FInicio LIKE '2024-11-%';
+-----------+----------+------------+
| DNI       | IdEquipo | FFin       |
+-----------+----------+------------+
| 55555555I | K111     | 2024-10-06 |
+-----------+----------+------------+
1 row in set (0,00 sec)
--Consulta 10
SELECT * FROM reservas WHERE FInicio LIKE '2024-11-%' OR FFin LIKE '2024-11-%';
+-----------+----------+------------+------------+
| DNI       | IdEquipo | FInicio    | FFin       |
+-----------+----------+------------+------------+
| 11111111X | K111     | 2024-09-25 | 2024-11-03 |
| 33333333P | M333     | 2024-10-03 | 2024-11-20 |
| 55555555I | K111     | 2024-11-15 | 2024-10-06 |
+-----------+----------+------------+------------+
3 rows in set (0,00 sec)
--Consulta 11
SELECT * FROM investigadores 
    -> WHERE apellidos LIKE '%z' OR apellidos LIKE '%o%'
    -> ORDER BY apellidos;
+-----------+--------+-----------+----------+----------+--------+
| DNI       | nombre | apellidos | beca     | facultad | activo |
+-----------+--------+-----------+----------+----------+--------+
| 33333333P | Sonia  | Gomez     |  2000.50 |        1 | S      |
| 11111111X | Luis   | Lopez     |  5250.78 |        1 | S      |
| 55555555I | Pedro  | Martinez  | 45000.30 |        4 | S      |
+-----------+--------+-----------+----------+----------+--------+
3 rows in set (0,01 sec)
--Consulta 12
SELECT nombre,apellidos FROM investigadores
    -> WHERE beca >= 8000;
+--------+-----------+
| nombre | apellidos |
+--------+-----------+
| Raquel | Raya      |
| Pedro  | Martinez  |
| Sara   | Salas     |
+--------+-----------+
3 rows in set (0,00 sec)

--Consulta 13
SELECT DNI FROM reservas 
    -> WHERE FInicio LIKE '2024-09-%';
+-----------+
| DNI       |
+-----------+
| 66666666D |
| 11111111X |
+-----------+
2 rows in set (0,00 sec)
--Consulta 14
SELECT DNI,beca,beca+(beca*0.05) AS Nueva_Cuantia FROM investigadores;
+-----------+----------+---------------+
| DNI       | beca     | Nueva_Cuantia |
+-----------+----------+---------------+
| 11111111X |  5250.78 |     5513.3190 |
| 22222222K |  3000.50 |     3150.5250 |
| 33333333P |  2000.50 |     2100.5250 |
| 44444444R |  8000.50 |     8400.5250 |
| 55555555I | 45000.30 |    47250.3150 |
| 66666666D |  8000.00 |     8400.0000 |
+-----------+----------+---------------+
6 rows in set (0,00 sec)
--Consulta 15
SELECT Descripcion FROM equipos  
    -> WHERE IdEquipo='H555';
+----------------------+
| Descripcion          |
+----------------------+
| Telemetro laser SICK |
+----------------------+
1 row in set (0,00 sec)




