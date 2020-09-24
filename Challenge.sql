-- new table containing employee number, first name, last name, title, from_date, salary
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	s.salary,
	de.from_date,
    de.to_date,
	titles.title
INTO near_retirement
FROM employees as e
	INNER JOIN salaries as s
		ON (e.emp_no = s.emp_no)
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles
		ON(e.emp_no = titles.emp_no )
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Partition the data to show only most recent title per employee
SELECT emp_no,
 		first_name,
 		last_name,
 		salary,
 		title,
		to_date
INTO near_retirement_titles
FROM
(SELECT nr.emp_no,
 		nr.first_name,
 		nr.last_name,
 		nr.salary,
 		nr.title,
 		nr.to_date,
  ROW_NUMBER() OVER
 (PARTITION BY (nr.emp_no) ORDER BY nr.to_date DESC) rn
 FROM near_retirement as nr
  )tmp WHERE rn = 1
ORDER BY emp_no;

--get total number for each title. this shows retire numbers by title
select count(emp_no), title
into title_totals
from near_retirement_titles
group by title
order by title;



--employee number, firstname, lastname, title, fromdate, todate as requested for mentorship program
select e.emp_no,
		e.first_name,
		e.last_name,
		titles.title,
		dept_emp.from_date,
		dept_emp.to_date
into mentor_program
from employees as e
inner join dept_emp
	on(e.emp_no = dept_emp.emp_no)
inner join titles
	on(e.emp_no = titles.emp_no)
where(birth_date between '1965-01-01' and '1965-12-31')
		
		
--find duplicates
SELECT
  first_name,
  last_name,
  count(*)
FROM mentor_program
GROUP BY
  first_name,
  last_name
HAVING count(*) > 1;


-- Partition the data to remove duplicates 
SELECT emp_no,
 		first_name,
 		last_name,
 		title,
		to_date
INTO mentor_program_2
FROM
(SELECT mp.emp_no,
 		mp.first_name,
 		mp.last_name,
 		mp.title,
 		mp.to_date,
  ROW_NUMBER() OVER
 (PARTITION BY (mp.emp_no) ORDER BY mp.to_date DESC) rn
 FROM mentor_program as mp
  )tmp WHERE rn = 1
ORDER BY emp_no;

--find duplicates if any 
SELECT
  first_name,
  last_name,
  count(*)
FROM mentor_program_2
GROUP BY
  first_name,
  last_name
HAVING count(*) > 1;
