-- Eliminamos y creamos la base de datos
DROP DATABASE IF EXISTS liga_hockey;
CREATE DATABASE liga_hockey;
USE liga_hockey;

-- Tabla de usuario
CREATE TABLE usuario (
    usuario VARCHAR(30),
    contraseña CHAR(10)
);
INSERT INTO usuario VALUES
('Admin', '123456'),
('Arbitro', '123456');

-- Tabla de Persona
CREATE TABLE Persona (
    DNI VARCHAR(20) PRIMARY KEY,
    Direccion VARCHAR(100),
    Nombre VARCHAR(50),
    Apellidos VARCHAR(50),
    F_nacimiento DATE,
    Telefono VARCHAR(20)
);

-- Tabla de Entrenador
CREATE TABLE Entrenador (
    DNI VARCHAR(20) PRIMARY KEY,
    N_Equipos_Entrenados INT,
    Años_exp INT,
    Palmarés INT DEFAULT 0,
    FOREIGN KEY (DNI) REFERENCES Persona(DNI) ON DELETE CASCADE
);

-- Tabla de Equipo
CREATE TABLE Equipo (
    ID_eq INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    N_Titulos INT,
    Estadio VARCHAR(50),
    DNI_entrenador VARCHAR(20) NULL,
    FOREIGN KEY (DNI_entrenador) REFERENCES Entrenador(DNI) ON DELETE SET NULL
);

-- Tabla de Jugador
CREATE TABLE Jugador (
    DNI VARCHAR(20) PRIMARY KEY,
    ID_eq INT,
    Posicion VARCHAR(50),
    Valor_mercado DECIMAL(10,2),
    Dorsal INT,
    Transferible BOOLEAN DEFAULT FALSE,
    Salario DECIMAL(10,2),
    FOREIGN KEY (DNI) REFERENCES Persona(DNI),
    FOREIGN KEY (ID_eq) REFERENCES Equipo(ID_eq)
);

-- Tabla de Árbitro
CREATE TABLE Arbitro (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    ID_supervisor INT DEFAULT NULL,
    FOREIGN KEY (ID_supervisor) REFERENCES Arbitro(ID)
);

-- Tabla de Partidos
CREATE TABLE Partidos (
    ID_partido INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Ganador INT,
    ID_arbitro INT,
    FOREIGN KEY (ID_arbitro) REFERENCES Arbitro(ID)
);

-- Tabla de Informe
CREATE TABLE Informe (
    ID_informe INT AUTO_INCREMENT PRIMARY KEY,
    N_Rojas INT,
    N_Amarillas INT,
    Id_arbitro INT,
    Id_partido INT,
    FOREIGN KEY (Id_arbitro) REFERENCES Arbitro(ID),
    FOREIGN KEY (Id_partido) REFERENCES Partidos(ID_partido) ON DELETE CASCADE
);

-- Tabla de Juega
CREATE TABLE Juega (
    ID_eq INT,
    ID_partido INT,
    Rol VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID_eq, ID_partido),
    FOREIGN KEY (ID_partido) REFERENCES Partidos(ID_partido) ON DELETE CASCADE,
    FOREIGN KEY (ID_eq) REFERENCES Equipo(ID_eq) ON DELETE CASCADE,
    CHECK (Rol IN ('Local', 'Visitante'))
);
CREATE TABLE Historial (
    Id_Historial INT PRIMARY KEY AUTO_INCREMENT,
    ID_arbitro INT,
    N_sanciones INT DEFAULT 0,
    Partidos_Arbitrados INT DEFAULT 0,
    Rojas_sacadas INT DEFAULT 0,
    Amarillas_sacadas INT DEFAULT 0,
    FOREIGN KEY (ID_arbitro) REFERENCES Arbitro(ID)
);

-- Inserciones en Persona (15 registros)
INSERT INTO Persona (DNI, Direccion, Nombre, Apellidos, F_nacimiento, Telefono) VALUES
('01234567J','Calle Estrella 31','Maria','Castro','1996-05-05','699123876'),
('12345678A','Calle Mayor 12','Carlos','Martinez','1995-06-10','600123456'),
('23456789B','Avenida Central 45','Ana','Lopez','1998-04-23','655987654'),
('34567890C','Plaza España 3','Javier','Gomez','1992-11-15','620345678'),
('45678901D','Calle Luna 78','Sofia','Fernandez','2000-01-20','698456123'),
('53201020F','Camino Viejo 5','Elena','Ruiz','1998-09-03','600112233'),
('53211122A','Calle Falsa 123','Juan','P├®rez','1990-05-15','612345678'),
('53223242G','Urbanizacion Las Flores 8','Miguel','D├¡az','1993-06-18','644556677'),
('53233344B','Avenida Principal 456','Maria','Gamez','1988-12-20','698765432'),
('53245464H','Pasaje Secreto 1','Sofia','Ferníndez','1991-04-02','688990011'),
('53255566C','Plaza Mayor 7','Carlos','Lopez','1995-03-01','654321879'),
('53267686J','Bulevar del Mar 30','Pablo','Muñoz','1989-01-28','622334455'),
('53277788D','Travesia del Sol 10','Ana','Martinez','1992-07-25','633221144'),
('53289808K','Cuesta Empinada 15','Luc├¡a','Vargas','1996-10-07','699001122'),
('53299900E','Ronda de la Luna 22','Javier','Sínchez','1987-11-10','677889900'),
('56789012E','Avenida Sol 5','David','Ruiz','1994-09-30','630987654'),
('67890123F','Calle del Rio 22','Elena','Sínchez','1997-03-15','619234567'),
('78901234G','Camino Verde 10','Miguel','Torres','2001-08-08','650876543'),
('89012345H','Calle Azul 99','Laura','Vega','1990-07-12','690321098'),
('90123456I','Avenida Norte 17','Pedro','Molina','1993-12-25','678909876'),
('19123456A', 'Calle Mayor 10, Madrid', 'Carlos', 'Gómez Martínez', '1990-05-12', '621345678'),
('19234567B', 'Avenida Libertad 23, Barcelona', 'Ana', 'Rodríguez López', '1988-08-22', '621987654'),
('19345678C', 'Plaza España 5, Sevilla', 'Javier', 'Fernández Ruiz', '1995-03-30', '621456789'),
('19456789D', 'Calle Real 8, Valencia', 'Laura', 'Sánchez Pérez', '1992-12-05', '621678901'),
('19567890E', 'Gran Vía 14, Bilbao', 'Miguel', 'Domínguez Castro', '1987-07-15', '621123456'),
('19678901F', 'Paseo Marítimo 3, Málaga', 'Elena', 'Hernández Moreno', '1999-01-25', '621234567'),
('19789012G', 'Rambla Cataluña 21, Zaragoza', 'Raúl', 'García Torres', '1994-06-18', '621876543'),
('19890123H', 'Calle Sol 7, Alicante', 'María', 'Jiménez Vega', '1991-09-09', '621567890'),
('19901234I', 'Avenida Andalucía 11, Córdoba', 'Daniel', 'Alonso Díaz', '1993-11-03', '621789012'),
('19012345J', 'Calle Luna 16, Granada', 'Carmen', 'Pérez Muñoz', '1998-02-14', '621098765'),
('19123457K', 'Paseo de Gracia 9, Tarragona', 'Sergio', 'Ramírez Gómez', '1989-04-29', '621345987'),
('19234568L', 'Calle Castilla 12, Valladolid', 'Beatriz', 'Ortega Fuentes', '1997-05-08', '621654321'),
('19345679M', 'Avenida Europa 17, Oviedo', 'Luis', 'Navarro Álvarez', '1996-10-31', '621876789'),
('19456780N', 'Paseo Colón 4, San Sebastián', 'Sofía', 'Martín García', '1986-07-21', '621234890'),
('19567891O', 'Calle Victoria 6, Pamplona', 'Iván', 'Ruiz Serrano', '1990-03-11', '621789345');



-- Inserciones en Entrenador (15 registros, asegurando que algunos no entrenan equipos)
INSERT INTO `entrenador` VALUES
('01234567J',1,2,0),
('12345678A',3,10,5),
('23456789B',2,8,2),
('34567890C',5,15,10),
('45678901D',1,3,0),
('53201020F',1,1,0),
('53211122A',3,5,2),
('53223242G',3,7,3),
('53233344B',1,2,0),
('53245464H',2,3,0),
('53255566C',5,10,7),
('53267686J',6,12,9),
('53277788D',2,4,1),
('53289808K',1,2,0),
('53299900E',4,8,5),
('56789012E',4,12,7),
('67890123F',2,6,1),
('78901234G',3,9,4),
('89012345H',4,11,6),
('90123456I',2,5,2),
('19123456A', 5, 10, 3),
('19234567B', 3, 8, 1),
('19345678C', 7, 15, 5),
('19456789D', 2, 5, 0),
('19567890E', 4, 12, 2),
('19678901F', 6, 14, 4),
('19789012G', 3, 7, 1),
('19890123H', 8, 20, 6),
('19901234I', 5, 11, 2),
('19012345J', 2, 6, 1);


-- Inserciones en Equipo (Solo asignando algunos entrenadores)
INSERT INTO Equipo VALUES
(1,'prueba',0,'prueba','12345678A'),
(2,'Majadahonda HC',5,'La Nevera','34567890C'),
(3,'CH Txuri Urdin',16,'Txuri Urdin Izotz Jauregia','45678901D'),
(4,'CH Puigcerdá',7,'Club Poliesportiu Puigcerdá','56789012E'),
(5,'Steel Acorns Valdemoro',2,'Francisco Ferníndez Ochoa','67890123F'),
(6,'Mileni Pirates',1,'Pista de Hielo Logroño','78901234G'),
(7,'Las Palmas HC',0,'Pabellon de Hielo Las Palmas','89012345H'),
(8,'Granada Grizzlies',0,'Igloo Granada','01234567J'),
(9, 'Real Madrid Juvenil', 12, 'Ciudad Deportiva Real Madrid', '19123456A'),
(10, 'Barcelona Sub-19', 8, 'Estadio Johan Cruyff', '19234567B'),
(11, 'Sevilla Juvenil', 5, 'Ciudad Deportiva Sevilla FC', '19345678C');



-- Inserciones en Jugador (Asociado a Equipos)
INSERT INTO Jugador (DNI, ID_eq, Posicion, Valor_mercado, Dorsal, Transferible, Salario) VALUES
('01234567J',2,'Extremo',40000.00,7,0,4500000.00),
('12345678A',5,'Delantero',55000.00,11,0,5500000.00),
('23456789B',10,'Mediocentro',30000.00,6,0,3500000.00),
('34567890C',10,'Defensa',25000.00,4,0,3000000.00),
('56789012E',5,'Extremo',38000.00,10,0,4200000.00),
('78901234G',2,'Mediocentro',35000.00,8,0,4000000.00),
('89012345H',8,'Defensa',20000.00,5,0,2500000.00),
('90123456I',6,'Portero',10000.00,1,0,2000000.00);


-- Inserciones en Árbitro
INSERT INTO Arbitro (Nombre) VALUES
('Antonio Mateu Lahoz'),
('Carlos Del Cerro Grande'),
('Jesús Gil Manzano'),
('José Luis Munuera Montero'),
('Alberto Undiano Mallenco'),
('Alejandro Hernández Hernández'),
('Juan Martínez Munuera'),
('Eduardo Prieto Iglesias'),
('David Medié Jiménez'),
('Santiago Jaime Latre'),
('Carlos López'),
('Ana Martínez'),
('Javier Rodríguez'),
('Laura Fernández'),
('Miguel Sánchez'),
('Beatriz Ortega'),
('Raúl Navarro');

INSERT INTO Partidos VALUES
(1,'2025-05-01',8,7),
(2,'2025-05-02',4,2),
(3,'2025-05-03',6,9),
(4,'2025-05-04',7,4),
(5,'2025-05-05',9,10),
(6,'2025-05-06',2,6),
(7,'2025-05-07',4,1),
(8,'2025-05-08',5,8),
(9,'2025-05-09',8,5),
(10,'2025-05-10',10,3),
(11, '2025-05-01', 3, 5),
(12, '2025-05-05', 7, 9),
(13, '2025-05-10', 11, 2),
(14, '2025-05-15', 4, 14),
(15, '2025-05-20', 8, 7);
INSERT INTO Juega (ID_eq, ID_partido, Rol) VALUES
(3,1,'Visitante'),
(4,7,'Visitante'),
(5,3,'Local'),
(8,10,'Local'),
(10,15,'Visitante'),
(3, 11, 'Local'),
(5, 11, 'Visitante'),
(7, 12, 'Local'),
(11, 12, 'Visitante'),
(11, 13, 'Local'),
(1, 13, 'Visitante'),
(4, 14, 'Local'),
(6, 14, 'Visitante'),
(8, 15, 'Local'),
(10, 5, 'Visitante');
INSERT INTO informe VALUES
(1,1,3,7,1),
(2,0,5,2,2),
(3,2,2,9,3),
(4,1,4,4,4),
(5,0,6,10,5),
(6,3,1,6,6),
(7,0,2,1,7),
(8,2,3,8,8),
(9,1,5,5,9),
(10,0,4,3,10);
ALTER TABLE jugador DROP FOREIGN KEY jugador_ibfk_2;
ALTER TABLE jugador ADD CONSTRAINT jugador_ibfk_2 FOREIGN KEY (ID_eq) REFERENCES equipo(ID_eq) ON DELETE SET NULL;




