%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";

data Q1Birthdays;
   set orion.employee_payroll;
   BirthMonth=month(Birth_Date);
   if BirthMonth le 3;
run;

proc format;
	value $GENDER 	'F'='Female'                  
	              	'M'='Male' 
				  	other = 'Invalid';

	value MNAME 	1='January'                  
	            	2='February' 
					3='March';

	value SALRANGE 	20000-<100000='Below 100000'                  
					100000-<500000='100000 or more'
					.='Missing'
					other='invalid';
run;

title 'emplyees with birthdays in Q1';
proc print data=work.Q1Birthdays split="*";
	label birthmonth="birth*month";
	var employee_id employee_gender birthmonth salary;
   	format Employee_gender $GENDER. BirthMonth MNAME. salary SALRANGE.;
run;
title;



