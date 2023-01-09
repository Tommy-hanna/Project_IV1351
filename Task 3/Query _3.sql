
SELECT * FROM (SELECT COUNT(instructor_id) AS lesson_count,
instructors.*
FROM lessons
LEFT JOIN instructors ON instructors.id = lessons.instructor_id
WHERE MONTH(time_slot) = MONTH(NOW()) AND YEAR(time_slot) = YEAR(NOW()) 
GROUP BY lessons.instructor_id) AS p WHERE p.lesson_count > 2