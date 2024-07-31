drop database zoo
create database zoo

use zoo

drop table Animals
create table Animals(
Animal_NumberID int identity not null,
Animal_Name nvarchar(20) not null unique,
Animal_Foot int not null default 0,
Animal_Habitat nvarchar(100) not null,
Animal_AvgLongevity int not null,
constraint CK_AnimalFoot check(Animal_Foot >= 0),
constraint CK_AnimalAvgAge check(Animal_AvgLongevity > 0),
primary key(Animal_NumberID)
)

insert into Animals(Animal_Name, Animal_Foot, Animal_Habitat, Animal_AvgLongevity) values
(N'Voi', 4, N'Thảo nguyên, rừng, sa mạc và đầm lầy', 65),
(N'Hổ', 4, N'Rừng', 9),
(N'Báo', 4, N'Rừng', 13),
(N'Sư Tử', 4, N'Rừng', 12),
(N'Đà Điểu', 2, N'Đồng cỏ, các khu vực thảm thực vật ...', 50),
(N'Kangaroo', 2, N'Các khu vực bằng phẳng, bên cạnh cây bụi và giữa những bụi cỏ', 15),
(N'Hươu cao cổ', 4, N'Những đồng cỏ thảo nguyên và các khu rừng cây', 24)

select * from Animals

select count(*) from Animals
where Animal_Foot = 4

select * from Animals
order by Animal_AvgLongevity desc
OFFSET 1 ROWS 
FETCH FIRST 3 ROWS ONLY;

drop table AnimalHabitat
create table AnimalHabitat(
Habitat_ID int identity,
HabitatName nvarchar(20) not null unique,
primary key(Habitat_ID)
)
insert into AnimalHabitat values
(N'Rừng'), (N'Đồng cỏ')
select * from AnimalHabitat

create table Animals(
Animal_NumberID int identity not null,
Animal_Name nvarchar(20) not null unique,
Animal_Foot int not null default 0,
HabitatID int not null,
Animal_AvgLongevity int not null,
constraint CK_AnimalFoot check(Animal_Foot >= 0),
constraint CK_AnimalAvgAge check(Animal_AvgLongevity > 0),
foreign key (HabitatID) references AnimalHabitat(Habitat_ID),
primary key(Animal_NumberID)
)
insert into Animals(Animal_Name, Animal_Foot, HabitatID, Animal_AvgLongevity) values
(N'Voi', 4, 1, 65),
(N'Hổ', 4, 1, 9),
(N'Báo', 4, 1, 13),
(N'Sư Tử', 4, 1, 12),
(N'Đà Điểu', 2, 2, 50),
(N'Kangaroo', 2, 2, 15),
(N'Hươu cao cổ', 4, 2, 24)
select * from Animals
join AnimalHabitat on AnimalHabitat.Habitat_ID = Animals.HabitatID
