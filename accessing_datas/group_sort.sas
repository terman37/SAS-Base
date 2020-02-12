%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";

*proc sort does not produce a report;
*if out= is missing will sort in place;
proc sort data=orion.sales out=work.sorted;
	where salary <25500;
	by Country descending salary;
run;

*group by in print has to be in correct ascending order;
proc print data=work.sorted noobs; 
   by country;
   sum salary;
   var first_name last_name gender salary;
run;

proc sort data=orion.employee_payroll out=work.sort_salary;
	by employee_gender descending salary;
run;

proc print data=work.sort_salary noobs; 
	where employee_term_date is null and salary > 65000;
   	by employee_gender;
   	sum salary;
	var employee_id salary marital_status;
run;
