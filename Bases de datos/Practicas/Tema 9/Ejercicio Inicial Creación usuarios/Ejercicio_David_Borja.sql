-- 1
CREATE USER 'alumno'@'%' IDENTIFIED BY 'alumno';
GRANT ALL PRIVILEGES ON investigadores.* TO 'alumno1'@'%';
-- 2
CREATE USER 'NBAusu'@'localhost';
GRANT ALL PRIVILEGES ON nba.* TO 'nbausu'@'localhost';
-- 3
CREATE USER 'limitadito'@'%' IDENTIFIED BY 'limitado';
GRANT SELECT,INSERT,UPDATE ON *.* TO 'limitadito'@'%';
-- 4
DROP USER 'limitadito'@'%';
-- 5
CREATE ROLE 'Administrador';
GRANT ALL PRIVILEGES ON *.* TO 'Administrador'
CREATE ROLE 'operador_1';
GRANT SELECT ventas.* TO 'operador_1';
GRANT INSERT ON ventas.* TO 'operador_1';
GRANT SELECT ON ventas.clientes TO 'operador_1';
CREATE ROLE 'operador_2';
GRANT SELECT ON ventas.* TO 'operador_2';
GRANT UPDATE(empleados,productos) ON ventas.* TO 'operador_2';
GRANT 'operador_1' TO 'usuario1'@'%';
GRANT 'operador_2' TO 'usuario2'@'%';
GRANT 'administrador' TO 'admin1'@'localhost';