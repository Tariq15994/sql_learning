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

--joining
select * from teachers t, students s, course c
where t.teacher_id = s.student_id and 
c.course_id = t.course_id 

--it will show you teacher_name from teachers table, course_rating from course table and all data columns from students table where teacher_id and stu

select t.teacher_name ,c.* from teachers t, course c
where c.course_id = t.course_id; 

insert into public.course (course_name,course_rating,course_id) values('IOT',5,3);

--INNER JOIN

SELECT c.*, t.* 
FROM course c 
INNER JOIN teachers t ON c.course_id =t.course_id ;


-- inner join --match the condition that we define after the ON show the data of both table where teacher_id is same
-- it resultaint is student_id , student_name  form s table and all the columns from teachers table

select s.student_name, s.student_id ,t.*  from students s inner join teachers t on t.teacher_id = s.teacher_id ;

--LEFT INNER JOIN 
-- here we will see that all columns of students (left)table and
-- those columns of teachers(right) table where teacher_id is similar to teacher_id of student table

select s.* from students s left join teachers t on t.teacher_id = s.teacher_id ;

-- RIGHT INNER JOIN
-- here we will see that all columns of teachers (right) table and
-- those columns of student (left) table where teacher_id is similar to teacher_id of teachers table
select t.*,s.* from students s right join teachers t on t.teacher_id = s.teacher_id ;


-- GROUP BY 
-- here we find that how mnay teachers teaching one course or any course order by teacher
select count(t.teacher_name) as teacher, t.course  from teachers t
group by course
order by teacher;







