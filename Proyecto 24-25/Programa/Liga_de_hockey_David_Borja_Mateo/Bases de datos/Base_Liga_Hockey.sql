DROP DATABASE Liga_Hockey
CREATE DATABASE Liga_Hockey;
USE Liga_Hockey;
CREATE TABLE usuario(
usuario VARCHAR(30),
contraseña CHAR(10)
);
INSERT INTO usuario VALUES("Admin","123456");
INSERT INTO usuario VALUES("Arbitro","123456");
CREATE TABLE Persona (
    DNI VARCHAR(20),
    Direccion VARCHAR(100),
    Nombre VARCHAR(50),
    Apellidos VARCHAR(50),
    F_nacimiento DATE,
    Telefono VARCHAR(20),
    CONSTRAINT PK_Persona PRIMARY KEY (DNI)
);

CREATE TABLE Entrenador (
    DNI VARCHAR(20),
    N_Equipos_Entrenados INT,
    Años_exp INT,
    Palmarés INT DEFAULT 0,
    CONSTRAINT PK_Entrenador PRIMARY KEY (DNI),
    CONSTRAINT FK_Entrenador_Persona FOREIGN KEY (DNI) REFERENCES Persona(DNI) ON DELETE CASCADE
);

CREATE TABLE Equipo (
    ID_eq INT AUTO_INCREMENT,
    Nombre VARCHAR(50),
    N_Titulos INT,
    Estadio VARCHAR(50),
    DNI_entrenador VARCHAR(20),
    CONSTRAINT PK_Equipo PRIMARY KEY (ID_eq),
    CONSTRAINT FK_Equipo_Entrenador FOREIGN KEY (DNI_entrenador) REFERENCES Entrenador(DNI) ON DELETE SET NULL
);

CREATE TABLE Jugador (
    ID_eq INT,
    DNI VARCHAR(20),
    Posicion VARCHAR(50),
    Valor_mercado DECIMAL(10, 2),
    Dorsal INT,
    Transferible BOOLEAN DEFAULT FALSE,
    Salario DECIMAL(10, 2),
    CONSTRAINT PK_Jugador PRIMARY KEY (DNI),
    CONSTRAINT FK_Jugador_Persona FOREIGN KEY (DNI) REFERENCES Persona(DNI) ON DELETE CASCADE,
    CONSTRAINT FK_Jugador_Equipo FOREIGN KEY (ID_eq) REFERENCES Equipo(ID_eq) ON DELETE CASCADE
);


CREATE TABLE Arbitro (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    ID_supervisor INT DEFAULT 0,
    CONSTRAINT FK_Arbitro_Supervisa FOREIGN KEY (ID_supervisor) REFERENCES Arbitro(ID)
);
CREATE TABLE Historial (
    ID_arbitro INT,
    N_sanciones INT,
    Partidos_Arbitrados INT,
    Id_Historial INT,
    Rojas_sacadas INT,
    Amarillas_sacadas INT,
    CONSTRAINT PK_Historial PRIMARY KEY (Id_Historial),
    CONSTRAINT FK_Historial_Arbitro FOREIGN KEY (ID_arbitro) REFERENCES Arbitro(ID)
);

CREATE TABLE Partidos (
    ID_partido INT,
    Fecha DATE,
    Ganador INT,
    ID_arbitro INT,
    CONSTRAINT PK_Partidos PRIMARY KEY (ID_partido),
    CONSTRAINT FK_Partidos_Arbitro FOREIGN KEY (ID_arbitro) REFERENCES Arbitro(ID)
);
CREATE TABLE Informe (
    ID_informe INT,
    N_Rojas INT,
    N_Amarillas INT,
    Id_arbitro INT,
    Id_partido INT,
    CONSTRAINT PK_Informe PRIMARY KEY (ID_informe),
    CONSTRAINT FK_Informe_Arbitro FOREIGN KEY (Id_arbitro) REFERENCES Arbitro(ID),
    CONSTRAINT FK_Informe_Partido FOREIGN KEY (Id_partido) REFERENCES Partidos(ID_partido)
);
CREATE TABLE Juega (
    ID_eq INT,
    ID_partido INT,
    Rol VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Juega_Equipo PRIMARY KEY (ID_eq, ID_partido),
    CONSTRAINT FK_Juega_Equipo_Partido FOREIGN KEY (ID_partido) REFERENCES Partidos(ID_partido),
    CONSTRAINT CK_Rol CHECK (Rol IN ('Local', 'Visitante'))
);
-- Inserts para Persona
INSERT INTO Persona (DNI, Direccion, Nombre, Apellidos, F_nacimiento, Telefono) VALUES
('12345678A', 'Calle Mayor 12', 'Carlos', 'Martínez', '1995-06-10', '600123456'),
('23456789B', 'Avenida Central 45', 'Ana', 'López', '1998-04-23', '655987654'),
('34567890C', 'Plaza España 3', 'Javier', 'Gómez', '1992-11-15', '620345678'),
('45678901D', 'Calle Luna 78', 'Sofía', 'Fernández', '2000-01-20', '698456123'),
('56789012E', 'Avenida Sol 5', 'David', 'Ruiz', '1994-09-30', '630987654'),
('67890123F', 'Calle del Río 22', 'Elena', 'Sánchez', '1997-03-15', '619234567'),
('78901234G', 'Camino Verde 10', 'Miguel', 'Torres', '2001-08-08', '650876543'),
('89012345H', 'Calle Azul 99', 'Laura', 'Vega', '1990-07-12', '690321098'),
('90123456I', 'Avenida Norte 17', 'Pedro', 'Molina', '1993-12-25', '678909876'),
('01234567J', 'Calle Estrella 31', 'María', 'Castro', '1996-05-05', '699123876');
-- Inserts para Entrenador
INSERT INTO Entrenador (DNI, N_Equipos_Entrenados, Años_exp, Palmarés) VALUES
('12345678A', 3, 10, 5),
('23456789B', 2, 8, 2),
('34567890C', 5, 15, 10),
('45678901D', 1, 3, 0),
('56789012E', 4, 12, 7),
('67890123F', 2, 6, 1),
('78901234G', 3, 9, 4),
('89012345H', 4, 11, 6),
('90123456I', 2, 5, 2),
('01234567J', 1, 2, 0);
-- Inserts para Equipo
INSERT INTO Equipo (ID_eq, Nombre, N_Titulos, Estadio, DNI_entrenador) VALUES
(1, 'CH Jaca', 13, 'Pabellón de Hielo Jaca', '12345678A'),
(2, 'FC Barcelona Hockey Hielo', 7, 'Pista de Gel', '23456789B'),
(3, 'Majadahonda HC', 5, 'La Nevera', '34567890C'),
(4, 'CH Txuri Urdin', 16, 'Txuri Urdin Izotz Jauregia', '45678901D'),
(5, 'CH Puigcerdà', 7, 'Club Poliesportiu Puigcerdà', '56789012E'),
(6, 'Steel Acorns Valdemoro', 2, 'Francisco Fernández Ochoa', '67890123F'),
(7, 'Mileni Pirates', 1, 'Pista de Hielo Logroño', '78901234G'),
(8, 'Las Palmas HC', 0, 'Pabellón de Hielo Las Palmas', '89012345H'),
(9, 'Boadilla HC', 0, 'Centro de Patinaje Boadilla', '90123456I'),
(10, 'Granada Grizzlies', 0, 'Igloo Granada', '01234567J');
-- Inserts para Jugador
INSERT INTO Jugador (ID_eq, DNI, Posicion, Valor_mercado, Dorsal, Transferible, Salario) VALUES
(1, '67890123F', 'Delantero', 50.00, 9, FALSE, 5000000),
(2, '78901234G', 'Mediocentro', 35.00, 8, FALSE, 4000000),
(3, '89012345H', 'Defensa', 20.00, 5, FALSE, 2500000),
(4, '90123456I', 'Portero', 10.00, 1, FALSE, 2000000),
(5, '01234567J', 'Extremo', 40.00, 7, FALSE, 4500000),
(6, '12345678A', 'Delantero', 55.00, 11, FALSE, 5500000),
(7, '23456789B', 'Mediocentro', 30.00, 6, FALSE, 3500000),
(8, '34567890C', 'Defensa', 25.00, 4, FALSE, 3000000),
(9, '45678901D', 'Portero', 12.00, 2, FALSE, 2200000),
(10, '56789012E', 'Extremo', 38.00, 10, FALSE, 4200000);
-- Inserts para Arbitro
INSERT INTO Arbitro (ID, Nombre, ID_supervisor) VALUES
(1, 'Antonio Mateu Lahoz',1),
(2, 'Carlos Del Cerro Grande',1),
(3, 'Jesús Gil Manzano',1),
(4, 'José Luis Munuera Montero',1),
(5, 'Alberto Undiano Mallenco',1),
(6, 'Alejandro Hernández Hernández',1),
(7, 'Juan Martínez Munuera',1),
(8, 'Eduardo Prieto Iglesias',1),
(9, 'David Medié Jiménez',1),
(10, 'Santiago Jaime Latre',1);
-- Inserts para Partidos
INSERT INTO Partidos (ID_partido, Fecha,Ganador, ID_arbitro) VALUES
(1, '2025-05-01', 1, 7),
(2, '2025-05-02', 4,  2),
(3, '2025-05-03', 6, 9),
(4, '2025-05-04', 7, 4),
(5, '2025-05-05', 9, 10),
(6, '2025-05-06', 2, 6),
(7, '2025-05-07', 4, 1),
(8, '2025-05-08', 5,  8),
(9, '2025-05-09', 8, 5),
(10, '2025-05-10', 10, 3);
-- Inserts para Juega_Equipo (relación N:M)
INSERT INTO Juega (ID_eq, ID_partido, Rol) VALUES
(1, 1, 'Local'),
(3, 1, 'Visitante'),
(2, 2, 'Local'),
(4, 2, 'Visitante'),
(5, 3, 'Local'),
(6, 3, 'Visitante'),
(7, 4, 'Local'),
(8, 4, 'Visitante'),
(9, 5, 'Local'),
(10, 5, 'Visitante'),
(1, 6, 'Local'),
(2, 6, 'Visitante'),
(3, 7, 'Local'),
(4, 7, 'Visitante'),
(5, 8, 'Local'),
(6, 8, 'Visitante'),
(7, 9, 'Local'),
(8, 9, 'Visitante'),
(9, 10, 'Local'),
(10, 10, 'Visitante');
INSERT INTO Informe (ID_informe, N_Rojas, N_Amarillas, Id_arbitro, Id_partido) VALUES
(1, 1, 3, 7, 1),
(2, 0, 5, 2, 2),
(3, 2, 2, 9, 3),
(4, 1, 4, 4, 4),
(5, 0, 6, 10, 5),
(6, 3, 1, 6, 6),
(7, 0, 2, 1, 7),
(8, 2, 3, 8, 8),
(9, 1, 5, 5, 9),
(10, 0, 4, 3, 10);
