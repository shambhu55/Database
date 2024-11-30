# UMS - SQL Activity1

use ums;

# Problem # 1 Creating Tables

create table student_info_pc(
reg_number varchar(15) primary key,
student_name varchar(30) not null,
branch varchar(30),
contact_number varchar(10),
date_of_birth date not null,
date_of_joining date default (sysdate()),
address varchar(250),
email_id varchar(250)
);

create table subject_master_pc(
subject_code varchar(10) primary key,
subject_name varchar(30) not null,
weightage int not null
);

create table student_marks_pc(
reg_number varchar(15),
subject_code varchar(10),
semester int not null,
marks int default (0),
foreign key(reg_number) references student_info_pc(reg_number),
foreign key(subject_code) references subject_master_pc(subject_code)
);

create table student_result_pc(
reg_number varchar(15),
semester int not null,
gpa int not null,
is_eligible_scholarship char(3) default('yes'),
foreign key(reg_number) references student_info_pc(reg_number),
primary key(reg_number,semester)
);

# Problem # 2 Working with constraints:
# a)
alter table subject_master_pc modify column subject_name varchar(30) not null unique;

# b)
alter table student_info_pc modify column contact_number varchar(10) not null unique;
alter table student_info_pc add constraint contact_uniqe unique (contact_number);

#c)
alter table student_info_pc add constraint dob_check check (date_of_birth<date_of_joining);

#d)
ALTER TABLE student_marks_pc  ADD CONSTRAINT mark_checking check(marks<=100);

#e)
alter table student_result_pc add constraint gpa_chk check (gpa>=1 and gpa<=10);

#f)
alter table student_result_pc modify column is_eligible_scholarship char constraint eligibity_check check (is_eligibility_check in ('Y','N'))  default ('Y');


#Problem # 3  Loading tables using DML: 




