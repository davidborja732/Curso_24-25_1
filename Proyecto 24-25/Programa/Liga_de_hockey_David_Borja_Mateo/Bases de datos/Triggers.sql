DELIMITER //

CREATE TRIGGER verificar_rol_y_equipos
BEFORE INSERT ON Juega_Equipo
FOR EACH ROW
BEGIN
    DECLARE cuenta_local INT;
    DECLARE cuenta_visitante INT;

    -- Verificar que el mismo equipo no se registre dos veces en el mismo partido
    IF EXISTS (
        SELECT 1 FROM Juega_Equipo
        WHERE ID_partido = NEW.ID_partido AND ID_eq = NEW.ID_eq
    ) THEN
        SET NEW.ID_eq = NULL; -- Evita la inserción
    END IF;

    -- Contar cuántos equipos hay en el partido con el mismo rol
    SELECT COUNT(*) INTO cuenta_local FROM Juega_Equipo WHERE ID_partido = NEW.ID_partido AND Rol = 'Local';
    SELECT COUNT(*) INTO cuenta_visitante FROM Juega_Equipo WHERE ID_partido = NEW.ID_partido AND Rol = 'Visitante';

    -- Si ya hay un equipo con el mismo rol en el partido, evitar la inserción
    IF (NEW.Rol = 'Local' AND cuenta_local >= 1) OR (NEW.Rol = 'Visitante' AND cuenta_visitante >= 1) THEN
        SET NEW.Rol = NULL; -- Evita la inserción
    END IF;
END;
//

DELIMITER ;
DELIMITER //

CREATE TRIGGER evitar_entrenador_duplicado
BEFORE INSERT ON Equipo
FOR EACH ROW
BEGIN
    DECLARE entrenador_existente INT;

    -- Verificar si el DNI del entrenador ya está asignado a otro equipo
    SELECT COUNT(*) INTO entrenador_existente FROM Equipo WHERE DNI_entrenador = NEW.DNI_entrenador;

    IF entrenador_existente >= 1 THEN
        SET NEW.DNI_entrenador = NULL; -- Evita la inserción asignando un valor nulo
    END IF;
END;
//

DELIMITER ;




