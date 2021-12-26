# Write your MySQL query statement below

SELECT Department, Employee, Salary
FROM(
    SELECT Department, Employee, Salary, DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) R
    FROM(
        SELECT Department.Name AS Department, Employee.Name AS Employee, Salary
        FROM Employee
        INNER JOIN Department
        ON Employee.DepartmentId = Department.Id
        ) AS OS
    ) AS Ranked
WHERE R = 1 OR R = 2 OR R = 3