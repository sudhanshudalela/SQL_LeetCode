# Write your MySQL query statement below

SELECT DISTINCT title 
FROM TVProgram AS T
INNER JOIN (
    SELECT DISTINCT content_id, title
    FROM Content
    WHERE Kids_content = 'Y' AND content_type = 'Movies'
    ) C
ON T.content_id = C.content_id
WHERE program_date LIKE '2020-06-%'