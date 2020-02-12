%let path=C:\Users\VM\Desktop\DSTI202002\1-LWPG1_001-Prog1\Data;
libname orion "&path";

data work.subset;
	length 	employee_id 8
			first_name $ 12
			last_name $ 18
			gender $ 1
			salary 8
			job_title $ 25
			country $ 2;
	infile "&path\sales.csv" dlm=',';
	input 	employee_id 
			first_name
			last_name
			gender
			salary
			job_title
			country;

run;

proc contents data=work.subset varnum;

run;

proc print data=work.subset noobs;

run;
