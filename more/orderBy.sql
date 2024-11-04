USE EMS;

--  retrieve all employees ordered by their last names in ascending order.
SELECT FirstName, LastName
FROM Employees
ORDER BY Lastname;

-- Find all salaries from the Salaries table ordered from highest to lowest.
SELECT Amount
FROM Salaries
ORDER BY Amount DESC; 

-- Write a query to order departments by ManagerID in descending order
SELECT DepartmentID, DepartmentName, ManagerID
FROM Departments
ORDER BY ManagerID DESC;

-- Retrieve all projects ordered by their start date in ascending order.
SELECT ProjectName, StartDate, EndDate
FROM Projects
ORDER BY StartDate ASC;

-- list all employees ordered by their hire date from the most recent to the oldest.
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employees
ORDER BY HireDate DESC;

-- Find all attendance records ordered by status first and then by date in ascending order.
SELECT *
FROM Attendance
ORDER BY Status, ADate ASC;

-- Write a query to order employees by their salary in ascending order.
SELECT FirstName, LastName, Salary, Position
FROM Employees
ORDER BY Salary ASC;

-- Retrieve all projects ordered by their end date in descending order.
SELECT ProjectName, StartDate, EndDate
FROM Projects
ORDER BY EndDate DESC;

-- Write a query to find distinct job positions ordered alphabetically.
SELECT DISTINCT Position
FROM Employees
ORDER BY Position ASC;

-- Retrieve all employees ordered by their salary, placing employees with NULL salaries at the end.
SELECT *
FROM Employees
ORDER BY CASE WHEN Salary IS NULL THEN 1 ELSE 0 END,
			Salary ASC;

-- Retrieve the top 10 highest-paid employees, ordered by salary in descending order.
SELECT TOP 10 *
FROM Employees
ORDER BY Salary DESC;

-- Find the first 3 departments ordered by their DepartmentName in ascending order.
SELECT TOP 3 *
FROM Departments
ORDER BY DepartmentName ASC;

-- Write a query to retrieve the top 5 longest-duration projects ordered by their duration in descending order.
SELECT TOP 5 ProjectName, DATEDIFF(DAY, StartDate, EndDate) AS Duration
FROM Projects
ORDER BY Duration DESC;

-- Write a query to find the top 3 highest-paid employees in each department ordered by salary.
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Salary,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    e.EmployeeID IN (
        SELECT EmployeeID
        FROM (
            SELECT 
                EmployeeID,
                DepartmentID,
                Salary,
                ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
            FROM 
                Employees
        ) AS Ranked
        WHERE SalaryRank <= 3
    )
ORDER BY 
    d.DepartmentID, e.Salary DESC;




-- Retrieve the 5 most recently completed projects ordered by their completion date.
SELECT TOP 5 ProjectName
FROM Projects
ORDER BY EndDate DESC;

