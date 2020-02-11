%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;

libname orion "&path";

proc print data=orion.sales;
	*var Last_Name First_Name Salary;
	sum Salary;
run;

proc print data=orion.sales noobs;
	*NOOBS - Do Not display observation column;
	var 
		Last_Name 
		First_Name 
		Salary 
		Hire_Date
		Job_title
		;
	where 
		26000<salary<35500 
		and gender='M' 
		& Hire_Date > '01FEB1995'd 
		and country in ('AU','US')
		and Job_Title contains 'Rep'
		and Last_name between 'A' and 'L'
		and (job_title like '%II' or job_title like '%IV')
		;
run;

proc print data=orion.customer_dim;
	where customer_age=21;
	id customer_id;
	var
		customer_id
		customer_name
		customer_gender
		customer_group
		customer_age_group;
run;

proc print data=orion.order_fact noobs;
	sum Total_Retail_Price;
	where total_retail_price > 500;
	id customer_id;
	var order_id order_type quantity total_retail_price;
run;

proc print data=orion.customer_dim noobs;
	where 30<=customer_age<=40;
	id customer_id;
	var customer_name customer_age customer_type;
run;

