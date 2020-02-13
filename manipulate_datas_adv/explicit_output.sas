%let path=C:\Users\VM\Desktop\DSTI202002\2-LWPG2_001-Prog2\Data;
libname orion "&path";

* example1;
data work.price_increase;
   set orion.prices;
   year=1;
   unit_price = unit_price * factor;
   output;
   year=2;
   unit_price = unit_price * factor;
   output;
   year=3;
   unit_price = unit_price * factor;
   output;
run;
proc print data=work.price_increase;
 	var Product_ID Unit_Price Year;
run;

* example2;
data work.extended;
   set orion.discount;
   drop unit_sales_price;
   where Start_Date='01dec2011'd;
   Promotion='Happy Holidays';
   Season='Winter';
   output;
   Start_Date='01jul2012'd;
   End_Date='31jul2012'd;
   Season='Summer';
   output;
run;

title 'All discount ranges with the Happy Holidays promotion';
proc print data=work.extended;
run;
title;

* example3;
data work.admin work.stock work.purchasing;
   set orion.employee_organization;
   select (Department);
      when ('Administration') output work.admin;
      when ('Stock & Shipping') output work.stock;
	  when ('Purchasing') output work.purchasing;
	  otherwise;
   end;
run;

title 'Administration Employees';
proc print data=work.admin;
run;
title;

title 'Stock and Shipping Employees';
proc print data=work.stock;
run;
title;

title 'Purchasing Employees';
proc print data=work.purchasing;
run;
title;

* example4;
data work.fast work.slow work.veryslow;
   set orion.orders;
   where Order_Type in (2,3);
   /* There are several correct ways to write this WHERE statement */
   ShipDays=Delivery_Date-Order_Date;
   if ShipDays<3 then output work.fast;
   else if 5<=ShipDays<=7 then output work.slow;
   else if ShipDays>7 then output work.veryslow;
   drop Employee_ID;
run;

title 'Orders taking more than 7 days to deliver';
proc print data=work.veryslow;
run;
title;
