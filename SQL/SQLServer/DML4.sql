drop database employees
create database employees

use employees

drop table employeesSalary
create table employeesSalary(
ID int identity not null,
fullname nvarchar(50) not null,
age int not null,
sex char(10) default 'Female',
job char(20),
startDate date default getDate(),
salary float not null,
primary key(ID),
)

alter table employeesSalary
add constraint salary_min check(salary > 0)

alter table employeesSalary
add constraint name_lenght check(len(fullname) >= 2)

alter table employeesSalary
add constraint age_min check(age > 18)

alter table employeesSalary
add constraint check_job check(job = 'IT' or job = 'business' or job = 'teacher')

insert into employeesSalary(fullname, sex, age, job, startDate, salary)
values
(N'Dư Xuân Tùng Lâm', 'Male', 19, 'IT', default, 6.6),
(N'Nguyễn Thế Long', 'Male', 19, 'teacher', '2023/10/18', 7.5),
(N'Phạm Tài Nguyên', 'Male', 19, 'IT', '2023/3/13', 7.0),
(N'Phạm Hồng Cường', default, 19, 'business', '2023/1/15', 6.0),
(N'Nguyễn Hữu Khánh Toàn', 'Male', 19, 'teacher', '2022/5/15', 7.0),
(N'Tạ Quang Nhật', 'Male', 19, 'IT', '2024/2/23', 6.5),
(N'Nguyễn Hoàng Lưu', 'Male', 19, 'teacher', '2023/8/18', 9.0)

select * from employeesSalary

update employeesSalary
set startDate = default
where fullname like N'%Lưu%'

update employeesSalary
set salary = salary + 1
where MONTH(getDate()) = 7

delete from employeesSalary
where salary < 7

select sum(salary) as total_sal_per_month from employeesSalary

select sum(salary) as total_sal_per_month from employeesSalary
group by job

select job, sum(salary) as total_sal_per_month from employeesSalary
group by job

select job, avg(salary) as total_sal_per_month from employeesSalary
group by job

select * from employeesSalary
where DATEDIFF(day, startDate, getDate()) = 0

select * from employeesSalary
where startDate = cast(getDate() as date)

select * from employeesSalary
order by startDate asc
offset 3 rows
fetch next 2 rows only