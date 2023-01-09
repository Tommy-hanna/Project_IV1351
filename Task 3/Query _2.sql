
SELECT SUM(CASE WHEN sibling_id IS NULL THEN 1 END) AS no_siblings,
SUM(CASE WHEN (LENGTH(sibling_id) - LENGTH(REPLACE(sibling_id,',',''))) = 1 THEN 1 END ) AS one_siblings,
SUM(CASE WHEN (LENGTH(sibling_id) - LENGTH(REPLACE(sibling_id,',',''))) > 1 THEN 1 END ) AS two_siblings
FROM students
