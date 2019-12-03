proc rank
data =work.mod04_assignment
out=work.mod04_assignment
groups= 195; /*Out of 114424 observations, there are 195 unique zip codes*/
var Incident_Zip;
ranks ZipCodeGroup;
run;

