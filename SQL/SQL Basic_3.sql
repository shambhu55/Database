create database school2;
use school2;

create table course(id int primary key, name varchar(30),price float);
insert into course values
(10,'Java',10000),
(20,'Web Programming',20000),
(30,'React',30000),
(40,'Angular',40000),
(50,'DevOps',50000),
(60,'.Net',60000);

create table student(id int primary key,name varchar(20), cid int);
drop table student;

create table student(
id int primary key,
name varchar(20), 
cid int,
foreign key (cid) references course(id)
);
drop table student;

create table student(
id int primary key,
name varchar(20), 
cid int,
foreign key (cid) references course(id) 
on delete cascade
on update cascade
);
drop table student;


create table student(
id int primary key,
name varchar(20), 
cid int,
foreign key (cid) references course(id) 
on delete set null
);

insert into student values
(1,'Amol',10),
(2,'Sachin',10),
(3,'Sumit',20),
(4,'Rajesh',30),
(5,'Devansh',30),
(6,'Sumit',40);

insert into student values(7,'Amol',90);
delete from course where id=10;
update course set id=90 where id=10;

select * from student;
select * from course;
select id,name,ifnull(cid,'Not enrolled for ny course') from student;
select id,name,coalesce(cid,'Not enrolled for ny course') from student;


select s.id,s.name,c.id,c.name,c.price from student s join course c on c.id=s.cid;
select s.id,s.name,c.id,c.name,c.price from student s inner join course c on c.id=s.cid;
select s.id,s.name,c.id,c.name,c.price from student s inner join course c where c.id=s.cid;

select s.id,s.name,c.id,c.name,c.price from student s left join course c on c.id=s.cid;
select s.id,s.name,c.id,c.name,c.price from student s left outer join course c on c.id=s.cid;

select s.id,s.name,c.id,c.name,c.price from student s right join course c on c.id=s.cid;
select s.id,s.name,c.id,c.name,c.price from student s right outer join course c on c.id=s.cid;

