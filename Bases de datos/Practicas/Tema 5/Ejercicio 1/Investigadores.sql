mysql> CREATE DATABASE Investigadores;
Query OK, 1 row affected (0,01 sec)

mysql> USE Investigadores;
Database changed
mysql> CREATE TABLE Facultades(
    -> IdFacultad INTEGER AUTO_INCREMENT PRIMARY KEY,
    -> NomFacultad VARCHAR(50)
    -> );
Query OK, 0 rows affected (0,02 sec)

mysql> CREATE TABLE Investigadores(
    -> DNI CHAR(9) PRIMARY KEY,
    -> Nombre VARCHAR(35),
    -> Apellidos VARCHAR(50),
    -> Beca FLOAT,
    -> Facultad INTEGER,
    -> CONSTRAINT fk_investigadores_fac FOREIGN KEY(Facultad) REFERENCES Facultades (IdFacultad)
    -> );
Query OK, 0 rows affected (0,03 sec)

mysql> CREATE TABLE Equipos(
    -> IdEquipo CHAR(4) PRIMARY KEY,
    -> IdFacultad INTEGER,
    -> Descripcion VARCHAR(50),
    -> CONSTRAINT fk_Equipos_fac FOREIGN KEY(IdFacultad) REFERENCES Facultades (IdFacultad)
    -> );
Query OK, 0 rows affected (0,03 sec)

mysql> CREATE TABLE Reservas(
    -> IdReserva INTEGER AUTO_INCREMENT,
    -> DNI CHAR(9),
    -> IdEquipo CHAR(4),
    -> FechaInicio DATE,
    ->  FechaFin DATE,
    -> PRIMARY KEY(IdReserva),
    -> CONSTRAINT fk_Reservas_fac FOREIGN KEY(DNI) REFERENCES Investigadores (DNI),
    -> CONSTRAINT fk_Reservas_fac_equipo FOREIGN KEY(IdEquipo) REFERENCES Equipos (IdEquipo)
    -> );
Query OK, 0 rows affected (0,04 sec)

mysql> show tables;
+--------------------------+
| Tables_in_Investigadores |
+--------------------------+
| Equipos                  |
| Facultades               |
| Investigadores           |
| Reservas                 |
+--------------------------+
4 rows in set (0,00 sec)

