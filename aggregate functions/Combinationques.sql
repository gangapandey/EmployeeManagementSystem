USE EMS;
-- Write a query to count the number of employees and also calculate the average salary.
SELECT COUNT(EmployeeID) AS EmployeeCount, AVG(Salary) AS AvgSalaray
FROM Employees;

-- Write a query that retrieves each department's name, the total number of employees, and the total salary paid to those employees.
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS TotalEmployee, SUM(e.Salary) AS TotalSalary
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- Write a query to count how many employees have a salary greater than $60,000 and also sum their total salaries.
SELECT COUNT(EmployeeID) AS EmpCount, SUM(Salary) AS TotalSalary
FROM Employees
WHERE Salary > 60000;

-- Find the count of attendance records where the status is "Present" and also calculate the average attendance for all employees.
SELECT COUNT(CASE WHEN Status = 'Present' THEN 1 END) AS PresentEMp, AVG(AttendanceID)
FROM Attendance;

-- Write a query to sum the salaries of employees in each department and count the number of employees in each department.
SELECT d.DepartmentName, SUM(e.Salary) AS Totalsalary, COUNT(e.EmployeeID) AS EmpCount
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- Count how many employees have a salary greater than the average salary in the company.
SELECT COUNT(EmployeeID) AS EmpCount
FROM Employees
WHERE Salary > (SELECT AVG(Salary)
FROM Employees);

-- Calculate the average salary of employees who are marked as "Present" and also count how many employees meet this criteria in a single query.
SELECT 
    AVG(e.Salary) AS AvgSalary,
    COUNT(e.EmployeeID) AS EmpCount
FROM Employees e
JOIN Attendance a 
ON e.EmployeeID = a.EmployeeID
WHERE a.Status = 'Present';

