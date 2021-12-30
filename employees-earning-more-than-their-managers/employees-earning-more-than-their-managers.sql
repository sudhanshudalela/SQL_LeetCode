# Write your MySQL query statement below
SELECT E.Name AS Employee
FROM Employee E
INNER JOIN Employee M
ON E.ManagerId = M.Id
WHERE E.Salary > M.Salary