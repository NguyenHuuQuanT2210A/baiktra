IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example')
DROP DATABASE EmployeeDB
CREATE DATABASE EmployeeDB
use EmployeeDB

CREATE TABLE Department (
DepartID int Primary key,
DepartName varchar(50) not null,
Description varchar(100) not null
)

CREATE TABLE Employee (
EmpCode char(6) Primary key,
FirstName varchar(30) not null,
LastName varchar(30) not null,
Birthday smalldatetime not null,
Gender Bit Default 1,
Address varchar(100),
DepartID int,
Salary Money,
Constraint FK_ED foreign key(DepartID) references Department(DepartID)
)
insert into Department values(1, 'Accountant','Paid to employees'),
(2, 'Management','Employee manager'),
(3, 'Recruitment','Recruiting new employees')
insert into Employee values
(123, 'Huu','Quan','2004-12-24',1,'Ha Noi', 2, 20.000000),
(234, 'Dung','Manh','2000-10-15',1,'Tuyen Quang', 3, 15.000000),
(345, 'Minh','Ngoc','2002-05-06', 2, 'Hai Phong',1,12.000000)

Update Employee Set Salary = Salary + (Salary * 10/100)

Alter table Employee add constraint salary check (Salary > 0)

create trigger tg_chkBirthday on Employee for update as
begin 
update  Birthday = Birthday + (Birthday * 1999/2023)
end

create nonclustered index IX_DepartmentName on Department(DepartName)

create view employeeeeee as
select EmpCode, FirstName + LastName as Fullname, DepartName from Employee
inner join Department on Employee.DepartID = Department.DepartID

select * from employeeeeee
