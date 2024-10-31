USE EMS;

-- Calculate the average salary of employees in the Salaries table.
SELECT AVG(Amount) AS avgsalary
FROM Salaries;

-- find the average salary for each job position in the Employees table.
SELECT Position, AVG(Salary) AS AvgSalary
FROM Employees
Group BY Position;

-- find the average number of attendance records per employee.
SELECT COUNT(ADate) / COUNT(DISTINCT E.EmployeeID) AS AvgAttendance
FROM Attendance A
RIGHT JOIN Employees E 
ON A.EmployeeID = E.EmployeeID;

-- Find the average salary of employees in the "HR" department.
SELECT AVG(Salary) AS AvgSalary
FROM Employees
WHERE Position = 'HR Manager';

-- Retrieve all employees whose salary is above the average salary of all employees.
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- calculate the average duration of all projects in days.
SELECT AVG(DATEDIFF(DAY, StartDate, EndDate)) AS AverageProjectDuration
FROM Projects
WHERE EndDate IS NOT NULL; 

-- Calculate the average number of days employees are present based on attendance records.
SELECT AVG(PresentDays) AS AvgPresentDays
FROM(
SELECT EmployeeID, COUNT(*) AS PresentDays
    FROM Attendance
    WHERE Status = 'Present'
    GROUP BY EmployeeID
) AS EmpAttendance;

-- Write a query to find the average salary of employees hired after January 1, 2023.
SELECT AVG(salary) AS Avgsalary
FROM Employees
WHERE Hiredate > '2023-01-01';
