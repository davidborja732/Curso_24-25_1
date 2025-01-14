/*Script de creacion de la base de datos
TERFRUTO*/
-- No poner punto y coma al ejecutar el comando source
DROP DATABASE TERFRUTO;
CREATE DATABASE TERFRUTO;
USE TERFRUTO;
-- creacion de las tablas:
-- creo tabla tiendas
CREATE TABLE tiendas (
	numero_tienda INTEGER,
	direccion VARCHAR(100) NOT NULL,
	cp_tienda CHAR(5) NOT NULL,
	telefono CHAR(9) UNIQUE,
	CONSTRAINT pk_tienda PRIMARY KEY (numero_tienda),
	CONSTRAINT ck_numero_tienda CHECK (numero_tienda>9 AND numero_tienda <100)
	);
CREATE TABLE vendedores (
	NIF CHAR(12),
	nombre VARCHAR(90) NOT NULL,
	domicilio VARCHAR(100) NOT NULL,
	cp_vendedor CHAR(5),
	ciudad VARCHAR(20),
	telefono CHAR(9)NOT NULL,
	fecha_nacimiento DATE,
	estado_civil VARCHAR(20),
	numero_hijos INTEGER,
	numero_tienda INTEGER,
	CONSTRAINT pk_vendedores PRIMARY KEY (NIF),
	CONSTRAINT fk_tienda FOREIGN KEY(numero_tienda) REFERENCES tiendas (numero_tienda)
	);
-- Inserta un nuevo campo en la tabla vendedores, minusvalia , de tipo texto , con valores S o NATIONAL
ALTER TABLE vendedores ADD minusvalia CHAR(1);
ALTER TABLE vendedores ADD CONSTRAINT ck_minusvalia CHECK (minusvalia IN ('S', 'N', 's', 'n'));
-- ALTER TABLE vendedores ADD minusvalia ENUM (('S', 'N', 's', 'n')); ES otra forma de añadir las 4 opciones
-- Insertamos un campo sueldo en la tbala vendedores
ALTER TABLE vendedores ADD sueldo FLOAT AFTER fecha_nacimiento;
-- Modificamos el campo estado_civil
ALTER TABLE vendedores MODIFY estado_civil CHAR(1);
	