CREATE DATABASE ej14;
USE ej14;
CREATE TABLE alumnos(
Id INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(50),
Apellidos VARCHAR(50),
Direccion VARCHAR(50)
);
CREATE TABLE cursos(
Id_curso INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(100),
Instructor VARCHAR(100)
);
CREATE TABLE matriculas(
Id_curso INT,
Id_alumno INT,
PRIMARY KEY(Id_curso,Id_alumno),
FOREIGN KEY(Id_alumno) REFERENCES alumnos(Id),
FOREIGN KEY(Id_curso) REFERENCES cursos(Id_Curso)
);