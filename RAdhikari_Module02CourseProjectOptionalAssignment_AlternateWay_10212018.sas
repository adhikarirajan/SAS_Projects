libname rajan "/folders/myfolders/DATA";

proc sort data=rajan.mod02;
by job ;
run;

*proc print data=rajan.mod02(obs = 5);
*run;

data mod02new;
set rajan.mod02;
by job;



data mod02new1;
set mod02new;
by bad;
where bad =1;
*proc print data= mod02new1;
run;


/*************The number of loans given for each of the JOB Types************/
proc sql;

title "The number of loans given for each of the JOB Types";

Select job as Job_Title, count(loan) as Total_Loans 
from mod02new 
group by job;

run;

/************* The Total and Average Loan Amount given to each of the JOB Types************/
proc sql;

title "The Total and Average Loan Amount given to each of the JOB Types";

select  job as Job_Title, sum(loan) as Total_Loan_Amount, avg(loan) as Average_loan_Amount 
from mod02new 
group by job;

run;

/*************The Total and Average Number of Bad Loans given to each of the JOB Types************/
proc sql;
title "The Total and Average Number of Bad Loans given to each of the JOB Types";
Select job as Job_Title, count(bad) as Total_Number_of_Bad_Loans, sum(loan) as Total_Amount_of_Bad_Loans, avg(loan) as Average_Bad_Loans 
from mod02new1 group by job;
run;