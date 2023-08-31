drop table departments;
CREATE TABLE departments (
	dept_no varchar not null,
	dept_name varchar not null,
	primary key (dept_no)
);

drop table dept_emp;
CREATE TABLE dept_emp (
	emp_no int not null,
	dept_no varchar not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no)
);

drop table dept_manager;
CREATE TABLE dept_manager (
	dept_no varchar not null,
	emp_no int not null,
	primary key (emp_no, dept_no)
);

drop table employees;
CREATE TABLE employees (
	emp_no int not null,
	emp_title_id varchar not null,
	birth_date varchar not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date date not null,
	primary key (emp_no)
);

drop table salaries;
CREATE TABLE salaries (
	emp_no int not null,
	salary int not null,
	primary key (emp_no),
	foreign key (emp_no) references employees (emp_no)
);

drop table titles;
CREATE TABLE titles (
	title_id varchar not null,
	title varchar not null,
	primary key (title_id)
);


SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

--List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
inner join salaries on 
employees.emp_no=salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
select employees.first_name, employees.last_name, employees.hire_date
from employees
where 
	hire_date between '01/01/1986' and '12/31/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dept_manager.dept_no, departments.dept_name,  employees.emp_no, employees.last_name, employees.first_name
from dept_manager
inner join departments on
dept_manager.dept_no = departments.dept_no
inner join employees on
dept_manager.emp_no = employees.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
inner join departments on
dept_emp.dept_no = departments.dept_no
inner join employees on
dept_emp.emp_no = employees.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select employees.first_name, employees.last_name, employees.sex
from employees
where 
	first_name = 'Hercules'
	and last_name like 'B%';
	
--List each employee in the Sales department, including their employee number, last name, and first name.
select employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
where dept_no = 'd007';

--XList each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name, 
from dept_emp
inner join departments on dept_emp.dept_no = departments.dept_no
inner join employees on dept_emp.emp_no = employees.emp_no;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as "Last Name Counts"
from employees
group by last_name 
order by last_name desc;