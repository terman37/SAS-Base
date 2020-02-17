%let path=C:\Users\VM\Desktop\DSTI202002\2-LWPG2_001-Prog2\Data;
libname orion "&path";

*example1;
data work.sale_stats;
	set orion.orders_midyear;
	monthavg=round(mean(of month1-month6));
	monthmax=max(of month1-month6);
	monthsum=sum(of month1-month6);
	keep customer_id monthavg monthmax monthsum;
run;

title 'Statistics on months in which customer placed an order';
proc print data=work.sale_stats;

run;
title;

*example2;
data work.freqcustomers;
   set orion.orders_midyear;
   if n(of month1-month6) >= 5;
   /* Alternative: if nmiss(of month1-month6) <= 1; */
   Month_Median=median(of month1-month6);
   Month_Highest=largest(1,of month1-month6);
   Month_2ndHighest=largest(2,of month1-month6);
run;

title 'Month Statistics on Frequent Customers';
proc print data=work.freqcustomers noobs;
run;
title;
