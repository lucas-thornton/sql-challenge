--List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.first_name, e.last_name, e.sex, s.salary from employees as e
inner join salaries as s on 
e.emp_no = s.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date from employees
where hire_date between '1986-01-01' and '1986-12-31'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

create view Department_Managers as
select e.emp_no, e.first_name, e.last_name from employees as e
where emp_no in
(select emp_no from dept_manager
where dept_no in
(select dept_no from departments)
)

select dep.emp_no, dep.first_name, dep.last_name, dm.dept_no, d.dept_name from Department_Managers as dep
inner join dept_manager as dm on
dep.emp_no = dm.emp_no
inner join departments as d on
dm.dept_no = d.dept_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees
where first_name = 'Hercules' and
last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp_no, last_name, first_name from employees
where emp_no in
(select emp_no from dept_emp
where dept_no in
(select dept_no from departments
where dept_name = 'Sales'))


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp_no, last_name, first_name from employees
where emp_no in
(select emp_no from dept_emp
where dept_no in
(select dept_no from departments
where dept_name = 'Sales' or dept_name = 'Development')
)

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Count of Last Name" from employees
group by last_name
order by "Count of Last Name" desc
