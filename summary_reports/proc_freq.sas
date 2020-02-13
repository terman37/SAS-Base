
%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";

*example1;
proc format;
   value Tiers 	low-25000='Tier1'
	         	25000<-50000='Tier2'
		     	50000<-100000='Tier3'
				100000<-high='Tier4';
run;

proc freq data=orion.sales;
  	tables Salary;
	format salary TIERS.;
run;

* example2;
title1 'Unique Customers and Salespersons for Retail Sales';
proc freq data=orion.orders nlevels;
   where Order_Type=1;
   tables Customer_ID Employee_ID / noprint;
run;
title;

title1 'Catalog and Internet Customers';
proc freq data=orion.orders order=freq;
   where Order_Type ne 1;
   tables Customer_ID / nocum;
run;
title;

* example3;
proc format;
   value ordertypes
      1='Retail'
      2='Catalog'
      3='Internet';
run;

title 'Order Summary by Year and Type';
proc freq data=orion.orders ;
   tables Order_Date;
   tables Order_Type / nocum;
   tables Order_Date*Order_Type / nopercent norow nocol;
   format Order_Date year4. Order_Type ordertypes.;
run;
title;
