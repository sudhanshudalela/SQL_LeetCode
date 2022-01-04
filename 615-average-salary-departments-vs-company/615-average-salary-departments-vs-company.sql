# Write your MySQL query statement below


SELECT DISTINCT pay_month, department_id,
CASE
    WHEN avg_mo < avg_mo_dept THEN 'higher'
    WHEN avg_mo > avg_mo_dept THEN 'lower'
    ELSE 'same'
    END AS comparison
FROM (
    SELECT *, AVG(amount) OVER(PARTITION BY pay_month) AS avg_mo, AVG(amount) OVER(PARTITION BY pay_month, department_id) AS avg_mo_dept
    FROM (
        SELECT E.*, amount, DATE_FORMAT(pay_date,'%Y-%m') AS pay_month
        FROM Employee AS E
        LEFT JOIN Salary AS S
        On E.employee_id = S.employee_id
        ) Q
    ) Q1
