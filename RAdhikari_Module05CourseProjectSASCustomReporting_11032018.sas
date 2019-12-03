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
%let SASPATH = /folders/myfolders/DATA;
 
libname rajan "&SASPATH.";

%let RAW_FILE = &CSVPATH./Crime_2.csv;
%let SAS_FILE = rajan.crime_2;

%let _EFIERR_ = 0; /* set the ERROR detection macro variable */

data &SAS_FILE.;

infile "&RAW_FILE." dlm="," dsd lrecl=4096 truncover firstobs=2;

            informat Incident_ID best32. ;
            informat CR_Number best32. ;
            informat Dispatch_Date___Time anydtdtm40. ;
            informat Class best32. ;
            informat Class_Description $36. ;
            informat Police_District_Name $18. ;
            informat Block_Address $22. ;
            informat City $13. ;
            informat State $2. ;
            informat Zip_Code best32. ;
            informat Agency $4. ;
            informat Place $28. ;
            informat Sector $1. ;
            informat Beat $8. ;
            informat PRA best32. ;
            informat Start_Date___Time anydtdtm40. ;
            informat End_Date___Time anydtdtm40. ;
            informat Police_District_Number $2. ;
            informat Address_Number best32. ;
			  
            format Incident_ID best12. ;
            format CR_Number best12. ;
            format Dispatch_Date___Time datetime. ;
            format Class best12. ;
            format Class_Description $36. ;
            format Police_District_Name $18. ;
            format Block_Address $22. ;
            format City $13. ;
            format State $2. ;
            format Zip_Code best12. ;
			format Agency $4. ;
            format Place $28. ;
            format Sector $1. ;
            format Beat $8. ;
            format PRA best12. ;
            format Start_Date___Time datetime. ;
            format End_Date___Time datetime. ;
			format Police_District_Number $2. ;
            format Address_Number best12. ;
            
			input
            Incident_ID
            CR_Number
            Dispatch_Date___Time
            Class
            Class_Description  $
            Police_District_Name  $
            Block_Address  $
            City  $
            State  $
            Zip_Code
            Agency  $
            Place  $
            Sector  $
            Beat  $
            PRA
            Start_Date___Time
            End_Date___Time
            Police_District_Number  $
            Address_Number
          ;
    if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
    run;
    
    Proc print data =&SAS_FILE. (obs=10);
    title 'Reading the .csv Dataset'
    run;
    
Proc freq data =&SAS_FILE.;
table City ;
where state in ('DC');
title 'Using PROC FREQ Procedure';
run;

    
proc tabulate data = &SAS_FILE.;
Class State;
variable Incident_ID;
table State ='Statewise Crime Count';
title 'Using PROC TABULATE Procedure';
run;

proc report data =&SAS_FILE.;
column city Class_Description;
where state in ('DC') and Class_Description in ('POL INFORMATION');
title 'Using PROC REPORT Procedure';
run;