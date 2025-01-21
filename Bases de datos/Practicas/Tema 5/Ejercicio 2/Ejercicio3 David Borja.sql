/*Script de creacion de base de datos deportes*/
-- Creo la base de datos e indico que la voy a usar
CREATE DATABASE deportes;
USE deportes;
-- Creo la tabla equipo
CREATE TABLE equipo(
codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(35),
fecha_creacion DATE
);
-- Creo la tabla jugador
CREATE TABLE jugador(
codigo CHAR(12) PRIMARY KEY,
nombre VARCHAR(35),
apellido1 VARCHAR(35),
apellido2 VARCHAR(35),
demarcacion VARCHAR(35)
);
-- Creo la tabla juega
CREATE TABLE juega(
codigoJugador CHAR(12),
codigoEquipo INTEGER,
fecha_contrato DATE,
PRIMARY KEY(codigoJugador,codigoEquipo,fecha_contrato),
CONSTRAINT fk_juega_jugador FOREIGN KEY(codigoJugador) REFERENCES jugador(codigo),
CONSTRAINT fk_juega_equipo FOREIGN KEY(codigoEquipo) REFERENCES equipo(codigo)
);
-- Añado sueldo a jugador
ALTER TABLE jugador ADD sueldo FLOAT;
-- Modifico longitud de apellido1
ALTER TABLE jugador MODIFY apellido1 VARCHAR(40);
-- modifico el campo nombre para queue solo acepte tres valores
ALTER TABLE equipo ADD CONSTRAINT ck_equipo_nombre CHECK (nombre IN ('Real Madrid', 'FC Barcelona', 'Real Sociedad'));
-- Borro apellido2
ALTER TABLE jugador DROP COLUMN apellido2;
