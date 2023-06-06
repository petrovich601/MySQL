
CREATE DATABASE HW6;
use HW6;

-- 1.	Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE FUNCTION second_counter(num INT)
returns varchar(100)
deterministic
BEGIN
	CASE
		WHEN num < 60 THEN
			RETURN CONCAT(num, ' ', 'seconds');
        WHEN num >= 60 AND num < 3600 THEN
			RETURN CONCAT_WS(' ', num DIV 60, 'minutes', MOD(num, 60), 'seconds');
        WHEN num >= 3600 AND num < 86400 THEN
			RETURN CONCAT_WS(' ', num DIV 3600, 'hours', MOD(num, 3600) DIV 60, 'minutes', MOD(MOD(num, 3600),60), 'seconds');
        ELSE
			RETURN CONCAT_WS(' ', num DIV 86400, 'days', MOD(num, 86400) DIV 3600, 'hours', MOD(MOD(num, 86400),3600) DIV 60, 'minutes',
                             MOD(MOD(MOD(num, 86400),3600),60), 'seconds');
    END CASE;
END//

DELIMITER ;
SELECT second_counter(123456);  

-- 2.	Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 

DELIMITER //
CREATE PROCEDURE get_even(`start` INT, `end` INT)
BEGIN
	DECLARE i INT DEFAULT `start`;
    DECLARE res_str TEXT DEFAULT NULL;
    WHILE  i<=`end` DO
        IF i%2 = 0 THEN
			IF res_str IS NULL THEN
				SET res_str = concat(i);
			ELSE
				SET res_str = concat(res_str, ', ', i);
			END IF;
		END IF;
        SET i = i + 1;
    END WHILE;
	SELECT res_str;
END //
DELIMITER ;

CALL get_even(1, 10);
-- CALL second_counter(123456);