CREATE DATABASE examenBorja;
USE examenBorja
CREATE TABLE Libro(
id INT,
titulo VARCHAR(100),
genero VARCHAR(100),
fecha_publicacion DATE,
precio DOUBLE
);
CREATE TABLE Autor(
id INT,
nombre VARCHAR(100),
nacionalidad VARCHAR(100),
email VARCHAR(100)
);
INSERT INTO Autor VALUES(1,"Antonio","Español","Antonio@gmail.com");
INSERT INTO Autor VALUES(2,"Pepe","Español","pepe@gmail.com");
INSERT INTO Libro VALUES(1,"El señor de los anillos","tolkien","Libro",2004-03-02,20.90);