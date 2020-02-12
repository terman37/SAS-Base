%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";

* example1;
data work.increase;
   	set orion.staff;
   	where emp_hire_date >= '01JUL2010'd;
   	Increase=Salary*0.10;
   	NewSalary=Salary+Increase;
   	if increase>3000;
   	label employee_id='employee id' emp_hire_date='hire date' newsalary='new salary';
   	format salary newsalary DOLLAR10.2 increase COMMA5.;
   	keep employee_id emp_hire_date salary increase newsalary;
run;

proc contents data=work.increase;

run;

proc print data=work.increase split=' ';
run;

* example2;
data work.delays;
   	set orion.orders;
   	where delivery_date > order_date+4 and employee_id=99999999;
	order_month=month(order_date);
	if order_month=8;
	label order_date='date ordered' delivery_date='date delivered' order_month='month ordered';
   	format order_date delivery_date MMDDYY10.;
   	keep employee_id customer_id order_date delivery_date order_month;
run;

proc contents data=work.delays;

run;

proc print data=work.delays split=' ';
run;
