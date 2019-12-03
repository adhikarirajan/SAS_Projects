libname rajan "/folders/myfolders/DATA";

%let INFILE = rajan.POLICIES;
%let INFILE1 = rajan.Mod05_hmeq;
%let TEMPFILE = TEMPFILE;
%let TEMPFILE1 = TEMPFILE1;


data &TEMPFILE.;
set &INFILE.;
run;

*proc print data=&TEMPFILE.(obs=10);
*run;


proc freq data=&TEMPFILE.;
table JOB /missing plots=freqplot(type=BAR);
title 'Using Proc FREQ with JOB';
run;

proc freq data=&TEMPFILE.;
table RED_CAR*CLAIM_FLAG /missing plots=freqplot(type=BAR);
title 'Using Proc FREQ with RED_CAR*CLAIM_FLAG';
run;


proc means data=&TEMPFILE. n nmiss mean median min max;
var INCOME;
title 'Using Proc MEANS with var MORTDUE n nmiss mean median min max';
run;

proc means data=&TEMPFILE. n nmiss mean median min max;
var YOJ;
title 'Using Proc MEANS with var DEBTINC and n nmiss mean median min max';
run;

proc means data=&TEMPFILE. n nmiss mean median min max printalltypes;
class JOB;
var YOJ;
title 'Using Proc MEANS with var LOAN and n nmiss mean median min max';
run;


proc univariate data=&TEMPFILE. noprint;
class car_USE;
histogram  INCOME /nrows=2 normal;
title 'Using Proc UNIVARATE with Class CAR_USE with Income';
run;

/****************************************REASON FOR WANTING THE LOAN ("REASON")******************************************/

data &TEMPFILE1.; /*another set of data*/
set &INFILE1.;
run;

*proc print data=&TEMPFILE1.(obs=10);
*run;

proc freq data=&TEMPFILE1.;
table REASON /missing plots=freqplot(type=BAR);
title 'Using Proc FREQ with REASON';
run;

proc freq data=&TEMPFILE1.;
table JOB*BAD /missing plots=freqplot(type=BAR);
title 'Using Proc FREQ with JOB*BAD';
run;


proc means data=&TEMPFILE1. n nmiss mean median min max;
var MORTDUE;
title 'Using Proc MEANS with var MORTDUE n nmiss mean median min max';
run;

proc means data=&TEMPFILE1. n nmiss mean median min max;
var DEBTINC;
title 'Using Proc MEANS with var DEBTINC and n nmiss mean median min max';
run;

proc means data=&TEMPFILE1. n nmiss mean median min max printalltypes;
class REASON;
var loan;
title 'Using Proc MEANS with var LOAN and n nmiss mean median min max';
run;


proc univariate data=&TEMPFILE1. noprint;
class REASON;
histogram  LOAN /nrows=2 normal;
title 'Using Proc UNIVARATE with Class REASON  with Income';
run;





