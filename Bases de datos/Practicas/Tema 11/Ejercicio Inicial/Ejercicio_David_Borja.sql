-- 1
CREATE DEFINER=`root`@`localhost` TRIGGER `Ejercicio_1` 
AFTER DELETE ON `actor` FOR EACH ROW 
insert into auditaractor values (CONCAT(NOW(),'&',old.actor_id, '&',old.last_name))
-- 2
CREATE DEFINER=`root`@`localhost` TRIGGER `Ejercicio_2` 
AFTER UPDATE ON `actor` FOR EACH ROW 
insert into auditaractor values (CONCAT(NOW()," nombre viejo ",old.first_name, ' nuevo nombre ',NEW.first_name, " apellido viejo " ,old.last_name ,"apellido nuevo",new.last_name))
-- 3
CREATE DEFINER=`root`@`localhost` TRIGGER Ejercicio_3
BEFORE BEFORE
ON film FOR EACH ROW
BEGIN
	IF NEW.replacement_cost>OLD.replacement_cost*1.10 THEN
		SET NEW.replacement_cost=OLD.replacement_cost*1.10;
	END IF;
END
-- 4
CREATE TABLE estadisticas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    num_countries INT,
    avg_cities_per_country INT, -- Changed from media_poblacion to reflect city count
    continent_name VARCHAR(50),  -- Changed from continente to reflect country name as grouping
    calculation_date DATE
);

USE sakila;

CREATE TABLE IF NOT EXISTS country_statistics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    continent_name VARCHAR(50),
    num_countries_in_continent INT,
    avg_cities_per_country INT,
    calculation_date DATE,
    UNIQUE (continent_name)
);

DELIMITER $$

CREATE TRIGGER after_country_insert
AFTER INSERT ON country
FOR EACH ROW
BEGIN
    DECLARE v_num_countries INT;
    DECLARE v_avg_cities_per_country INT;
    DECLARE v_continent_name VARCHAR(50);

    SET v_continent_name = NEW.country;

    SET v_num_countries = 1;

    SELECT COUNT(c.city_id) INTO v_avg_cities_per_country
    FROM city c
    WHERE c.country_id = NEW.country_id;

    INSERT INTO country_statistics (continent_name, num_countries_in_continent, avg_cities_per_country, calculation_date)
    VALUES (v_continent_name, v_num_countries, v_avg_cities_per_country, CURDATE())
    ON DUPLICATE KEY UPDATE
        num_countries_in_continent = VALUES(num_countries_in_continent),
        avg_cities_per_country = VALUES(avg_cities_per_country),
        calculation_date = VALUES(calculation_date);

END$$

DELIMITER ;
-- 5
USE sakila;
CREATE TABLE IF NOT EXISTS copia_actor LIKE actor;
DELIMITER $$
CREATE EVENT IF NOT EXISTS copia_diaria ON SCHEDULE EVERY 1 DAYSTARTS CURRENT_TIMESTAMPDOBEGIN    
TRUNCATE TABLE copia_actor;
    INSERT INTO copia_actor SELECT * FROM actor;END$$
DELIMITER ;