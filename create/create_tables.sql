USE EMS;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT NULL, -- This can be null initially
    HireDate DATE,
    Salary DECIMAL(18,2),
    Position NVARCHAR(50)
);


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(30),
    ManagerID INT NULL,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)  -- Foreign key reference to Employees
);


CREATE TABLE Salaries (
	SalaryID INT PRIMARY KEY IDENTITY(1,1),
	EmployeeID INT FOREIGN KEY REFERENCES Employees (EmployeeID),
	Amount DECIMAL(18, 2),
	EffectiveDate DATE
);


CREATE TABLE Projects (
	ProjectID INT PRIMARY KEY IDENTITY(1,1),
	ProjectName NVARCHAR(100),
	StartDate DATE,
	EndDate DATE
);


CREATE TABLE Attendance (
	AttendanceID INT PRIMARY KEY IDENTITY(1,1),
	EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
	ADate DATE,
	Status NVARCHAR(20)
);



