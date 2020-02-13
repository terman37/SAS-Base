%let path=C:\Users\VM\Desktop\DSTI202002\2-LWPG2_001-Prog2\Data;
libname orion "&path";

* example1;
data work.codes;
  set orion.au_salesforce;
  length FCode1 FCode2 $ 1 LCode $ 4;
  FCode1=lowcase(substr(First_Name,1,1));
  FCode2=substr(First_Name,length(First_Name),1);
  LCode=lowcase(substr(Last_Name,1,4));
run;

title 'Extracted Letters for User IDs';
proc print data=work.codes;
  var First_Name FCode1 FCode2 Last_Name LCode;
run;
title;

*example2;
data work.small;
  set orion.newcompetitors;
  Country = substr(ID,1,2);
  Store_Code=left(substr(ID,3));
  if substr(Store_Code,1,1) = '1';
  City=propcase(City);
run;

title 'New Small-Store Competitors';
proc print data=work.small noobs;
   var Store_Code Country City Postal_Code;
run;
title;

* example3;
data names;
   length New_Name $50 
          FMnames $30
          Last $30;
   set orion.customers_ex5;
   FMnames = scan(Name,2,',');
   Last = propcase(scan(Name,1,','));
	if Gender="F" then New_Name=CATX(' ','Ms.',FMNames,Last);
	else if Gender="M" then New_Name=CATX(' ','Mr.',FMNames,Last);
	keep New_Name Name Gender;
run;

proc print ;
run;

*example4;
  /* Part A */
data work.split;
   set orion.employee_donations (obs=10);
   PctLoc=find(Recipients,'%');
   /* Position in which the first '%' occurs */
   if PctLoc > 0 then do;
      Charity=substr(Recipients,1,PctLoc);
	   output;
	   Charity=substr(Recipients,PctLoc+3);
	   output;
   end;
   /* If '%' was found, then there's more than one recipient */
   /* Use PctLoc+3 for the '%, ' before the second charity */
   else do;
      Charity=trim(Recipients)!!' 100%';
	   output;
   end;
   drop PctLoc Recipients;
run;

proc print data=work.split noobs;
   var Employee_ID Charity;
run;

  /* Part B */
data work.split;
   set orion.employee_donations;
   PctLoc=find(Recipients,'%');
   /* Position in which the first '%' occurs */
   if PctLoc > 0 then do;
      Charity=scan(Recipients,1,'%')!!'%';
      output;
      Charity=substr(scan(Recipients,2,'%')!!'%',3);
      output;
   end;
   /* Since '%' is the delimiter, we must concatenate
      a '%' to the character string after the SCAN */
   else do;
      Charity=trim(Recipients)!!' 100%';
	   output;
   end;
   drop PctLoc Recipients ;
run;

title 'Charity Contributions for each Employee';
proc print data=work.split noobs;
   var Employee_ID Charity;
run;
title;
