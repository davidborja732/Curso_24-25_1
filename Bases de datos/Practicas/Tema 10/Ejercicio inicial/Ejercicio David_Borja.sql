-- 1
CREATE DEFINER=`root`@`localhost` PROCEDURE `sakila`.`ver_peliculas`(IN coste_reemplazo DECIMAL(5,2))
BEGIN
	SELECT * FROM film WHERE replacement_cost>coste_reemplazo;
END;
-- 2
CREATE DEFINER=`root`@`localhost` PROCEDURE `sakila`.`ver_peliculas_dos`(IN coste_reemplazo DECIMAL(5,2),IN coste_reemplazo2 DECIMAL(5,2))
BEGIN
	SELECT * FROM film WHERE replacement_cost>coste_reemplazo AND replacement_cost<coste_reemplazo2;
END;
-- 3
CREATE PROCEDURE world.paises_hablantes(IN continente VARCHAR(100),IN idioma VARCHAR(30))
BEGIN
	SELECT * FROM country WHERE Continent=continente AND Code IN (SELECT CountryCode FROM countrylanguage WHERE Language=idioma);
END;
-- 4
CREATE PROCEDURE world.area(IN lado INT)
BEGIN
	SELECT lado*lado;
END;
-- 5
CREATE PROCEDURE world.palabra_al_reves(INOUT cadena VARCHAR(50))
BEGIN
	/*Declarar variables*/
	DECLARE longitud INT DEFAULT LENGTH(cadena);
	DECLARE i int DEFAULT 0;
	DECLARE c CHAR(1);
	DECLARE nueva_cadena VARCHAR(30) DEFAULT ' ';
	WHILE i<longitud DO
		SET c=SUBSTRING(cadena,longitud-i,1);
		SET nueva_cadena=CONCAT(nueva_cadena,c);
		SET i=i+1;
	END WHILE;
	SET cadena=nueva_cadena;
END
-- 6
DELIMITER //
CREATE PROCEDURE sakila.Cambio_mail(IN emailnuevo VARCHAR(50),IN identificador INTEGER)
BEGIN 
	UPDATE customer SET email=emailnuevo WHERE customer_id=identificador;
END;
DELIMITER ;
 7. Crear una función que devuelva el número de actor de la tabla actor, pasando como parámetros el
 apellido y nombre. Base de datos sakila, tabla actor, campos first_name, last_name, actor_id
CREATE FUNCTION sakila.devoler_id_actor(nombre VARCHAR(45),apellidos VARCHAR(45))
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE v_id INT;
	SELECT actor_id INTO v_id FROM actor
	WHERE first_name=nombre AND last_name=apellidos;
	RETURN v_id; 
END
 8. Crea un procedimiento que visualice las películas cuya categoría (comedia, drama,... se pasa como
 parámetro). Realiza una subconsulta.
CREATE PROCEDURE sakila.ver_peliculas(IN genero VARCHAR(40))
BEGIN 
	SELECT 
 9. Crea un procedimiento que tenga un parámetro de entrada que será el nombre de la categoría y un
 parámetro de salida que contendrá el número de películas para esa categoría. 

10. Desarrollar una función que devuelva el número de años completos que hay entre dos fechas que
 se pasan como parámetros. Utiliza la función DATEDIFF 
-- 11
CREATE PROCEDURE sakila.borrar_actor(IN id_actor INT)
BEGIN
	DECLARE id INT;
	SELECT actor_id=id_actor;
	IF id IS NULL THEN
		SELECT ('El actor no existe')
	ELSE 
		DELETE FROM actor WHERE actor_id=id_actor;
	END IF;
END
-- 12
CREATE PROCEDURE sakila.Duracion_peli(IN id_peli INT,OUT duracion)
BEGIN 
	SELECT duracion FROM (SELECT lenght as duracion FROM film_list WHERE FID=id_peli);
	IF duracion<50 THEN 
		SELECT ('Corta duracion')
	END IF; 
	IF duracion>50 AND duracion <120 THEN 
		SELECT ('Media duracion')
	END IF; 
	IF duracion<120 THEN 
		SELECT ('Larga duracion')
	END IF; 
END;
-- 13
UPDATE country SET GNP = GNP*1.5 WHERE Continent='Antartica';
UPDATE country SET GNP = GNP * 1.5 WHERE Continent = 'Antarctica';
UPDATE country SET GNP = GNP * 1.017 WHERE Continent IN ('Asia', 'South America');
UPDATE country SET GNP = GNP * 1.019 WHERE Continent IN ('Europe', 'North America');
UPDATE country SET GNP = GNP * 1.016 WHERE Continent = 'Oceania';