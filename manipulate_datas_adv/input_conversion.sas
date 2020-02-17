%let path=C:\Users\VM\Desktop\DSTI202002\2-LWPG2_001-Prog2\Data;
libname orion "&path";


*example1;
data shipping_notes;
  set orion.shipped;
  length Comment $ 21;
  Comment = cat('Shipped on ',put(Ship_Date,mmddyy10.));
  Total = Quantity * input(Price,comma7.);
run;

proc print data=shipping_notes noobs;
  format Total dollar7.2;
run;

*example2;
data US_converted
      (drop=cID nTelephone cBirthday);
  set orion.US_newhire
      (rename=(ID=cID Telephone=nTelephone
               Birthday=cBirthday));
  ID = input(compress(cID,'-'),15.);
  length Telephone $ 8;
  Telephone = cat(substr(put(nTelephone,7.),1,3),
              '-',substr(put(nTelephone,7.),4));
  Birthday = input(cBirthday,date9.);
run;

title 'US New Hires';
proc print data=US_converted noobs;
run;
title;

proc contents data=US_converted varnum;
run;
