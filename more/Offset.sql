USE EMS;

-- Retrieve the top 5 employees with the highest salaries.
SELECT TOP 5 *
FROM Employees
ORDER BY Salary DESC;

-- Find the most recent 10 attendance records for all employees.
SELECT TOP 10 *
FROM Attendance
ORDER BY ADATE DESC;

-- Write a query to retrieve only the first 3 departments from the Departments table.
SELECT TOP 3 *
FROM Departments;

-- Retrieve only the first 7 projects from the Projects table.
SELECT TOP 7 *
FROM Projects;

-- Find the top 4 employees in the "Developer" position based on salary.
SELECT TOP 4 *
FROM Employees
WHERE Position = 'Web Developer'
ORDER BY Salary ASC;

-- Write a query to retrieve employees starting from the 6th record onward, ordered by hire date.
SELECT *
FROM Employees
ORDER BY HireDate
OFFSET 6 Rows;

-- Find attendance records, skipping the first 5 and returning the next 10 records.
SELECT *
FROM Attendance
ORDER BY AttendanceID
OFFSET 5 ROWS
FETCH NEXT 10 ROWS ONLY;

-- Write a query to list projects starting from the 4th project onward, limited to 5 results.
SELECT *
FROM Projects
ORDER BY ProjectID
OFFSET 4 ROWS
FETCH NEXT 5 ROWS ONLY;

-- Find employees with salaries above $50,000, starting from the 3rd record.
SELECT *
FROM Employees
WHERE Salary > 50000
ORDER BY Salary
OFFSET 3 ROWS;

-- Write a query to retrieve the next 10 departments starting after the first 5.
SELECT *
FROM Departments
ORDER BY DepartmentID
OFFSET 5 ROWS
FETCH NEXT 10 ROWS ONLY;

-- Write a query to skip the first 10 attendance records and then return the next 5, ordered by date.
SELECT *
FROM Attendance
ORDER BY ADate
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY;

-- Retrieve employee names, starting from the 5th employee onward, ordered by last name.
SELECT FirstName, LastName
FROM Employees
ORDER BY LastName
OFFSET 5 ROWS;

-- Find employees in the "Sales" department, skipping the first 2 and returning the next 3 ordered by hire date.
SELECT e.FirstName, e.LastName, d.DepartmentName, e.HireDate
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales'
ORDER BY e.HireDate
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY;

-- Find employees in the "Manager" position, starting from the 3rd one, ordered by hire date.
SELECT *
FROM Employees
WHERE Position = 'Manager'
ORDER BY HireDate ASC
OFFSET 3 ROWS;

-- Write a query to find the top 10 distinct salary amounts ordered from highest to lowest.
SELECT DISTINCT TOP 10 Amount
FROM Salaries
ORDER BY Amount DESC;