%let SASPATH = /folders/myfolders/DATA;
 
libname rajan "&SASPATH.";

%let INFILE 	= rajan.Fuel_All;
%let TEMPFILE 	= TEMPFILE;


*proc print data=&INFILE.(obs=10);
*run;

data &TEMPFILE.;
set &TEMPFILE.;
Pred_Price = 3.95 + Temperature*(0.0035) - CPI*(0.0045);
run;

proc print data=&TEMPFILE.(obs=10);
var MONTH Fuel_Price Pred_Price;
title 'Prediction of Gasoline Price (3.95 + Temperature*(0.0035) - CPI*(0.0045))';
run;

data &TEMPFILE.;
set &INFILE.;
MONTH = month( DATE );
FLAG_MONTH_HIGH_PRICE = MONTH in (4,5);
run;

*proc print data=&TEMPFILE.(obs=10);
*run;

proc means data=&TEMPFILE. printalltypes;
class MONTH;
var Fuel_Price;
run;


proc reg data=&TEMPFILE.;
model Fuel_Price =	Temperature 
					CPI 
					Unemployment 
					FLAG_Holiday 
					FLAG_MONTH_HIGH_PRICE
					/selection=stepwise
					;
run;
quit;


proc GLM data=&TEMPFILE.;
model Fuel_Price =	CPI 
					FLAG_Holiday 
					FLAG_MONTH_HIGH_PRICE
					;
run;
quit;

