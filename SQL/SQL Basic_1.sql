create database school;
use school;

create table student(
id int primary key,
f_name varchar(30),
l_name varchar(30),
dob date check(dob<sysdate()),
address text,
gender char(1) check( gender = 'M' or gender = 'F') default('M'),
standard int check(standard>=1 and standard<=10),
email varchar(50) unique,
mobile varchar(10) unique
);

insert into student values(1,'Shubham','Kadi', '2002-11-23','Nagpur', 'F', 10, 'xyz@gmail.com', '9765239517');
insert into student values(2,'Nehal','Kaikadi', '2000-11-24','Pune', 'F', 9, 'xyz00@gmail.com', '7755953518');
insert into student(id,f_name,l_name,mobile) values(3,'Vishal','Kale','1234567890');
insert into student(id,f_name,l_name,mobile,dob) values(4,'Rupesh','Supre','1234567891','2023-10-12');

select *from student;
select *from student where dob = null; 
select *from student where dob is null;
select *from student where dob is not null;

select * from student where f_name like 's%';
select * from student where f_name not like 's%';
select * from student where f_name like '%l';
select * from student where f_name not like '%l';

select * from student where f_name like '_u%';

select * from student where standard = 9 and standard = 10;
select * from student where standard = 9 or standard = 10;
select * from student where standard = 10 and email is null;
select * from student where standard is null and email is null;

select extract(year from sysdate());
select extract(month from sysdate());
select extract(day from sysdate());

select id,f_name,l_name,extract(year from dob) - extract(year from sysdate()) from student;
select id,f_name,l_name,extract(year from sysdate()) - extract(year from dob) as age from student;

insert into student(id,f_name,l_name,mobile,dob) values(5,'vishal','chaudhary','1234567897','1982-10-12');
insert into student(id,f_name,l_name,mobile,dob) values(6,'amol','johi','1234567899','1970-10-12');

select id,f_name,l_name,extract(year from sysdate()) - extract(year from dob) as age from student order by dob;
select id,f_name,l_name,extract(year from sysdate()) - extract(year from dob) as age from student order by dob desc;
select id,f_name,l_name,extract(year from sysdate()) - extract(year from dob) as age from student order by dob desc limit 2;


