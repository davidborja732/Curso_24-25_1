CREATE DATABASE Liga_Hockey;
USE Liga_Hockey;
CREATE TABLE usuario(
usuario VARCHAR(30),
contraseña CHAR(6)
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
    ID_supervisor INT NULL,
    CONSTRAINT FK_Arbitro_Supervisa FOREIGN KEY (ID_supervisor) REFERENCES Arbitro(ID) ON DELETE SET NULL
);
CREATE TABLE Historial (
    ID_arbitro INT,
    N_sanciones INT,
    Partidos_Arbitrados INT,
    Id_Historial INT,
    Rojas_sacadas INT,
    Amarillas_sacadas INT,
    CONSTRAINT PK_Historial PRIMARY KEY (Id_Historial),
    CONSTRAINT FK_Historial_Arbitro FOREIGN KEY (ID_arbitro) REFERENCES Arbitro(ID) ON DELETE CASCADE
);

CREATE TABLE Partidos (
    ID_partido INT,
    Fecha DATE,
    Ganador VARCHAR(50),
    ID_eq INT,
    ID_arbitro INT,
    CONSTRAINT PK_Partidos PRIMARY KEY (ID_partido),
    CONSTRAINT FK_Partidos_Equipo FOREIGN KEY (ID_eq) REFERENCES Equipo(ID_eq) ON DELETE CASCADE,
    CONSTRAINT FK_Partidos_Arbitro FOREIGN KEY (ID_arbitro) REFERENCES Arbitro(ID) ON DELETE SET NULL
);

CREATE TABLE Informe (
    ID_informe INT,
    N_Rojas INT,
    N_Amarillas INT,
    Id_arbitro INT,
    Id_partido INT,
    CONSTRAINT PK_Informe PRIMARY KEY (ID_informe),
    CONSTRAINT FK_Informe_Arbitro FOREIGN KEY (Id_arbitro) REFERENCES Arbitro(ID) ON DELETE CASCADE,
    CONSTRAINT FK_Informe_Partido FOREIGN KEY (Id_partido) REFERENCES Partidos(ID_partido) ON DELETE CASCADE
);
CREATE TABLE Juega (
    ID_eq INT,
    ID_partido INT,
    Rol VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Juega_Equipo PRIMARY KEY (ID_eq, ID_partido),
    CONSTRAINT FK_Juega_Equipo_Equipo FOREIGN KEY (ID_eq) REFERENCES Equipo(ID_eq) ON DELETE CASCADE,
    CONSTRAINT FK_Juega_Equipo_Partido FOREIGN KEY (ID_partido) REFERENCES Partidos(ID_partido) ON DELETE CASCADE,
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
(1, 'Real Madrid', 35, 'Santiago Bernabéu', '12345678A'),
(2, 'Barcelona', 30, 'Camp Nou', '23456789B'),
(3, 'Atlético Madrid', 11, 'Wanda Metropolitano', '34567890C'),
(4, 'Sevilla', 6, 'Ramón Sánchez-Pizjuán', '45678901D'),
(5, 'Betis', 3, 'Benito Villamarín', '56789012E'),
(6, 'Valencia', 6, 'Mestalla', '67890123F'),
(7, 'Villarreal', 1, 'Estadio de la Cerámica', '78901234G'),
(8, 'Real Sociedad', 2, 'Anoeta', '89012345H'),
(9, 'Celta Vigo', 1, 'Balaídos', '90123456I'),
(10, 'Granada', 0, 'Los Cármenes', '01234567J');

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
INSERT INTO Arbitro (ID, Nombre) VALUES
(1, 'Antonio Mateu Lahoz'),
(2, 'Carlos Del Cerro Grande'),
(3, 'Jesús Gil Manzano'),
(4, 'José Luis Munuera Montero'),
(5, 'Alberto Undiano Mallenco'),
(6, 'Alejandro Hernández Hernández'),
(7, 'Juan Martínez Munuera'),
(8, 'Eduardo Prieto Iglesias'),
(9, 'David Medié Jiménez'),
(10, 'Santiago Jaime Latre');

-- Inserts para Partidos
INSERT INTO Partidos (ID_partido, Fecha, Ganador, ID_eq, ID_arbitro) VALUES
(1, '2025-04-01', 'Real Madrid', 1, 3),
(2, '2025-04-02', 'Barcelona', 2, 5),
(3, '2025-04-03', 'Atlético Madrid', 3, 7),
(4, '2025-04-04', 'Sevilla', 4, 9),
(5, '2025-04-05', 'Betis', 5, 1),
(6, '2025-04-06', 'Valencia', 6, 2),
(7, '2025-04-07', 'Villarreal', 7, 4),
(8, '2025-04-08', 'Real Sociedad', 8, 6),
(9, '2025-04-09', 'Celta Vigo', 9, 8),
(10, '2025-04-10', 'Granada', 10, 10);

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