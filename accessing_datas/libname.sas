
%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;

libname orion "&path";

proc contents data=orion._all_ nods; 
* _ALL_ all details in library
* NODS no details;
run;

proc print data=orion.sales;
run;

libname orion clear;
