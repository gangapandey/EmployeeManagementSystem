USE EMS;

-- find all employees whose first name is "John."
SELECT *
FROM Employees
WHERE FirstName = 'John';

-- Retrieve all employees hired after January 1, 2023.
SELECT *
FROM Employees
WHERE HireDate > '2023-01-01';

-- List employees with a salary greater than $55,000.
SELECT *
FROM Employees
WHERE Salary > 55000;

-- Find all departments managed by the manager with ManagerID = 2.
SELECT DepartmentName
FROM Departments
WHERE ManagerID = 2;

-- Retrieve all employees with a salary between $40,000 and $60,000.
SELECT *
FROM Salaries
WHERE Amount BETWEEN 40000 AND 50000;

-- Find employees whose department is "HR" and whose salary is greater than $45,000.
SELECT  *
FROM Employees
WHERE Position = 'HR Manager' AND Salary > 45000;

-- find all employees who do not work in the "Sales" department.
SELECT *
FROM Employees
WHERE Position <> 'Sales Manager';

-- Retrieve all employees who do not have a recorded manager (i.e., ManagerID is NULL).
SELECT e.EmployeeID, e.FirstName, e.LastName, e.DepartmentID, e.HireDate, e.Salary, e.Position
FROM Employees e
LEFT JOIN Departments d
ON e.EmployeeID = d.ManagerID
WHERE d.ManagerID IS NULL;

-- Find all employees whose last name contains the substring "son."
SELECT *
FROM Employees
WHERE LastName LIKE '%son%';

-- List all employees hired in the month of March 2023.
SELECT *
FROM Employees
WHERE HireDate >= '2023-03-01' AND HireDate < '2023-04-01';

-- find all attendance records where the status is "Absent."
SELECT * 
FROM Attendance 
WHERE Status = 'Absent';

-- Retrieve all employees with the status "Present"
SELECT * 
FROM Attendance 
WHERE Status = 'Present';

-- find all projects whose names start with the letter "p."
select ProjectName
FROM Projects
WHERE ProjectName LIKE 'P%';

-- Retrieve employees whose first name is "Henry" and last name is "Lee."
SELECT *
FROM Employees
WHERE FirstName = 'Henry' AND LastName = 'Lee';

-- Find all salaries that are effective after January 1, 2024.
SELECT Amount, EffectiveDate
FROM Salaries
WHERE EffectiveDate >= '2023-01-01';

-- find all employees except those with EmployeeID 10
SELECT * 
FROM Employees
WHERE EmployeeID <> 10;

-- List all employees hired between January 1, 2023, and December 31, 2024, who are in the "Development" department.
SELECT e.FirstName, e.LastName, d.DepartmentName, e.HireDate
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE HireDate BETWEEN '2023-01-01' AND '2024-12-31' AND DepartmentName = 'Web Development';

-- find all employees who were hired on or after December 1, 2023.
SELECT * 
FROM Employees
WHERE HireDate > '2023-12-01';

-- Find all departments where the ManagerID is not NULL and the department name contains "IT"
SELECT * 
FROM Departments
WHERE ManagerID IS NOT NULL AND DepartmentName LIKE 'IT%';

-- find employees whose last name has more than 6 characters.
SELECT FirstName, LastName
FROM Employees
WHERE LEN(LastName) > 6;

-- Find all attendance records where the date is within the last 7 days and the status is "Present."
SELECT *
FROM Attendance
WHERE Status = 'Present' AND 
		ADATE >= DATEADD(day, -7, GETDATE());

-- List all employees who were hired in either the "IT" or "Finance" department during the year 2023.
SELECT e.FirstName, d.DepartmentName, e.HireDate
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE DepartmentName = 'IT Department' OR DepartmentName = 'Finance' 
AND HireDate BETWEEN '2023-01-01' AND '2024-01-01';

-- find all employees whose EmployeeID is not in the list of employees who have recorded attendance.
SELECT e.FirstName, e.LastName
FROM Employees e
LEFT JOIN Attendance a
ON e.EmployeeID = a.EmployeeID
WHERE status IS NULL;

-- Find all projects that started before January 1, 2023, and have not yet ended.
SELECT ProjectName
FROM Projects
WHERE StartDate < '2023-01-01' AND 
(EndDate IS NULL OR EndDate > GETDATE());

-- Retrieve departments with less than 2 employees.
SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) < 2;

-- Write a query to find all employees who hold the job title of "QA Lead" or "PR Manager."
SELECT *
FROM Employees
WHERE Position = 'PR Manager' OR Position = 'QA Lead';

-- Retrieve all attendance records for employees that have a status of "Absent" in the month of October 2023.
SELECT e.FirstName, e.LastName, a.ADate, a.Status
FROM Employees e
LEFT JOIN Attendance a
ON e.EmployeeID = a.EmployeeID
WHERE a.Status = 'Absent' and a.ADATE BETWEEN '2023-10-01' AND '2023-11-01';


-- Find all employees whose salary is higher than the salary of the employee with EmployeeID = 7.
SELECT FirstName, Salary
FROM Employees
WHERE Salary > (SELECT Salary FROM Employees WHERE EmployeeID = 7);