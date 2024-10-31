USE EMS;

-- Calculate the total salary paid to all employees in the Salaries table.
SELECT SUM(Salary) AS TotalSalary
FROM Employees;

-- sum the attendance status where "Present" is valued at 1 and "Absent" at 0.
SELECT SUM(
			CASE 
				WHEN Status = 'Present' THEN 1
				ELSE 0
				END) AS AttendanceStatus
FROM Attendance;

-- Find the total salary paid to employees in the "Sales" department.
SELECT SUM(Salary) AS AvgSalary
FROM Employees
WHERE Position = 'Sales Manager';

-- What is the total salary expense for all employees?
SELECT SUM(Salary) AS totalsalary
FROM Employees;

-- Calculate the total salaries paid to employees in the QA Lead..
SELECT SUM(Salary) AS Avgsalary
FROM Employees
WHERE Position = 'QA Lead';

-- If each attendance record represents a day, write a query to sum the total days present for each employee.
SELECT EmployeeID, 
		SUM ( CASE
				WHEN Status = 'Present' THEN 1
				ELSE 0
				END) AS totalDayPresent
FROM Attendance
GROUP BY EmployeeID;

-- Calculate the total salary for employees whose salary is above a certain threshold.
SELECT SUM(Salary) AS TotalHighSalaries
FROM Employees
WHERE Salary > 50000;

-- Calculate the total number of present days for each department.
SELECT d.DepartmentName, SUM(CASE
								WHEN a.status = 'Present' THEN 1
								ELSE 0
								END) AS PresentDaysSum
FROM Attendance a
LEFT JOIN Employees e
ON a.EmployeeID = e.EmployeeID
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- Calculate the total salary for employees in the "Sales" department with a salary above 30000.
SELECT SUM(Salary) AS AvgSal 
FROM Employees
WHERE Position = 'Sales Manager' AND Salary > 30000; 

-- Calculate the total salary paid to employees in the year 2023.
SELECT SUM(Salary) AS TotaLSalaryPaid
FROM Employees
WHERE HireDate >= '2023-01-01' AND HireDate < '2024-01-01';

-- Calculate the total salary for employees in the "Sales" department and the "Finance" position.
SELECT SUM(e.Salary) AS TotaLSalaryPaid
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' OR d.DepartmentName = 'Finance';
