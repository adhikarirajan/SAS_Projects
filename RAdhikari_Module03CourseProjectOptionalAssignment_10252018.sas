
libname rajan "/folders/myfolders/DATA/";



%let m03_hw_app			= rajan.m03_hw_app;
%let m03_hw_credit		= rajan.m03_hw_credit;
%let m03_hw_cust		= rajan.m03_hw_cust;


%let SQLFILE		= SQLFILE;
*%let MERGEFILE		= MERGEFILE;
*%let SQLFILE		= SQLFILE;

data rajan.m03_hw_credit1;
set rajan.m03_hw_credit;

if missing(delinq) then delinq=0;
if missing (derog) then derog =0;
if missing (clage) then clage =0;
if missing(ninq) then ninq =0;
if missing (debtinc) then debtinc =0;

run;

proc means data = rajan.m03_hw_credit1 nmiss mean ;
*class derog;
*var delinq;
run; 

proc freq data = rajan.m03_hw_credit1;
table derog;
run; 
