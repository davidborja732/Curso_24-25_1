/*Script de creacion de base de datos deportes*/
-- Creo la base de datos e indico que la voy a usar
DROP DATABASE Tienda;
CREATE DATABASE Tienda;
USE Tienda;
-- Creo la tabla fabricantes 
CREATE TABLE fabricantes(
cod_fabricante INTEGER PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25),
pais VARCHAR(25) DEFAULT ('ESPAÑA'),
CONSTRAINT ck_fabricantes_mayusnombre CHECK (nombre=UPPER(nombre)),
CONSTRAINT ck_fabricantes_mayuspais CHECK (pais=UPPER(pais))
);
-- Creo la tabla articulos 
CREATE TABLE articulos(
cod_articulo INTEGER,
cod_fabricante INTEGER,
peso FLOAT,
categoria VARCHAR(25),
precio_venta FLOAT,
precio_costo FLOAT,
PRIMARY KEY(cod_articulo,cod_fabricante,peso,categoria),
CONSTRAINT ck_categoria CHECK (categoria IN ('Primera', 'Segunda', 'Tercera')),
CONSTRAINT ck_venta CHECK (precio_venta>0),
CONSTRAINT ck_costo CHECK (precio_costo>0)
);
-- Añado la restriccion de clave foranea
ALTER TABLE articulos ADD CONSTRAINT fk_fabricante FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante) ON DELETE CASCADE;
-- Modifico nombre
ALTER TABLE fabricantes MODIFY nombre VARCHAR(50);
-- Añado campo fecha de creacion
ALTER TABLE fabricantes ADD fecha_creacion DATE;
-- Añado campo descripcion
ALTER TABLE articulos ADD descripcion VARCHAR(150);
-- Añado tabla PAISES
CREATE TABLE paises(
cod CHAR(2) PRIMARY KEY,
pais VARCHAR(30) NOT NULL,
habitantes INTEGER,
renta_per_capita DECIMAL(10,2),
peligroso VARCHAR(1),
CONSTRAINT ck_cod CHECK (cod =UPPER(cod)),
CONSTRAINT ck_habitantes CHECK (habitantes>10000),
CONSTRAINT ck_peligroso CHECK (peligroso IN ('S', 'N'))
);
-- Añado pais a la tabla fabricantes
ALTER TABLE fabricantes ADD cod_pais CHAR(2);
ALTER TABLE fabricantes ADD CONSTRAINT fk_pais FOREIGN KEY(cod_pais) REFERENCES paises(cod) ON DELETE CASCADE;