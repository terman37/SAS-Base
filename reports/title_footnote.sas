%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";

title1 'Australian Sales Employees';
title2 'Senior Sales Representatives';
footnote1 'Job Title: Sales Rep. IV';

proc print data=orion.sales noobs;
	where Country='AU' and Job_Title contains 'Rep. IV';
	var employee_id first_name last_name gender salary;
run;

title;
footnote;
