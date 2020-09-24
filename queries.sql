
-- retirement eligibility 
select first_name, last_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31')


select * from retirement_info;

-- joining departments and dept_manager tables
select d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no;

--joining retirement_info and dept_emp tables
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no;


--joining retirement_info and dept_emp
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01')


--employee count by department number
select count(ce.emp_no), de.dept_no
into employees_per_dept
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;