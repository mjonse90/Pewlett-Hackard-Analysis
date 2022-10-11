/* Deliverable 1: Number of Retiring Employees by Title
   Create a Retirement Titles table
   Contains all titles of employees born between 1952-01-01 and 12-31-1955
   133776 records
*/
select e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
into       retirement_titles
from       employees as e
inner join titles    as t
on         (e.emp_no = t.emp_no)
where (birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no

select distinct on (title, emp_no, to_date)
       emp_no,
       first_name,
       last_name,
       title
into unique_titles
from retirement_titles
where to_date = '9999-01-01'
order by emp_no,
         to_date desc
 
select count(*),
       title
into retiring_titles
from unique_titles
group by title
order by 1 desc

/* Deliverable 2: Employees Eligible for Mentorship Program
   Create mentorship-eligibility table, contains current employees born between 1965-01-01 and 1965-12-31
   1549 records
*/
select distinct on (e.emp_no)
       e.emp_no,
       e.first_name,
       e.last_name,
       e.birth_date,
       de.from_date,
       de.to_date,
       t.title
into mentorship_eligibilty
from       employees as e
inner join dept_emps as de
on         e.emp_no = de.emp_no
inner join titles as t
on         e.emp_no = t.emp_no
where (e.birth_date between '1965-01-01' and '1965-12-31')
and   (de.to_date = '9999-01-01')
order by e.emp_no