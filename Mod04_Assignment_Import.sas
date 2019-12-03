proc import datafile= '/folders/myfolders/party_in_nyc.csv'
dbms = csv
out =Mod04_Assignment
replace;
datarow= 2;
guessingrows=399918;
run;