
(SELECT CASE 
		WHEN WEEKDAY(time_slot) = 0 THEN 'Monday' 
		WHEN WEEKDAY(time_slot) = 1 THEN 'Tuesday' 
		WHEN WEEKDAY(time_slot) = 2 THEN 'Wendsday' 
		WHEN WEEKDAY(time_slot) = 3 THEN 'Thursday' 
		WHEN WEEKDAY(time_slot) = 4 THEN 'Friday' 
		WHEN WEEKDAY(time_slot) = 5 THEN 'Saturday' 
		WHEN WEEKDAY(time_slot) = 6 THEN 'Sunday' 
	END
	AS weekday, lessons.*
FROM lessons
WHERE time_slot BETWEEN  DATE_ADD(NOW(), INTERVAL 7 DAY) - INTERVAL(DAYOFWEEK(DATE_ADD(NOW(), INTERVAL 7 DAY)) + 1) DAY AND DATE_ADD(NOW(), INTERVAL 7 DAY) + INTERVAL(6 - DAYOFWEEK(DATE_ADD(NOW(), INTERVAL 7 DAY)) ) DAY
ORDER BY ensemble_mode)
UNION
(SELECT CASE 
		WHEN WEEKDAY(time_slot) = 0 THEN 'Monday' 
		WHEN WEEKDAY(time_slot) = 1 THEN 'Tuesday' 
		WHEN WEEKDAY(time_slot) = 2 THEN 'Wendsday' 
		WHEN WEEKDAY(time_slot) = 3 THEN 'Thursday' 
		WHEN WEEKDAY(time_slot) = 4 THEN 'Friday' 
		WHEN WEEKDAY(time_slot) = 5 THEN 'Saturday' 
		WHEN WEEKDAY(time_slot) = 6 THEN 'Sunday' 
	END
	AS weekday, lessons.*
FROM lessons
WHERE time_slot BETWEEN  DATE_ADD(NOW(), INTERVAL 7 DAY) - INTERVAL(DAYOFWEEK(DATE_ADD(NOW(), INTERVAL 7 DAY)) + 1) DAY AND DATE_ADD(NOW(), INTERVAL 7 DAY) + INTERVAL(6 - DAYOFWEEK(DATE_ADD(NOW(), INTERVAL 7 DAY)) ) DAY
ORDER BY WEEKDAY(time_slot))