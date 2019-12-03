libname rajan "/folders/myfolders/DATA";

data module02_hw;
      set rajan.Mod02;
      by job;
run;

proc print data=module02_hw(obs=10);
run;


data TOTALS;
set module02_hw;
by job;

retain Total_Loans_Count;
retain Total_Loans_Amount;
retain Average_Loan_Amount;


retain Total_Good_Loans_Count;
retain Total_Good_Loans_Amount;
retain Average_Good_Loans;

retain Total_Bad_Loans_Count;
retain Total_Bad_Loans_Amount;
retain Average_Bad_Loans;


if first.job then do;
	Total_Loans_Amount =0;
	Total_Loans_Count =0;
	Total_Good_Loans_Amount =0;
	Total_Good_Loans_Count=0;
	Total_Bad_Loans_Amount =0;
	Total_Loans_Count =0;
	Total_Bad_Loans_Count=0;
	
end;
Total_Loans_Amount = Total_Loans_Amount + loan;
Total_Loans_Count = Total_Loans_Count +1;
Average_Loan_Amount = Total_Loans_Amount/Total_Loans_Count;

if bad =0 then Total_Good_Loans_Count= Total_Good_Loans_Count +1 ;
if bad =0 then Total_Good_Loans_Amount= Total_Good_Loans_Amount + loan;
if bad =0 then Average_Good_Loans= Total_Good_Loans_Amount /Total_Good_Loans_Count ;

if bad =1 then Total_Bad_Loans_Count= Total_Bad_Loans_Count +1 ;
if bad =1 then Total_Bad_Loans_Amount= Total_Bad_Loans_Amount + loan;
if bad =1 then Average_Bad_Loans= Total_Bad_Loans_Amount /Total_Bad_Loans_Count ;

if last.job then do;
	output;
end;
drop bad;
drop loan;
run;

proc print  data =totals;
run;


