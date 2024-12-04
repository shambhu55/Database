create database ems;
use ems;

create table dept(
id int primary key,
name varchar(30)
);

insert into dept values
(10,'IT'),
(20,'Sales'),
(30,'Accounts'),
(40,'Support'),
(50,'Purchase');


create table emp(
id int primary key,
fname varchar(30) not null,
lname varchar(30) not null,
salary double,
dept_id int,  
mgr_id int,
city varchar(20),
dob  date,
doj  date,
mobile varchar(10) unique not null,
email  varchar(30) unique not null,
foreign key(dept_id) references dept(id)
);

desc emp;
alter table emp add column gender char(1) default('M') check (gender in('M','F'));

alter table emp modify column dob date check (dob < sysdate());
alter table emp modify column doj date default (sysdate());

alter table emp drop column city;
alter table emp add column city varchar(20);

insert into emp (id,fname,lname,salary,mobile,email,dept_id) values
(1,'Amol','Kale',23000,'8149987651','amol@gmail.com',10),
(2,'Pradeep','Kale',23000,'8149987652','pradeep@gmail.com',10),
(3,'Sumit','Kale',53000,'8149987653','sumit@gmail.com',10),
(4,'Ameya','Kale',23000,'8149987654','ameya@gmail.com',20),
(5,'Virat','Kale',83000,'8149987655','virat@gmail.com',20),
(6,'Amol','Kale',23000,'8149987656','amol1@gmail.com',30),
(7,'Viru','Kale',43000,'8149987657','viru@gmail.com',30),
(8,'Amol','Kale',23000,'8149987658','amol2@gmail.com',40),
(9,'Mohan','Kale',63000,'8149987659','mohan@gmail.com',40),
(10,'Devansh','Kale',73000,'8149987650','devansh@gmail.com',50);

select *from emp;
delete from dept where id=10;		#error
update dept set id=11 where id=10;		#eroor
insert into emp (id,fname,lname,salary,mobile,email,dept_id) values
(11,'Sachin','Tendulkar',40000,'7149987651','sachin@gmail.com',70);		#error

select * from emp where dept_id=20;
select * from emp where salary>=10000 AND salary<=50000;
select * from emp where salary BETWEEN 10000 AND 50000;
select * from emp where dept_id=20 OR dept_id=30 OR dept_id=10;
select * from emp where dept_id in (10,20,30);

select dept_id from emp;
select distinct dept_id from emp;

select * from emp where fname like 'a%';
select * from emp where fname not like 'a%';
select * from emp where fname like '%n';

select count(id) from emp;
select count(mgr_id) from emp;
select sum(salary) from emp;
select min(salary) from emp;
select max(salary) from emp;
select avg(salary) from emp;

select dept_id,count(id),sum(salary),min(salary),max(salary),avg(salary) from emp group by dept_id;
select dept_id,count(id),sum(salary),min(salary),max(salary),avg(salary) from emp group by dept_id having max(salary)>50000;
select dept_id,count(id),sum(salary),min(salary),max(salary),avg(salary) from emp group by dept_id having max(salary)<50000;
select dept_id,count(id),sum(salary),min(salary),max(salary),avg(salary) from emp group by dept_id having count(id)=2;

##Self Join
update emp set mgr_id=2 where id>=7;
update emp set mgr_id=1 where id=5 or id=6;
update emp set mgr_id=3 where id=2;
update emp set mgr_id=8 where id=4;

select e.id, concat(e.fname,' ',e.lname) as emp_name,e.mgr_id,concat(m.fname,' ',m.lname) as mgr_name from emp e join emp m on e.mgr_id=m.id;