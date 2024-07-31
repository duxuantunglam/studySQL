drop database zoo
create database zoo

use zoo

drop table zoo
create table zoo(
ID int identity not null,
animal char(30) not null,
numberOfPaw int default 4 not null,
ID_habitat int not null,
foreign key(ID_habitat) references habitat(ID_habitat),
lifeSpan int not null,
primary key(ID),
)

alter table zoo
add constraint min_lifeSpan check(lifeSpan > 10)

insert into zoo(animal, numberOfPaw, ID_habitat, lifeSpan)
values
('tiger', default, 1, 20),
('peacock', 2, 2, 20),
('elephant', 4, 3, 70),
('crocodile', 4, 4, 60),
('dinosaur', 4, 5, 100),
('lion', default, 6, 15),
('giraffe', 4, 7, 25),
('kingkong', 2, 8, 1000)

drop table habitat
create table habitat(
ID_habitat int identity,
habitat char(100) not null,
primary key(ID_habitat)
)

insert into habitat(habitat)
values
('forest, meadow'),
('meadow'),
('forest, meadow, savanna'),
('river, lake, swamp'),
('diversity (forest, meadow, savanna...)'),
('savanna, meadow'),
('savanna, meadow'),
('forest, meadow...')

select * from zoo

select * from zoo
join habitat on habitat.ID_habitat = zoo.ID_habitat

select count(numberOfPaw) as fourPaws from zoo
where numberOfPaw = 4

SELECT numberOfPaw, COUNT(*) AS animalCount
FROM zoo
GROUP BY numberOfPaw
ORDER BY numberOfPaw

select habitat, count(*) as animalCount from zoo
group by habitat

select habitat, avg(lifeSpan) as avgLifeSpan from zoo
group by habitat
order by avgLifeSpan desc

SELECT TOP 3 *
FROM zoo
ORDER BY lifeSpan DESC;
