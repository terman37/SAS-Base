
*proc sort does not produce a report;
*if out= is missing will sort in place;
proc sort data=orion.sales out=work.sorted;
   by Country descending salary;
run;

*group by in print has to be in correct ascending order;
proc print data=work.sorted noobs; 
   by country;
   sum salary;
   var first_name last_name gender salary;
run;
