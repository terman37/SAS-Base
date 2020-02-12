%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";


proc print data=orion.employee_payroll;
	format salary DOLLAR8. birth_date MMDDYY. employee_hire_date DATE9.;
	var employee_id salary birth_date employee_hire_date;
run;


title1 'US sales Employees';
title2 'Earning under $26,000';
proc print data=orion.sales split='+';
	var employee_id first_name last_name job_title salary hire_date;
	label first_name='first+name' last_name='last name' job_title='title' hire_date='date+hired';
	format salary DOLLAR10. hire_date MONYY7.;
	where salary<26000;
run;
title;
footnote;
