-- CASE statement : execute conditional logic in SQL Commands

use day3;
select * from myemp;

select 
     EMP_ID, JOB_ID,SALARY,
	 SALARY * 1.1 as REVISED_SALARY
FROM MYEMP;


# Problem Statements
/*
- increase salary by 10% for JOB_ID = 'AD_PRES'
- increase salary by 20% for JOB_ID = 'IT_PROG'
- keep salary for other JOB_IDs as it is.
*/

select 
	  EMP_ID,JOB_ID,DEP_ID,SALARY,
      case
		  when JOB_ID = 'AD_PRES' then salary*1.1
          when JOB_ID = 'IT_PROG' then salary*1.2
		  else salary
	  end as REVISED_SALARY      
from myemp ;


/*
- increase salary by 10% for JOB_ID = 'AD_PRES'
- increase salary by 20% for EMP_ID = 104
- keep other salaries as it is.
*/

select 
	  EMP_ID,JOB_ID,DEP_ID,SALARY,
      case
		  when JOB_ID = 'AD_PRES' then salary*1.1
          when EMP_ID = 104 then salary*1.2
		  else salary
	  end as REVISED_SALARY      
from myemp ;

/*
- display PAY_LEVEL for every employee as
- 'LOW'		: when SALARY is less than 10000
- 'MEDIUM'	: when SALARY is less than 20000
- 'HIGH'	: when SALARY is greater than or equals to 20000
*/

select 
	  EMP_ID,SALARY,
      case
		  when SALARY < 10000 then 'Low'
          when SALARY < 20000 then 'Medium'
		  else 'Higher'
	  end as PAY_LEVEL     
from myemp ;



/*
- Get details of employees from myemp table
- display the results in 
		1. Descending order of COMMISION_PCT for sales employees
		2. Descending order of SALARY for other employees
*/


















