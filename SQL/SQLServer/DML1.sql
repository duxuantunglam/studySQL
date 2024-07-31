drop database quan_ly_sinh_vien
create database quan_ly_sinh_vien

use quan_ly_sinh_vien

drop table sinh_vien
create table sinh_vien(
ma int identity,
ten nvarchar(50),
ngay_sinh date,
gioi_tinh bit,
so_dien_thoai char(15),
primary key(ma)
)


insert into sinh_vien(ten,ngay_sinh,gioi_tinh,so_dien_thoai) 
values (N'Tuấn','2000-01-01',1,'0123456789'),(N'Long','2000-01-01',1,'0123456789')

select * from sinh_vien
where ten in ('Long',N'Tuấn')

delete from sinh_vien
where ma = 2


update sinh_vien
set
ten = 'Long'
where ma = 2