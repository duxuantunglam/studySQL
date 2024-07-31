drop database customers
create database customers

use customers

drop table information
create table information(
ID int identity,
fullname nvarchar(50) not null,
phoneNumbers char(15) unique not null,
addresss char(10) not null,
sex char(6) not null,
dateOfBirth date not null,
primary key(ID)
)

insert into information(fullname, phoneNumbers, addresss, sex, dateOfBirth)
values
(N'Dư Xuân Tùng Lâm', '0399783954', 'BKA', 'Male', '2002-03-26'),
(N'Nguyễn Thế Long', '0941139586', 'KMA', 'Male', '2002-10-18'),
(N'Phạm Hồng Cường', '0942617669', 'NEU', 'Female', '2003-01-15'),
(N'Phạm Tài Nguyên', '0941269725', 'KMA', 'Male', '2002-03-13'),
(N'Phạm Việt Mạnh', '0123654789', 'AOF', 'Female', '2002-04-23')

select * from information

select fullname, phoneNumbers from information

update information
set fullname = N'Nguyễn Thế Long (Long Thành)'
where ID = 2

delete from information
where ID > 3 and sex = 'Male'

select * from information
where sex = 'Female' and month(dateOfBirth) = 1

select * from information
where sex = 'female' and year(dateOfBirth) < 2003

select * from information
where year(getdate()) - year(dateOfBirth) > 19

select * from information where fullname like '%X%'