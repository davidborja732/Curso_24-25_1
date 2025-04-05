CREATE DATABASE Practica_David_borja;
USE Practica_David_borja

CREATE TABLE cerdos(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
raza VARCHAR(50),
fecha_nacimiento VARCHAR(30),
peso DOUBLE
);
CREATE TABLE vendedores(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
empresa VARCHAR(50),
contacto VARCHAR(100)
);