CREATE table Department (

departmentID INT IDENTITY(1,1) PRIMARY KEY,
departmentName varchar(200) NOT NULL,

);
GO

 Create table Employee (
	
	employeeID INT IDENTITY(1,1) PRIMARY KEY,
	employeeName varchar(200) NOT NULL,
	employeeExperience varchar(5)NOT NULL,
	employeeSalary  DECIMAL(19,4)NOT NULL,
	departmentID int,
	FOREIGN KEY (departmentID) REFERENCES Department(departmentID),
	CHECK (employeeSalary>0)
 );
 GO
 
 INSERT INTO Department VALUES('ASP_DOT_NET');
 INSERT INTO Employee VALUES('Akash',1,'500',1);
 INSERT INTO Employee VALUES('Karan',5,'5000',1);
 INSERT INTO Employee VALUES('Jainam',2,'3000',1);
 INSERT INTO Employee VALUES('khush',7,'8000',1);
 INSERT INTO Employee VALUES('Sundar',10,'500000',1);
 GO

 INSERT INTO Department VALUES('Dev_OPS');
 INSERT INTO Employee VALUES('shyam',5,'500000',2);
 INSERT INTO Employee VALUES('jay',4,'500000',2);
 INSERT INTO Employee VALUES('preyash',6,'500000',2);
 GO
 

 --Write a Query display empId,EmpName and DepartmentName

  select Employee.employeeID,Employee.employeeName,Department.departmentName from Employee INNER JOIN Department ON Employee.departmentID=Department.departmentID;
  GO

  --Write a Query to display department wise employee count
 select COUNT(Employee.employeeID) AS Total_Employee,Department.departmentName from Employee INNER JOIN Department ON Employee.departmentID=Department.departmentID GROUP BY Department.departmentName;
 GO

 --Write a Query to display department wise maximum salary
  select MAX(Employee.employeeSalary) AS maximum_salary ,Department.departmentName from Employee INNER JOIN Department ON Employee.departmentID=Department.departmentID GROUP BY Department.departmentName;
  GO

  --Write a Query to display employee name in the ascending order of department name
  select Employee.employeeName,Department.departmentName from Employee INNER JOIN Department ON Employee.departmentID=Department.departmentID ORDER BY Department.departmentName;
  Go

  SELECT employeeName, employeeExperience,
CASE
    WHEN employeeExperience > 10 THEN 'Grade is Expert'
    WHEN employeeExperience  BETWEEN 7 AND 10 THEN 'Grade is Advanced'
	WHEN employeeExperience  BETWEEN 5 AND 7 THEN 'Grade is Intermediate'
	WHEN employeeExperience  BETWEEN 2 AND 5 THEN 'Grade is Beginner'
    ELSE 'Grade is Noive'
END AS Grade
FROM Employee;
GO


