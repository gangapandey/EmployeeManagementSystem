USE EMS;

-- Count the total number of employees in the Employees table.
SELECT COUNT(EmployeeID) As EmployeeCount
FROM Employees;

-- Find the number of distinct departments in the Departments table.
SELECT DISTINCT COUNT(DepartmentName) AS DepartName
FROM Departments;

-- Count how many employees have a status of "Absent"
SELECT COUNT(EmployeeID) AS AbsentEmployees
FROM Attendance
WHERE Status = 'Absent';

-- Retrieve the total number of attendance records in the Attendance table.
SELECT COUNT(EmployeeID) AS Records
FROM Attendance;

-- Write a query to count the number of employees in each department and group the results by DepartmentID.
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS numberOfEmployees
FROM Departments d
LEFT JOIN Employees e 
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

-- Count how many employees hold the position of "Developer."
SELECT COUNT(e.EmployeeID) AS numberOfDevelopers
FROM Employees e
WHERE e.Position = 'Sales';

-- Find the total number of records in the Salaries table.
SELECT COUNT(EmployeeID) AS totalRecords
FROM Salaries;

-- count the total number of projects in the Projects table.
SELECT COUNT(ProjectID) AS ProjectCount
FROM Projects;

-- count how many employees were hired each year.
SELECT YEAR(HireDate) AS HireYear, COUNT(EmployeeID) AS noOfEmp
FROM Employees
GROUP BY YEAR(HireDate)
ORDER BY HireYear;

-- Find the count of attendance records categorized by status (e.g., Present, Absent).
SELECT Status, COUNT(EmployeeID) AS NoOFEMP
FROM Attendance
Group By Status;

-- Write a query to count how many employees have a salary greater than $50,000.
SELECT Salary, COUNT(EmployeeID) AS EMPCOUNT
FROM Employees
WHERE Salary > 60000
GROUP BY Salary;
