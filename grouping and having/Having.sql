USE EMS;

--Write a query to find departments that have an average salary greater than $60,000. 
SELECT d.DepartmentName, AVG(e.Salary) AS AvgSalary
FROM Departments d
JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
Having AVG(Salary) > 60000;

--Retrieve departments that have more than 3 employees working on projects.
SELECT  COUNT(d.DepartmentID) AS NOofdeparts, d.DepartmentName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
Group BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 3;

--Write a query to find positions where the total salary exceeds $100,000.
SELECT SUM(Salary) AS TotalSalary, Position
FROM Employees
GROUP BY Position
HAVING SUM(Salary) > 100000;

--Retrieve departments that have more than 5 employees.
SELECT D.DepartmentName
FROM Employees E
JOIN Departments D
ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(E.EmployeeID) > 5;

--Write a query to find employee statuses where the average attendance is less than 80%.
SELECT a.Status
FROM Employees e
JOIN Attendance a
ON e.EmployeeID = a.EmployeeID
GROUP BY a.Status
HAVING AVG(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) > 0.8;

--Retrieve employees who have more than 10 attendance records.
SELECT e.FirstName, COUNT(a.AttendanceID) AS NumberofRecords
FROM Employees e
JOIN Attendance a
ON e.EmployeeID = a.EmployeeID
GROUP BY e.EmployeeID, e.FirstName
HAVING COUNT(a.AttendanceID) > 10;

--Write a query to find departments that manage more than 5 projects.


--Find positions where the average salary is greater than $70,000.
SELECT Position
FROM Employees
GROUP BY Position
HAVING AVG(Salary) > 70000;

--Write a query to count projects in departments where the number of projects is more than 3.


--Retrieve positions where the number of employees is greater than 10.
SELECT Position
FROM Employees
GROUP BY Position
HAVING COUNT(EmployeeID) > 10;

--Write a query to find departments where the total salary is greater than the average salary across all departments.
SELECT SUM(e.Salary) AS TotalSalary, d.DepartmentName
FROM Departments d
JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING SUM(e.Salary) > (SELECT AVG(Salary) FROM Employees);

--Retrieve employees with attendance records greater than 15.
SELECT e.FirstName, COUNT(a.AttendanceID) AS Records
FROM Attendance a
JOIN Employees e
ON a.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName
HAVING COUNT(a.AttendanceID)  > 15;

--Write a query to find managers who oversee more than 2 projects.


--Find departments where the average salary of employees exceeds $80,000.
SELECT d.DepartmentName
FROM Departments d
JOIN Employees e
ON d.DepartmentID = e.EmployeeID
GROUP BY e.EmployeeID
HAVING AVG(e.Salary) > 60000;

--Write a query to find positions that have more than 5 employees earning above $60,000.
SELECT Position, COUNT(EmployeeID) AS Counts
FROM Employees
WHERE Salary > 60000
GROUP BY Position
HAVING COUNT(EmployeeID) > 5 ;




