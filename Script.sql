-- Create first table of teacher there is four columns techer_id is primary key
CREATE TABLE TEACHERS (
    teacher_id int not null unique,
    teacher_name varchar(255),
    course varchar(255),
    primary key(teacher_id)
);

--By this command we can view out table, Now our table is empty
select * from teachers 

--add record in teachers Table One by one

insert into teachers(teacher_id,teacher_name,course) values (1,'Sir Owais','Bootcamp_2020');
insert into teachers(teacher_id,teacher_name,course) values (2,'Sir Zia','Bootcamp_2021');
insert into teachers(teacher_id,teacher_name,course) values (3,'Sir qasim','Bootcamp_2020');
insert into teachers(teacher_id,teacher_name,course) values (5,'Sir Anees','Bootcamp_2020');
insert into teachers(teacher_id,teacher_name,course) values (4,'Sir Inam','Bootcamp_2020');

--again view teachers  table now the table has updated
select * from teachers 

--Create students table
create table STUDENTS (
student_id int not null unique,
student_name varchar(255),
teacher_id int not null,
primary key(student_id), --student_id is primary key
foreign key(teacher_id) references teachers(teacher_id)
);

--view student table it's empty
select * from students 

--adding rows in single command
insert into students values (3,'Danish',2),(4,'Hayat',1);

--Create course table there is some mistake in table name should be courses instead course
create table course (
course_id int not null unique,
course_name varchar(255),
primary key(course_id)
);

insert into course values (1,'Bootcamp2021'),(2,'AI');

--Now delete  course_id column from course table
alter table course drop column course_id;
alter table course add column course_id int ;

--view course table 
select * from students 

--course rating column has added in course table
alter table course add column course_rating int ;

--added couse_id column in teachers table

alter table teachers add column course_id int;

--updating table course
UPDATE course 
SET course_id = 2
WHERE course_name = 'AI';

UPDATE course 
SET course_id = 1
WHERE course_name = 'Bootcamp2021';

alter table course 
add primary key (course_id);

--Now add foreign key on course id
alter table teachers 
add foreign key (course_id) references course(course_id);


