USE EMS;

-- select all columns from the Employees table.
SELECT *
FROM Employees;

-- Retrieve only the FName and LName of all employees.
SELECT FirstName, LastName
FROM Employees;

-- Retrive all department names from the Department's table.
SELECT DepartmentName
FROM Departments;

-- Select all project names from the Projects table.
SELECT *
FROM Projects;

-- select all columns from the Attendance table.
SELECT *
FROM Attendance;

-- Retrieve the DepartmentID and DepartmentName for all departments.
SELECT DepartmentID, DepartmentName
FROM Departments;

-- List the first names of employees in the Employees table who have the position of "QA lead."
SELECT FirstName
FROM Employees
WHERE Position = 'QA Lead';

-- Select all records from the Salaries table where the amount is greater than $60,000.
SELECT *
FROM Salaries
WHERE Amount > 60000;
