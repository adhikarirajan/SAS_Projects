libname rajan "/folders/myfolders/DATA/";

%let m03_hw_app			= rajan.m03_hw_app;
%let m03_hw_credit		= rajan.m03_hw_credit;
%let m03_hw_cust		= rajan.m03_hw_cust;

%let SQLFILE		= SQLFILE;

data rajan.m03_hw_credit1;
set rajan.m03_hw_credit;

if missing(delinq) then delinq=0;
if missing (derog) then derog =0;
if missing (clage) then clage =0;
if missing(ninq) then ninq =0;
if missing (debtinc) then debtinc =0;

run;


proc sql;

create table &SQLFILE. as
	select 
			A.*,
			B.*,
			C.*
	from 
			&m03_hw_app.	as A,
			&m03_hw_cust.	as B,
			rajan.m03_hw_credit1	as C
			
	where
			A.ACCT_ID = B.ACCT_ID 
			and B.ACCT_ID = C.ACCT_ID
			;
quit;


Proc print data =&SQLFILE.;
run;
