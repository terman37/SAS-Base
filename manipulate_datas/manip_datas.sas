%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";

* example1;
data work.increase;
   set orion.staff;
	increase = salary*0.1;
	newsalary = sum(salary,increase);
	bdayqtr = qtr(birth_date);
	keep employee_id salary birth_date increase newsalary bdayqtr;
	format salary increase newsalary DOLLAR10.2;
	label employee_id='employee id' salary='empl annual salary' bdayqtr='bday qtr';
run;

proc print data=work.increase;
run;

* example2;
data work.birthday;
   set orion.customer;
	bday2012= mdy(month(birth_date),day(birth_date),2012);
	bdaydow2012 = weekday(bday2012);
	age2012 = (bday2012-birth_date)/365.25;
	keep customer_name birth_date bday2012 bdaydow2012 age2012;
	format bday2012 DATE9. age2012 COMMA3.0;
run;

proc print data=work.birthday;
run;

* example3;
data work.ordertype;
	set orion.orders;
	length method $ 10;
	if order_type=1 then
		method='retail';
	else if order_type=2 then
		method='Catalog';
	else if order_type=3 then
		method='Internet';
	else
		method='Unknown';
	keep order_id order_type method;
run;

proc print data=work.ordertype;
run;

* example4;
data work.region;
   set orion.supplier;
   length Region $ 17;
   if Country in ('CA','US') then do;
      Discount=0.10;
      DiscountType='Required';
      Region='North America';
   end;
   else do;
      Discount=0.05;
	   DiscountType='Optional';
      Region='Not North America';
   end;
   keep Supplier_Name Country Discount DiscountType Region;
run;

proc print data=work.region;
run;

* example5;
data work.season;
   	set orion.customer_dim;
   	length Promo $ 10 Promo2 $ 10;
	quarter=qtr(customer_birthdate);
   	if quarter=1 then
   		promo='Winter';
	else if quarter=2 then
   		promo='Spring';
	else if quarter=2 then
   		promo='Summer';
	else
		promo='Autumn';
	if 18<=customer_age<=25 then
		promo2='YA';
	else if customer_age>=65 then
		promo2='senior';
	else
		promo2=' ';
	keep customer_firstname customer_lastname customer_birthdate customer_age promo promo2;
run;

proc print data=work.season;
run;
