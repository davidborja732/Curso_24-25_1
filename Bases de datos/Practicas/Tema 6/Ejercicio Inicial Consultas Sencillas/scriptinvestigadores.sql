DROP DATABASE IF EXISTS Investigadores;
CREATE DATABASE Investigadores;
USE Investigadores;
/*Creación de las tablas*/
CREATE TABLE facultades ( 
  /* Definición de campos */ 
  IdFacultad NUMERIC(4) NOT NULL, 
  NomFacultad VARCHAR(50) NOT NULL, 
  /* Definición de clave primaria */ 
  PRIMARY KEY(IdFacultad) 
); 

CREATE TABLE investigadores(  
  DNI CHAR(9) NOT NULL, 
  nombre VARCHAR(20) NOT NULL, 
  apellidos VARCHAR(40) NOT NULL, 
  beca NUMERIC(8,2) NOT NULL,
  facultad NUMERIC(4),
  activo CHAR(1), 
  PRIMARY KEY(DNI),
  FOREIGN KEY(facultad)
  REFERENCES facultades(IdFacultad)
  ON DELETE SET NULL
); 

CREATE TABLE equipos ( 
  IdEquipo CHAR(4) NOT NULL, 
  IdFacultad NUMERIC(4),
  Descripcion VARCHAR(50) NOT NULL, 
  PRIMARY KEY(IdEquipo), 
  /* Definición de clave externa e integridad referencial */ 
  FOREIGN KEY(IdFacultad) 
  REFERENCES facultades(IdFacultad) 
  ON DELETE SET NULL 
);
 
CREATE TABLE reservas ( 
  DNI CHAR(9) NOT NULL, 
  IdEquipo CHAR(4) NOT NULL, 
  FInicio DATE, 
  FFin DATE,
  PRIMARY KEY(DNI,IdEquipo,FInicio),  
  FOREIGN KEY(DNI) 
  REFERENCES investigadores(DNI) 
  ON DELETE CASCADE,
  FOREIGN KEY(IdEquipo) 
  REFERENCES equipos(IdEquipo) 
  ON DELETE CASCADE
);
 

/* Inserción en la tabla facultades */ 

INSERT INTO facultades (IdFacultad,NomFacultad) VALUES (1,'Ciencias Matematicas'); 
INSERT INTO facultades (IdFacultad,NomFacultad) VALUES (2,'Ciencias Fisicas');
INSERT INTO facultades (IdFacultad,NomFacultad) VALUES (3,'Ciencias Quimicas');
INSERT INTO facultades (IdFacultad,NomFacultad) VALUES (4,'Ciencias Geologicas'); 


/* Inserción en la tabla investigadores */ 
INSERT INTO investigadores (DNI,Nombre,Apellidos,Beca,Facultad,Activo) VALUES ('11111111X','Luis','Lopez',5250.78,1,'S'); 
INSERT INTO investigadores (DNI,Nombre,Apellidos,Beca,Facultad,Activo) VALUES ('22222222K','Ana','Gracia',3000.50,1,'S'); 
INSERT INTO investigadores (DNI,Nombre,Apellidos,Beca,Facultad,Activo) VALUES ('33333333P','Sonia','Gomez',2000.50,1,'S'); 
INSERT INTO investigadores (DNI,Nombre,Apellidos,Beca,Facultad,Activo) VALUES ('44444444R','Raquel','Raya',8000.50,3,'N'); 
INSERT INTO investigadores (DNI,Nombre,Apellidos,Beca,Facultad,Activo) VALUES ('55555555I','Pedro','Martinez',45000.30,4,'S'); 
INSERT INTO investigadores (DNI,Nombre,Apellidos,Beca,Facultad,Activo) VALUES ('66666666D','Sara','Salas',8000,4,'S'); 


/* Inserción en la tabla equipos */ 
INSERT INTO equipos (IdEquipo,IdFacultad,Descripcion) VALUES ('H555',3,'Telemetro laser SICK'); 
INSERT INTO equipos (IdEquipo,IdFacultad,Descripcion) VALUES ('H222',2,'Multimetro digital FLUKE');
INSERT INTO equipos (IdEquipo,IdFacultad,Descripcion) VALUES ('M333',3,'Fuente de Voltaje TEKTRONIX');
INSERT INTO equipos (IdEquipo,IdFacultad,Descripcion) VALUES ('M222',3,'Cámara digital SONY');
INSERT INTO equipos (IdEquipo,IdFacultad,Descripcion) VALUES ('K111',2,'Lente para camara FUJINON-TV');

/* Insercion en la tabla reservas*/
INSERT INTO reservas (DNI,IdEquipo,FInicio,FFin) VALUES ('66666666D','H222','2024-09-05','2024-10-06');
INSERT INTO reservas (DNI,IdEquipo,FInicio,FFin) VALUES ('11111111X','H555','2024-05-11','2024-12-06');
INSERT INTO reservas (DNI,IdEquipo,FInicio,FFin) VALUES ('33333333P','M333','2024-10-03','2024-11-20');
INSERT INTO reservas (DNI,IdEquipo,FInicio,FFin) VALUES ('11111111X','K111','2024-09-25','2024-11-03');
INSERT INTO reservas (DNI,IdEquipo,FInicio,FFin) VALUES ('55555555I','K111','2024-11-15','2024-10-06');



