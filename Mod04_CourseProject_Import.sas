proc import datafile= '/folders/myfolders/DOHMH_New_York_City_Restaurant_Inspection_Results.csv'
dbms = csv
out =Mod04_CourseProject
replace;
datarow= 2;
guessingrows=399918;
run;