drop database pointOfStudents
create database pointOfStudents

use pointOfStudents

drop table point
create table point(
ID int identity,
fullname nvarchar(50) not null,
point1 float check(point1 >= 0 and point1 <= 10) default 5, 
point2 float check(point2 >= 0 and point2 <= 10),
primary key(ID)
)

insert into point(fullname, point1, point2)
values
(N'Dư Xuân Tùng Lâm', 8, 9.5),
(N'Phạm Tài Nguyên', null, 9.5),
(N'Nguyễn Thế Long', 8.5, 7.5),
(N'Phạm Hồng Cường', 10, 9),
(N'Tạ Quang Nhật', 7.5, 9)

select * from point

select * from point
where point1 > 9 or point2 > 9

select count(*) as pass from point
where point1 >= 5 or point2 >= 5