%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";

* Read from SAS dataset;
data work.youngadult;
	set orion.customer_dim;
	where customer_gender='F' and 18<=customer_age<=36 and customer_group contains 'Gold';
	Discount=0.25;
run;

proc print data=work.youngadult split='*';
	id customer_id;
	label customer_age='customer*age' customer_gender='customer*gender';
	var customer_name customer_age customer_gender customer_group discount;
run;

* example2;
data work.assistant;
	set orion.staff;
	where job_title contains 'Assistant' and salary < 26000;
	increase= salary*0.10;
	new_salary = salary + increase;
run;

proc print data=work.assistant split='*';
	id employee_id;
	var job_title salary increase new_salary;
	format salary increase new_salary DOLLAR10.2;
run;
