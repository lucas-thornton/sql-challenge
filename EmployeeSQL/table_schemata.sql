create table employees (
emp_no int,
emp_title_id varchar,
birth_date date,
first_name varchar,
last_name varchar,
sex	varchar,
hire_date date
)

create table dept_emp
(
emp_no int,
dept_no varchar
)

create table dept_manager
(
dept_no varchar,
emp_no int
)

create table departments
(
dept_no varchar,
dept_name varchar
)

create table titles
(
emp_title_id varchar,
title varchar
)

create table salaries
(
emp_no int,
salary int
)


select * from salaries