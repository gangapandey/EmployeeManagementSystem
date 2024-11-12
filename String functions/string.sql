USE EMS;

-- Write a query to concatenate the first and last names of employees into a single full-name column.
SELECT FirstName + ' ' + LastName AS FullName
FROM Employees;

-- Write a query to find all employees whose first name contains the substring "John".
SELECT *
FROM Employees
WHERE FirstName LIKE '%John%';

-- Retrieve all employee last names converted to uppercase.
SELECT FirstName, UPPER(LastName) AS LastName
FROM Employees;

-- Write a query to retrieve all department names in lowercase.
SELECT DepartmentID, LOWER(DepartmentName) AS DName
FROM Departments;

-- Find the first three characters of each project name in the Projects table.
SELECT LEFT(ProjectName, 3) AS threechars
FROM Projects;

-- Write a query to retrieve employee names with any leading or trailing spaces removed.
SELECT TRIM(FirstName) as fn, TRIM(LastName) as ln
FROM Employees;

-- Calculate the length of each employee's full name (first and last name concatenated).
SELECT LEN(FirstName + ' ' + LastName) AS LengthStriign
FROM Employees;

-- Write a query to replace occurrences of "Sales" with "Marketing" in the job titles of employees.
SELECT REPLACE(Position, 'Sales', 'Marketing') AS updatedPos
FROM Employees
WHERE Position LIKE '%Sales%';

-- Find the position of the substring "Dev" in each employee's job title.
SELECT Position, CHARINDEX('Dev', Position) AS PositionOfDev
FROM Employees;

-- Write a query to count how many times the letter "e" appears in all employee first names.
SELECT SUM(LEN(FirstName) - LEN(REPLACE(FirstName, 'e', ' '))) +
		SUM(LEN(FirstName) - LEN(REPLACE(FirstName, 'E', ''))) AS TotalECount
FROM Employees;

-- Retrieve all employees whose first names start with the letter "A".
SELECT COUNT(FirstName)
FROM Employees
WHERE FirstName LIKE '%A%' OR FirstName Like '%a%';

-- Write a query to reverse the project names in the Projects table.
SELECT REVERSE(ProjectName) AS RevProjectName
FROM Projects;

-- Write a query to find employees whose last names are longer than 5 characters.
SELECT LastName
FROM Employees
WHERE LEN(LastName) > 5;

-- Write a query to format the hire date of employees as "DD-MM-YYYY".
SELECT FORMAT(HireDate, 'dd-MM-yyyy') AS FormmatedDate
FROM Employees;
