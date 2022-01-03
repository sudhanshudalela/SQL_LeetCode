# Write your MySQL query statement below

SELECT DISTINCT S1.*
FROM Stadium S1, Stadium S2, Stadium S3
WHERE S1.people >= 100 AND S2.people >= 100 AND S3.people >= 100
AND
(
    (S1.id - S2.id = 1 AND S1.id - S3.id = 2 AND S2.id - S3.id =1)
    OR
    (S2.id - S1.id = 1 AND S2.id - S3.id = 2 AND S1.id - S3.id =1)
    OR
    (S3.id - S2.id = 1 AND S2.id - S1.id = 1 AND S3.id - S1.id = 2)
)
ORDER BY S1.id