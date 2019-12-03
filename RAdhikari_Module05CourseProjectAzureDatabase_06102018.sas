/***************************************************************************************************************
**Author		: Rajan Adhikari
**Assignment	: RAdhikari_Module05CourseProjectAzureDatabase_06102018
**Date			: June 10 2017
**College		: Rasmussen
**Course		: Data Element
Professor		: Chintan Thakkar
***************************************************************************************************************/

data dohmh;
	Infile '/folders/myfolders/DOHMH_New_York_City_Restaurant_Inspection_Results.csv' *reading the dataset
	delimiter=',' MISSOVER DSD firstobs=2;
	informat CAMIS best32.;
	informat DBA $40.;
	informat BORO $13.;
	informat BUILDING $5.;
	informat STREET $23.;
	informat ZIPCODE $6.;
	informat PHONE $20.;
	informat CUISINE_DESCRIPTION $9.;
	informat INSPECTION_DATE mmddyy10.;
	informat ACTION $47.;
	informat VIOLATION_CODE $3.;
	informat CRITICAL_FLAG $12.;
	informat SCORE best32.;
	informat GRADE $1.;
	informat GRADE_DATE mmddyy10.;
	informat RECORD_DATE mmddyy10.;
	informat INSPECTION_TYPE $48.;
	
	format CAMIS best12.;
	format DBA $40.;
	format BORO $13.;
	format BUILDING $5.;
	format STREET $23.;
	format ZIPCODE $6.;
	format PHONE $29.;
	format CUISINE_DESCRIPTION $9.;
	format INSPECTION_DATE mmddyy10.;
	format ACTION $47.;
	format VIOLATION_CODE $3.;
	format CRITICAL_FLAG $12.;
	format SCORE best12.;
	format GRADE $1.;
	format GRADE_DATE mmddyy10.;
	format RECORD_DATE mmddyy10.;
	format INSPECTION_TYPE $48.;
	
	input 	CAMIS 
			DBA $ 
			BORO $  
			BUILDING  $  
			STREET  $ 
			ZIPCODE 
			PHONE 
			CUISINE_DESCRIPTION  $  
			INSPECTION_DATE 
			ACTION  $ 
			VIOLATION_CODE  $  
			CRITICAL_FLAG  $  
			SCORE GRADE  $  
			GRADE_DATE 
			RECORD_DATE 
			INSPECTION_TYPE  $
			;
/* applying the filter condition where critical falg = critical*/

	IF CRITICAL_FLAG ='Critical';
title 'Potential Restaurants for the Closure in Future';
run;

/*Proc SQL;
select  CAMIS, DBA from dohmh
where CRITICAL_FLAG = 'Critical' ;
title 'Potential Restaurants for the Closure in Future';
quit;*/

/*exporting the data into the local file location */

proc export data=work.dohmh (where=(CRITICAL_FLAG = 'Critical'))
   outfile='/folders/myfolders/New_dohmh.csv'
   dbms=csv
   replace;
run;