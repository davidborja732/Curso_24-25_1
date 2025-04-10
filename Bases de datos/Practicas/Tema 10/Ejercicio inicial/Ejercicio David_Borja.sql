CREATE DEFINER=`root`@`localhost` PROCEDURE `sakila`.`ver_peliculas`(IN coste_reemplazo DECIMAL(5,2))
BEGIN
	SELECT * FROM film WHERE replacement_cost>coste_reemplazo;
END;

CREATE DEFINER=`root`@`localhost` PROCEDURE `sakila`.`ver_peliculas_dos`(IN coste_reemplazo DECIMAL(5,2),IN coste_reemplazo2 DECIMAL(5,2))
BEGIN
	SELECT * FROM film WHERE replacement_cost>coste_reemplazo AND replacement_cost<coste_reemplazo2;
END;

CREATE PROCEDURE world.paises_hablantes(IN continente VARCHAR(100),IN idioma VARCHAR(30))
BEGIN
	SELECT * FROM country WHERE Continent=continente AND Code IN (SELECT CountryCode FROM countrylanguage WHERE Language=idioma);
END;

CREATE PROCEDURE world.area(IN lado INT)
BEGIN
	SELECT lado*lado;
END;

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
END;