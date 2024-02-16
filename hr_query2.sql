use hr_database
go 

--LISTA DI TUTTI I DIPENDENTI
select EMPLOYEE_ID
from EMPLOYEES;

--LISTA TUTTI I DIPARTIMENTI E LA LORO SEDE

select DEPARTMENTS.DEPARTMENT_ID,DEPARTMENTS.LOCATION_ID
from DEPARTMENTS;

--CONTA IL NUMERO DI DIPENDENTI PER DIPARTIMENTO
select count(EMPLOYEE_ID),DEPARTMENT_ID
from EMPLOYEES e
group by e.DEPARTMENT_ID

--TROVA IL SALARIO MEDIO
select avg(salary) as salary_med
from employees

--TROVA TUTTI I DIPENDENTI CHE GUADAGNANO PI� DI 10000
select EMPLOYEE_ID
from EMPLOYEEs
where salary>10000

--TROVA TUTTI I DIPENDENTI CHE HANNO LAVORATO IN PI� DI UN DIPARTIMENTO
select EMPLOYEE_ID,count(distinct DEPARTMENT_ID)
from JOB_HISTORY
group by EMPLOYEE_ID
having count(distinct DEPARTMENT_ID)>1
order by EMPLOYEE_ID desc

--TROVA IL DIPARTIMENTO CON IL SALARIO MEDIO PI� ALTO

select top(3) avg(salary) as med_salary,d.DEPARTMENT_NAME,d.DEPARTMENT_ID
from employees e
join DEPARTMENTS d on d.DEPARTMENT_ID=e.DEPARTMENT_ID
group by DEPARTMENT_NAME,d.DEPARTMENT_ID
order by med_salary desc

--TROVA TUTTI I DIPENDENTI CHE GUADAGNANO PI� DEL SALARIO MEDIO DEL LORO DIPARTIMENTO
with salaries as
(
select avg(salary) as med_salary,DEPARTMENT_ID as department
from employees e
group by e.DEPARTMENT_ID
)
select e.FIRST_NAME,e.LAST_NAME,avg(e1.SALARY)
from EMPLOYEES e
join EMPLOYEES e1 on e.DEPARTMENT_ID=e1.DEPARTMENT_ID
group by e.FIRST_NAME,e.LAST_NAME,e.SALARY
having e.SALARY>avg(e1.salary);

--TROVA TUTTI I DIPENDENTI CHE HANNO LO STESSO RUOLO DEL LORO MANAGER
select e.EMPLOYEE_ID,e.FIRST_NAME,e.LAST_NAME,e.JOB_ID
from EMPLOYEES e
inner join EMPLOYEES m on e.MANAGER_ID=m.EMPLOYEE_ID and e.JOB_ID=m.JOB_ID


