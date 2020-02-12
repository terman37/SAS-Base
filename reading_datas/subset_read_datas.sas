%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";

data work.increase;
   set orion.staff;
   Increase=Salary*0.10;
   NewSalary=Salary+Increase;
run;

proc print data=work.increase;
run;
