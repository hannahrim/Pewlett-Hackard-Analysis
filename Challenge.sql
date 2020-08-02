--Challenge
--Number of [titles] retiring
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO ret_titles
FROM current_emp as ce
	INNER JOIN titles as ti
		ON (ce.emp_no=ti.emp_no)
ORDER BY ce.emp_no;


--Partition the data to show only most recent title per employee
SELECT emp_no,
	first_name, 
	last_name,
	to_date,
	title
INTO unique_titles
FROM (
	SELECT emp_no,
		first_name,
		last_name, 
		to_date,
		title, ROW_NUMBER() OVER
		(PARTITION BY (emp_no)
		ORDER BY to_date DESC) rn
		FROM ret_titles
		) tmp WHERE rn=1
ORDER BY emp_no;
SELECT * FROM unique_titles;


--Counting the number of employees per title
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

--Creating a list of employees eligible for the mentorship program
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no=de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no=ti.emp_no)
WHERE (de.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship;