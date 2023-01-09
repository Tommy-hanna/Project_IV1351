
SELECT SUM(1) AS total_lessons,
SUM(CASE WHEN `lesson_mode` = 'INDIVIDUAL' THEN 1 ELSE 0 END ) AS individual_lessons,
SUM(CASE WHEN `lesson_mode` = 'group' THEN 1 ELSE 0 END ) AS individual_lessons,
SUM(CASE WHEN `ensemble_mode` IS NOT NULL THEN 1 ELSE 0 END ) AS ensemble_lessons
FROM lessons
WHERE YEAR(`lessons`.`time_slot`) = 2022 AND MONTH(`lessons`.`time_slot`) = 12
