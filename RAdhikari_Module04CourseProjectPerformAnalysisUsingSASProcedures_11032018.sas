
/*****************************************************************************************
*PROGRAM NAME	:	CRIME ANALYSIS														*
*DESCRIPTION	:	SAS CUSTOM REPORTING												*
*CALLED BY		:	N/A																	*
*CALLS TO		:	N/A																	*
*PROGRAMMER		:	RAJAN ADHIKARI														*
*DATE WRITTEN	:	NOV 03 2018															*
*****************************************************************************************
*INPUT FILES	:	Crime.csv															*
*OUTPUT FILES	:	N/A																	*
*****************************************************************************************
*MODIFICATIONS	:	APPROPRIATE COMMENTS ADDED AS PER THE SCRIPTING STANDARDS			*
*DATE			:	NOV 03 2018															*
*CHANGE #		:	1																	*
*PROGRAMMER		:	RAJAN ADHIKARI														*
*DESCRIPTION	:	SAS CUSTOM REPORTING												*
*PROGRAM NAME	:	CRIME ANALYSIS														*
*****************************************************************************************/

%let CSVPATH = /folders/myfolders/CSV;
%let LIBPATH = /folders/myfolders/DATA;

libname rajan "&LIBPATH.";

%let FILE 		= rajan.M04_CrimeSmall;
%let RAW_FILE 	= &CSVPATH./CrimeSmall.csv;
%let MEANFILE	= MEANFILE;
%let FREQFILE	= FREQFILE;

%macro READ_DATA( INFILE, OUTFILE );

data &OUTFILE.;
	length ID 		$10;
	length CRIME 	$20;
	length ZIP 		$5;
infile "&INFILE." dlm="," dsd lrecl=4096 truncover firstobs=2;
input
	ID		$
	CRIME	$
	ZIP		$
	;
run;

%mend;

%READ_DATA( &RAW_FILE., &FILE. );

proc freq data=&FILE. noprint;
table ZIP /missing out=&FREQFILE.;
run;
proc means data =&FILE. noprint;
class ZIP;
output out =&MEANFILE.;
run;

data &MEANFILE.;
set &MEANFILE.;
CRIMES = round(_FREQ_, 5);
POLICE=0;

if CRIMES >=5 then POLICE =1;
if CRIMES >=10 then POLICE =2;
if CRIMES >=15 then POLICE =4;
if CRIMES >=20 then POLICE =6;
if CRIMES >=25 then POLICE =8;
if CRIMES >=30 then POLICE =10;
if CRIMES >=45 then POLICE =12;
if CRIMES >=55 then POLICE =15;
if CRIMES >=200 then POLICE =20;
if CRIMES >=500 then POLICE =30;
if CRIMES >=1500 then POLICE =50;
if CRIMES >=5000 then POLICE =100;
if CRIMES >=10000 then POLICE =200;
if CRIMES >=50000 then POLICE =400;
drop _TYPE_;
if missing(ZIP) then delete;
run;

proc print data = &MEANFILE.;

title 'Prediction of Police Assignment on the ZIP Codes Based on Crimes Count';

run;






