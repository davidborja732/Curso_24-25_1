CREATE DATABASE login;
USE login;
CREATE TABLE usuario(
usuario VARCHAR(30),
contraseña CHAR(6)
);
INSERT INTO usuario VALUES("Admin","123456")