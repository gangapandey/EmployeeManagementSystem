USE EMS;

-- Write a query to count how many employees are in each department.
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS Countings
FROM Departments d
LEFT JOIN Employees e 
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- Find the total salary paid to employees in each department.
SELECT d.DepartmentName, SUM(s.Amount) AS TotalSalary
FROM Departments d
JOIN Employees e 
ON d.DepartmentID = e.DepartmentID
JOIN Salaries s 
ON e.EmployeeID = s.EmployeeID
GROUP BY d.DepartmentName;

-- Write a query to calculate the average salary of employees for each job position.
SELECT Position, AVG(Salary) AS avgsalary
FROM Employees
GROUP BY Position;

-- Count the number of attendance records for each status (e.g., Present, Absent).
SELECT Status, COUNT(*) as counting
FROM Attendance
GROUP BY Status;

-- Write a query to count how many projects are managed by each department.



-- Calculate the total salary of employees hired each year.
SELECT SUM(Salary) AS Sumsalary, YEAR(HireDate) AS YEARHIRE
FROM Employees
GROUP BY YEAR(HireDate);

-- Write a query to count how many employees were hired each month.
SELECT MONTH(HireDate) AS months, COUNT(EmployeeID) AS EmpCount
FROM EMPLOYEES
GROUP BY MONTH(HireDate);

-- Find the average salary of employees grouped by their job positions.
SELECT Position, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Position;

-- Write a query to count the distinct number of project name in the Projects table.
SELECT DISTINCT(ProjectName)
FROM Projects;

-- Write a query to count how many employees share the same first name.
SELECT FirstName, COUNT(*) AS EmpCount
FROM Employees
GROUP BY FirstName
HAVING COUNT (*) >1
ORDER BY EmpCount DESC;

-- Write a query to count the number of attendance records for each employee.
SELECT EmployeeID, COUNT(*) AS Record
FROM Attendance
GROUP BY EmployeeID;

-- Find the number of distinct departments that have employees.
SELECT COUNT(DISTINCT DepartmentName) AS DNAME
FROM Departments
WHERE DepartmentName IS NOT NULL;

-- Write a query to group employees into salary ranges and count how many fall into each range.
SELECT CASE 
			WHEN Salary < 30000 THEN 'Below 30000'
			WHEN Salary BETWEEN 30000 AND 49999 THEN '30K - 49K'
			WHEN Salary BETWEEN 50000 AND 69999 THEN '50K -69K'
			ELSE '70K AND ABOVE'
			END AS SalaryRange,
			COUNT(*) AS EmpCount
FROM Employees
WHERE Salary IS NOT NULL
GROUP BY CASE 
			WHEN Salary < 30000 THEN 'Below 30000'
			WHEN Salary BETWEEN 30000 AND 49999 THEN '30K - 49K'
			WHEN Salary BETWEEN 50000 AND 69999 THEN '50K -69K'
			ELSE '70K AND ABOVE'
			END
ORDER BY SalaryRange;

-- Count how many employees were hired in each year.
SELECT COUNT(EmployeeID) as empcount, YEAR(HireDate)
FROM Employees
GROUP BY YEAR(Hiredate);

-- Write a query to find the number of projects started each year.
SELECT YEAR(StartDate) AS ProjectYear, count(*) AS ProjectCount
FROM Projects
GROUP BY YEAR(StartDate)
ORDER BY ProjectCount;

