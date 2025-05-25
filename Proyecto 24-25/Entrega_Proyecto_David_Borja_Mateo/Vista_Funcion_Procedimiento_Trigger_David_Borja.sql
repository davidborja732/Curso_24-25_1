-- CREACION DE VISTA: Vista de jugadores con su equipo
CREATE VIEW Vista_Jugadores AS
SELECT J.DNI, J.Posicion, J.Salario, E.Nombre AS Equipo -- Seleccionamos datos de jugadores y el nombre de su equipo
FROM Jugador J
JOIN Equipo E ON J.ID_eq = E.ID_eq; -- Unimos la tabla Jugador con la tabla Equipo por la clave ID_eq

-- Explicacion:
-- Esta vista permite consultar rapidamente los jugadores junto con el nombre de su equipo sin necesidad de realizar manualmente un JOIN cada vez.

-- Llamada a la vista para ver los datos que contiene
SELECT * FROM Vista_Jugadores;

-- CREACION DE FUNCION: Calcular salario promedio por equipo
DELIMITER //
CREATE FUNCTION Salario_Promedio_Equipo(equipo_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2); -- Declaramos una variable para almacenar el salario promedio
    SELECT AVG(Salario) INTO promedio -- Calculamos el promedio de los salarios de los jugadores en un equipo especifico
    FROM Jugador
    WHERE ID_eq = equipo_id; -- Filtramos los jugadores por equipo_id
    RETURN promedio; -- Devolvemos el resultado
END //
DELIMITER ;

-- Explicacion:
-- Esta funcion devuelve el salario promedio de los jugadores que pertenecen al equipo indicado por equipo_id.

-- Llamada a la funcion para obtener el salario promedio de un equipo especifico
SELECT Salario_Promedio_Equipo(5);

-- CREACION DE PROCEDIMIENTO: Aumentar salario de jugadores de un equipo
DELIMITER //
CREATE PROCEDURE Aumentar_Salario_Equipo(IN equipo_id INT, IN porcentaje DECIMAL(5,2))
BEGIN
    UPDATE Jugador -- Actualizamos los registros de la tabla Jugador
    SET Salario = Salario * (1 + porcentaje/100) -- Aumentamos el salario en el porcentaje proporcionado
    WHERE ID_eq = equipo_id; -- Solo modificamos los jugadores del equipo indicado
END //
DELIMITER ;

-- Explicacion:
-- Este procedimiento aumenta el salario de todos los jugadores de un equipo en un porcentaje dado.

-- Llamada al procedimiento para aumentar el salario de los jugadores del equipo con ID 5 en un 2%
CALL Aumentar_Salario_Equipo(5,2);

-- CREACION DE TRIGGER: Registrar cambios en salarios de jugadores

-- Primero, se crea la tabla Historial_Salarios para almacenar cambios en salarios
CREATE TABLE Historial_Salarios (
    ID INT AUTO_INCREMENT PRIMARY KEY, -- Identificador unico para cada registro en el historial
    DNI_Jugador VARCHAR(15), -- Almacenamos el DNI del jugador cuyo salario ha cambiado
    Salario_Anterior DECIMAL(10,2), -- Guardamos el salario previo al cambio
    Salario_Nuevo DECIMAL(10,2), -- Guardamos el nuevo salario despues del cambio
    Fecha_Cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Se registra automaticamente la fecha y hora del cambio
);

-- Ahora creamos el trigger que registrara los cambios de salario cuando se actualicen en la tabla Jugador
DELIMITER //
CREATE TRIGGER Actualizar_Historial_Salarios
AFTER UPDATE ON Jugador -- Se ejecuta despues de que se realice una actualizacion en la tabla Jugador
FOR EACH ROW -- Se ejecuta para cada fila que sufra una actualizacion
BEGIN
    INSERT INTO Historial_Salarios (DNI_Jugador, Salario_Anterior, Salario_Nuevo) -- Insertamos un nuevo registro en el historial
    VALUES (OLD.DNI, OLD.Salario, NEW.Salario); -- Guardamos el DNI del jugador, su salario anterior y el nuevo salario
END //
DELIMITER ;

-- Explicacion:
-- Este trigger registra automaticamente los cambios de salario en la tabla Historial_Salarios cada vez que se modifica el salario de un jugador.




