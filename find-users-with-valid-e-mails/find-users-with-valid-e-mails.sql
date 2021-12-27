# Write your MySQL query statement below

SELECT *
FROM Users
WHERE mail REGEXP '^[a-zA-Z]{1}[A-Za-z0-9_\\.\\-]*(@leetcode\\.com)$'