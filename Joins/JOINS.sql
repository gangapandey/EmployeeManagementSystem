USE EMS;

-- Write a query to retrieve all employees along with their department names using an inner join.
SELECT e.FirstName, e.LastName, e.Salary, d.DepartmentID, d.DepartmentName
FROM Departments d
JOIN Employees e
ON d.DepartmentID =  e.DepartmentID;

-- Find all employees and their salaries, including those without salary records, using a left join.
SELECT e.FirstName, e.LastName, e.Salary, s.Amount
FROM Employees e
LEFT JOIN Salaries s
ON e.EmployeeID = s.EmployeeID;

-- Write a query to get all departments and their corresponding employees, including departments without employees, using a right join.
SELECT d.DepartmentID, d.DepartmentName, e.FirstName, e.LastName, e.Position, e.Salary
FROM Employees e
RIGHT JOIN Departments d
ON d.DepartmentID =  e.DepartmentID;

-- Retrieve all employees and their attendance records, including employees without attendance and attendance records without corresponding employees, using a full outer join.
SELECT e.FirstName, e.LastName, e.Position, a.Status, a.ADate
FROM Employees e
FULL OUTER JOIN Attendance a
ON e.EmployeeID = a.EmployeeID;

-- Write a query to find pairs of employees who work in the same department using a self join on the Employees table.
SELECT e1.FirstName, e2.FirstName, e1.DepartmentID
FROM Employees e1
JOIN Employees e2
ON e1.DepartmentID = e2.DepartmentID
WHERE e1.EmployeeID < e2.EmployeeID; 

-- Retrieve a list of employees along with their attendance count using a join between the Employees and Attendance tables.
SELECT e.FirstName, e.LastName, e.Position, a.Status, a.ADate
FROM Employees e
JOIN Attendance a
ON e.EmployeeID = a.EmployeeID;

-- Write a query to find employees whose salaries are above the average salary using a join between the Employees and Salaries tables.
SELECT e.FirstName, s.Amount, s.EffectiveDate
FROM Employees e
JOIN Salaries s
ON e.EmployeeID = s.EmployeeID
WHERE s.Amount > (SELECT AVG(Amount) From Salaries);

-- Find all employees who are working on specific projects, retrieving employee names and project names.


-- Write a query to get all departments and the names of their respective managers using a join on the Employees table.
SELECT d.DepartmentName, d.ManagerID, e.FirstName AS ManagerName, e.Position
FROM Departments d
JOIN Employees e
ON d.ManagerID = e.EmployeeID;

-- Retrieve attendance records along with employee names using an inner join between Attendance and Employees.
SELECT e.FirstName, a.Status
FROM Employees e
Join Attendance a 
ON e.EmployeeID = a.EmployeeID;

-- Write a query to get all salaries and the project names for which the employees are working, including salaries with no project association.


-- Write a query to find all employees working on active projects by joining Employees and Projects tables.


-- Write a query that retrieves employee names, their salaries, and the department names in one result set using multiple joins.
SELECT e.FirstName, e.LastName, e.HireDate, e.Position, d.DepartmentName, d.ManagerID, s.Amount, s.EffectiveDate
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
JOIN Salaries s
ON e.EmployeeID = s.EmployeeID;

-- Write a query to find all employees who do not have a corresponding attendance record using an outer join.
SELECT e.FirstName, e.Position, a.Status
FROM Employees e
LEFT JOIN Attendance a
ON e.EmployeeID = a.EmployeeID
WHERE e.EmployeeID IS NULL;

