USE EMS;

-- find all distinct first names of employees in the Employees table.
SELECT DISTINCT (FirstName) AS Name
FROM Employees;

-- Retrieve a list of distinct department names from the Departments table.
SELECT DISTINCT (DepartmentName) AS Departments
FROM Departments;

-- find all distinct salary amounts from the Salaries table.
SELECT DISTINCT(Amount) as salary
FROM Salaries;

-- Retrieve the distinct job titles from the Employees table.
SELECT DISTINCT(Position) AS job
FROM Employees;

-- Find all distinct hire dates of employees from the Employees table.
SELECT DISTINCT(HireDate) AS Date
FROM Employees;

-- Retrieve all distinct manager IDs from the Departments table.
SELECT DISTINCT(ManagerID) as ID
FROM Departments;

-- Find all distinct attendance statuses recorded in the Attendance table.
SELECT DISTINCT(Status) AS Status
FROM Attendance;

-- Retrieve all distinct manager IDs from the Departments table.
SELECT DISTINCT(ManagerID) AS Managerid
FROM Departments;

-- find distinct combinations of employee first and last names.
SELECT DISTINCT FirstName, LastName
FROM Employees;

--  Retrieve distinct positions held by employees within each department.
SELECT DISTINCT Position
FROM Employees;

-- Find all distinct project start dates from the Projects table.
SELECT DISTINCT StartDate
FROM Projects;

--  find distinct employee IDs from the Attendance table.
SELECT DISTINCT EmployeeID
FROM Attendance;

-- Retrieve distinct employees who have a salary of $50,000.
SELECT DISTINCT *
FROM Employees
WHERE Salary = 50000;

--  find distinct projects assigned to each department.
/* 
Currently, the schema does not have a relationship between departments and projects. 
To retrieve projects assigned to each department, we would need an additional table that 
links projects either directly to departments or indirectly through employees. Without 
such a link, SQL cannot establish a connection between departments and projects. 
*/

-- Retrieve distinct first and last names of Present employees.
SELECT DISTINCT e.Firstname, e.LastName
FROM Employees e 
LEFT JOIN Attendance a
ON e.EmployeeID = a.EmployeeID
WHERE a.Status = 'Present';

-- Find all distinct monthly salary amounts paid to employees in the Salaries table.
SELECT DISTINCT YEAR(EffectiveDate) AS Year,
				MONTH(EffectiveDate) AS Month,
				Amount AS MonthlySalary
FROM Salaries;

--   find distinct attendance records based on employee ID and date.
SELECT DISTINCT EmployeeID, Adate
FROM Attendance;
