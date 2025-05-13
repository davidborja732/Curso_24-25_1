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

-- 5
