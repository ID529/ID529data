
# Set working directory
# setwd()


new_data <- read.table('NLSY_satisfaction_alcohol_race_ethnicity_education.dat', sep=' ')
names(new_data) <- c('R0000100',
'R0173600',
'R0214700',
'R0214800',
'T0014400',
'T0017900',
'T0018000',
'T0018100',
'T0911300',
'T0989000',
'T1214300',
'T1218200',
'T1218300',
'T1218400',
'T2075600',
'T2210800',
'T2272800',
'T2276100',
'T2276200',
'T3044200',
'T3108700',
'T3212900',
'T3216800',
'T3216900',
'T3217000',
'T3976400',
'T4113200',
'T4201100',
'T4206500',
'T4206600',
'T4206700',
'T4914700',
'T5006600',
'T5023600',
'T5176100',
'T5180600',
'T5180700',
'T5740700',
'T5771500',
'T7743900',
'T7749900',
'T7750000',
'T7750100',
'T8187800',
'T8219400')


# Handle missing values

new_data[new_data == -1] = NA  # Refused
new_data[new_data == -2] = NA  # Dont know
new_data[new_data == -3] = NA  # Invalid missing
new_data[new_data == -4] = NA  # Valid missing
new_data[new_data == -5] = NA  # Non-interview


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
  data$R0173600 <- factor(data$R0173600,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0),
labels=c("CROSS MALE WHITE",
"CROSS MALE WH. POOR",
"CROSS MALE BLACK",
"CROSS MALE HISPANIC",
"CROSS FEMALE WHITE",
"CROSS FEMALE WH POOR",
"CROSS FEMALE BLACK",
"CROSS FEMALE HISPANIC",
"SUP MALE WH POOR",
"SUP MALE BLACK",
"SUP MALE HISPANIC",
"SUP FEM WH POOR",
"SUP FEMALE BLACK",
"SUP FEMALE HISPANIC",
"MIL MALE WHITE",
"MIL MALE BLACK",
"MIL MALE HISPANIC",
"MIL FEMALE WHITE",
"MIL FEMALE BLACK",
"MIL FEMALE HISPANIC"))
  data$R0214700 <- factor(data$R0214700,
levels=c(1.0,2.0,3.0),
labels=c("HISPANIC",
"BLACK",
"NON-BLACK, NON-HISPANIC"))
  data$R0214800 <- factor(data$R0214800,
levels=c(1.0,2.0),
labels=c("MALE",
"FEMALE"))
  data$T0014400 <- factor(data$T0014400,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0),
labels=c("1ST GRADE",
"2ND GRADE",
"3RD GRADE",
"4TH GRADE",
"5TH GRADE",
"6TH GRADE",
"7TH GRADE",
"8TH GRADE",
"9TH GRADE",
"10TH GRADE",
"11TH GRADE",
"12TH GRADE",
"1ST YEAR COLLEGE",
"2ND YEAR COLLEGE",
"3RD YEAR COLLEGE",
"4TH YEAR COLLEGE",
"5TH YEAR COLLEGE",
"6TH YEAR COLLEGE",
"7TH YEAR COLLEGE",
"8TH YEAR COLLEGE OR MORE",
"UNGRADED"))
  data$T0989000 <- factor(data$T0989000,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52"))
  data$T1214300 <- factor(data$T1214300,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0),
labels=c("1ST GRADE",
"2ND GRADE",
"3RD GRADE",
"4TH GRADE",
"5TH GRADE",
"6TH GRADE",
"7TH GRADE",
"8TH GRADE",
"9TH GRADE",
"10TH GRADE",
"11TH GRADE",
"12TH GRADE",
"1ST YEAR COLLEGE",
"2ND YEAR COLLEGE",
"3RD YEAR COLLEGE",
"4TH YEAR COLLEGE",
"5TH YEAR COLLEGE",
"6TH YEAR COLLEGE",
"7TH YEAR COLLEGE",
"8TH YEAR COLLEGE OR MORE",
"UNGRADED"))
  data$T2210800 <- factor(data$T2210800,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52"))
  data$T2272800 <- factor(data$T2272800,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0),
labels=c("1ST GRADE",
"2ND GRADE",
"3RD GRADE",
"4TH GRADE",
"5TH GRADE",
"6TH GRADE",
"7TH GRADE",
"8TH GRADE",
"9TH GRADE",
"10TH GRADE",
"11TH GRADE",
"12TH GRADE",
"1ST YEAR COLLEGE",
"2ND YEAR COLLEGE",
"3RD YEAR COLLEGE",
"4TH YEAR COLLEGE",
"5TH YEAR COLLEGE",
"6TH YEAR COLLEGE",
"7TH YEAR COLLEGE",
"8TH YEAR COLLEGE OR MORE",
"UNGRADED"))
  data$T3108700 <- factor(data$T3108700,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53"))
  data$T3212900 <- factor(data$T3212900,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0),
labels=c("1ST GRADE",
"2ND GRADE",
"3RD GRADE",
"4TH GRADE",
"5TH GRADE",
"6TH GRADE",
"7TH GRADE",
"8TH GRADE",
"9TH GRADE",
"10TH GRADE",
"11TH GRADE",
"12TH GRADE",
"1ST YEAR COLLEGE",
"2ND YEAR COLLEGE",
"3RD YEAR COLLEGE",
"4TH YEAR COLLEGE",
"5TH YEAR COLLEGE",
"6TH YEAR COLLEGE",
"7TH YEAR COLLEGE",
"8TH YEAR COLLEGE OR MORE",
"UNGRADED"))
  data$T4113200 <- factor(data$T4113200,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56"))
  data$T4201100 <- factor(data$T4201100,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0),
labels=c("1ST GRADE",
"2ND GRADE",
"3RD GRADE",
"4TH GRADE",
"5TH GRADE",
"6TH GRADE",
"7TH GRADE",
"8TH GRADE",
"9TH GRADE",
"10TH GRADE",
"11TH GRADE",
"12TH GRADE",
"1ST YEAR COLLEGE",
"2ND YEAR COLLEGE",
"3RD YEAR COLLEGE",
"4TH YEAR COLLEGE",
"5TH YEAR COLLEGE",
"6TH YEAR COLLEGE",
"7TH YEAR COLLEGE",
"8TH YEAR COLLEGE OR MORE",
"UNGRADED"))
  data$T5006600 <- factor(data$T5006600,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0),
labels=c("1 (not at all satisfied)",
"2",
"3",
"4",
"5",
"6",
"7 (completely satisfied)"))
  data$T5023600 <- factor(data$T5023600,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56",
"57",
"58"))
  data$T5176100 <- factor(data$T5176100,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0),
labels=c("1ST GRADE",
"2ND GRADE",
"3RD GRADE",
"4TH GRADE",
"5TH GRADE",
"6TH GRADE",
"7TH GRADE",
"8TH GRADE",
"9TH GRADE",
"10TH GRADE",
"11TH GRADE",
"12TH GRADE",
"1ST YEAR COLLEGE",
"2ND YEAR COLLEGE",
"3RD YEAR COLLEGE",
"4TH YEAR COLLEGE",
"5TH YEAR COLLEGE",
"6TH YEAR COLLEGE",
"7TH YEAR COLLEGE",
"8TH YEAR COLLEGE OR MORE",
"UNGRADED"))
  data$T5740700 <- factor(data$T5740700,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0),
labels=c("1 (not at all satisfied)",
"2",
"3",
"4",
"5",
"6",
"7 (completely satisfied)"))
  data$T5771500 <- factor(data$T5771500,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0,59.0,60.0,61.0,62.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56",
"57",
"58",
"59",
"60",
"61",
"62"))
  data$T7743900 <- factor(data$T7743900,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0),
labels=c("1ST GRADE",
"2ND GRADE",
"3RD GRADE",
"4TH GRADE",
"5TH GRADE",
"6TH GRADE",
"7TH GRADE",
"8TH GRADE",
"9TH GRADE",
"10TH GRADE",
"11TH GRADE",
"12TH GRADE",
"1ST YEAR COLLEGE",
"2ND YEAR COLLEGE",
"3RD YEAR COLLEGE",
"4TH YEAR COLLEGE",
"5TH YEAR COLLEGE",
"6TH YEAR COLLEGE",
"7TH YEAR COLLEGE",
"8TH YEAR COLLEGE OR MORE",
"UNGRADED"))
  data$T8187800 <- factor(data$T8187800,
levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0),
labels=c("1 (not at all satisfied)",
"2",
"3",
"4",
"5",
"6",
"7 (completely satisfied)"))
  data$T8219400 <- factor(data$T8219400,
levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0,59.0,60.0,61.0,62.0),
labels=c("40",
"41",
"42",
"43",
"44",
"45",
"46",
"47",
"48",
"49",
"50",
"51",
"52",
"53",
"54",
"55",
"56",
"57",
"58",
"59",
"60",
"61",
"62"))
return(data)
}


# If there are values not categorized they will be represented as NA

vallabels_continuous = function(data) {
data$T0017900[1.0 <= data$T0017900 & data$T0017900 <= 24.0] <- 1.0
data$T0017900[25.0 <= data$T0017900 & data$T0017900 <= 49.0] <- 25.0
data$T0017900[50.0 <= data$T0017900 & data$T0017900 <= 74.0] <- 50.0
data$T0017900[75.0 <= data$T0017900 & data$T0017900 <= 99.0] <- 75.0
data$T0017900[100.0 <= data$T0017900 & data$T0017900 <= 124.0] <- 100.0
data$T0017900[125.0 <= data$T0017900 & data$T0017900 <= 149.0] <- 125.0
data$T0017900[150.0 <= data$T0017900 & data$T0017900 <= 174.0] <- 150.0
data$T0017900[175.0 <= data$T0017900 & data$T0017900 <= 199.0] <- 175.0
data$T0017900[200.0 <= data$T0017900 & data$T0017900 <= 224.0] <- 200.0
data$T0017900[225.0 <= data$T0017900 & data$T0017900 <= 249.0] <- 225.0
data$T0017900[250.0 <= data$T0017900 & data$T0017900 <= 9.9999999E7] <- 250.0
data$T0017900 <- factor(data$T0017900,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T0018000[1.0 <= data$T0018000 & data$T0018000 <= 24.0] <- 1.0
data$T0018000[25.0 <= data$T0018000 & data$T0018000 <= 49.0] <- 25.0
data$T0018000[50.0 <= data$T0018000 & data$T0018000 <= 74.0] <- 50.0
data$T0018000[75.0 <= data$T0018000 & data$T0018000 <= 99.0] <- 75.0
data$T0018000[100.0 <= data$T0018000 & data$T0018000 <= 124.0] <- 100.0
data$T0018000[125.0 <= data$T0018000 & data$T0018000 <= 149.0] <- 125.0
data$T0018000[150.0 <= data$T0018000 & data$T0018000 <= 174.0] <- 150.0
data$T0018000[175.0 <= data$T0018000 & data$T0018000 <= 199.0] <- 175.0
data$T0018000[200.0 <= data$T0018000 & data$T0018000 <= 224.0] <- 200.0
data$T0018000[225.0 <= data$T0018000 & data$T0018000 <= 249.0] <- 225.0
data$T0018000[250.0 <= data$T0018000 & data$T0018000 <= 9.9999999E7] <- 250.0
data$T0018000 <- factor(data$T0018000,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T0018100[1.0 <= data$T0018100 & data$T0018100 <= 24.0] <- 1.0
data$T0018100[25.0 <= data$T0018100 & data$T0018100 <= 49.0] <- 25.0
data$T0018100[50.0 <= data$T0018100 & data$T0018100 <= 74.0] <- 50.0
data$T0018100[75.0 <= data$T0018100 & data$T0018100 <= 99.0] <- 75.0
data$T0018100[100.0 <= data$T0018100 & data$T0018100 <= 124.0] <- 100.0
data$T0018100[125.0 <= data$T0018100 & data$T0018100 <= 149.0] <- 125.0
data$T0018100[150.0 <= data$T0018100 & data$T0018100 <= 174.0] <- 150.0
data$T0018100[175.0 <= data$T0018100 & data$T0018100 <= 199.0] <- 175.0
data$T0018100[200.0 <= data$T0018100 & data$T0018100 <= 224.0] <- 200.0
data$T0018100[225.0 <= data$T0018100 & data$T0018100 <= 249.0] <- 225.0
data$T0018100[250.0 <= data$T0018100 & data$T0018100 <= 9.9999999E7] <- 250.0
data$T0018100 <- factor(data$T0018100,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T0911300[10.0 <= data$T0911300 & data$T0911300 <= 999.0] <- 10.0
data$T0911300 <- factor(data$T0911300,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T1218200[1.0 <= data$T1218200 & data$T1218200 <= 24.0] <- 1.0
data$T1218200[25.0 <= data$T1218200 & data$T1218200 <= 49.0] <- 25.0
data$T1218200[50.0 <= data$T1218200 & data$T1218200 <= 74.0] <- 50.0
data$T1218200[75.0 <= data$T1218200 & data$T1218200 <= 99.0] <- 75.0
data$T1218200[100.0 <= data$T1218200 & data$T1218200 <= 124.0] <- 100.0
data$T1218200[125.0 <= data$T1218200 & data$T1218200 <= 149.0] <- 125.0
data$T1218200[150.0 <= data$T1218200 & data$T1218200 <= 174.0] <- 150.0
data$T1218200[175.0 <= data$T1218200 & data$T1218200 <= 199.0] <- 175.0
data$T1218200[200.0 <= data$T1218200 & data$T1218200 <= 224.0] <- 200.0
data$T1218200[225.0 <= data$T1218200 & data$T1218200 <= 249.0] <- 225.0
data$T1218200[250.0 <= data$T1218200 & data$T1218200 <= 9.9999999E7] <- 250.0
data$T1218200 <- factor(data$T1218200,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T1218300[1.0 <= data$T1218300 & data$T1218300 <= 24.0] <- 1.0
data$T1218300[25.0 <= data$T1218300 & data$T1218300 <= 49.0] <- 25.0
data$T1218300[50.0 <= data$T1218300 & data$T1218300 <= 74.0] <- 50.0
data$T1218300[75.0 <= data$T1218300 & data$T1218300 <= 99.0] <- 75.0
data$T1218300[100.0 <= data$T1218300 & data$T1218300 <= 124.0] <- 100.0
data$T1218300[125.0 <= data$T1218300 & data$T1218300 <= 149.0] <- 125.0
data$T1218300[150.0 <= data$T1218300 & data$T1218300 <= 174.0] <- 150.0
data$T1218300[175.0 <= data$T1218300 & data$T1218300 <= 199.0] <- 175.0
data$T1218300[200.0 <= data$T1218300 & data$T1218300 <= 224.0] <- 200.0
data$T1218300[225.0 <= data$T1218300 & data$T1218300 <= 249.0] <- 225.0
data$T1218300[250.0 <= data$T1218300 & data$T1218300 <= 9.9999999E7] <- 250.0
data$T1218300 <- factor(data$T1218300,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T1218400[1.0 <= data$T1218400 & data$T1218400 <= 24.0] <- 1.0
data$T1218400[25.0 <= data$T1218400 & data$T1218400 <= 49.0] <- 25.0
data$T1218400[50.0 <= data$T1218400 & data$T1218400 <= 74.0] <- 50.0
data$T1218400[75.0 <= data$T1218400 & data$T1218400 <= 99.0] <- 75.0
data$T1218400[100.0 <= data$T1218400 & data$T1218400 <= 124.0] <- 100.0
data$T1218400[125.0 <= data$T1218400 & data$T1218400 <= 149.0] <- 125.0
data$T1218400[150.0 <= data$T1218400 & data$T1218400 <= 174.0] <- 150.0
data$T1218400[175.0 <= data$T1218400 & data$T1218400 <= 199.0] <- 175.0
data$T1218400[200.0 <= data$T1218400 & data$T1218400 <= 224.0] <- 200.0
data$T1218400[225.0 <= data$T1218400 & data$T1218400 <= 249.0] <- 225.0
data$T1218400[250.0 <= data$T1218400 & data$T1218400 <= 9.9999999E7] <- 250.0
data$T1218400 <- factor(data$T1218400,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T2075600[10.0 <= data$T2075600 & data$T2075600 <= 999.0] <- 10.0
data$T2075600 <- factor(data$T2075600,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T2276100[1.0 <= data$T2276100 & data$T2276100 <= 24.0] <- 1.0
data$T2276100[25.0 <= data$T2276100 & data$T2276100 <= 49.0] <- 25.0
data$T2276100[50.0 <= data$T2276100 & data$T2276100 <= 74.0] <- 50.0
data$T2276100[75.0 <= data$T2276100 & data$T2276100 <= 99.0] <- 75.0
data$T2276100[100.0 <= data$T2276100 & data$T2276100 <= 124.0] <- 100.0
data$T2276100[125.0 <= data$T2276100 & data$T2276100 <= 149.0] <- 125.0
data$T2276100[150.0 <= data$T2276100 & data$T2276100 <= 174.0] <- 150.0
data$T2276100[175.0 <= data$T2276100 & data$T2276100 <= 199.0] <- 175.0
data$T2276100[200.0 <= data$T2276100 & data$T2276100 <= 224.0] <- 200.0
data$T2276100[225.0 <= data$T2276100 & data$T2276100 <= 249.0] <- 225.0
data$T2276100[250.0 <= data$T2276100 & data$T2276100 <= 9.9999999E7] <- 250.0
data$T2276100 <- factor(data$T2276100,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T2276200[1.0 <= data$T2276200 & data$T2276200 <= 24.0] <- 1.0
data$T2276200[25.0 <= data$T2276200 & data$T2276200 <= 49.0] <- 25.0
data$T2276200[50.0 <= data$T2276200 & data$T2276200 <= 74.0] <- 50.0
data$T2276200[75.0 <= data$T2276200 & data$T2276200 <= 99.0] <- 75.0
data$T2276200[100.0 <= data$T2276200 & data$T2276200 <= 124.0] <- 100.0
data$T2276200[125.0 <= data$T2276200 & data$T2276200 <= 149.0] <- 125.0
data$T2276200[150.0 <= data$T2276200 & data$T2276200 <= 174.0] <- 150.0
data$T2276200[175.0 <= data$T2276200 & data$T2276200 <= 199.0] <- 175.0
data$T2276200[200.0 <= data$T2276200 & data$T2276200 <= 224.0] <- 200.0
data$T2276200[225.0 <= data$T2276200 & data$T2276200 <= 249.0] <- 225.0
data$T2276200[250.0 <= data$T2276200 & data$T2276200 <= 9.9999999E7] <- 250.0
data$T2276200 <- factor(data$T2276200,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T3044200[10.0 <= data$T3044200 & data$T3044200 <= 999.0] <- 10.0
data$T3044200 <- factor(data$T3044200,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T3216800[1.0 <= data$T3216800 & data$T3216800 <= 24.0] <- 1.0
data$T3216800[25.0 <= data$T3216800 & data$T3216800 <= 49.0] <- 25.0
data$T3216800[50.0 <= data$T3216800 & data$T3216800 <= 74.0] <- 50.0
data$T3216800[75.0 <= data$T3216800 & data$T3216800 <= 99.0] <- 75.0
data$T3216800[100.0 <= data$T3216800 & data$T3216800 <= 124.0] <- 100.0
data$T3216800[125.0 <= data$T3216800 & data$T3216800 <= 149.0] <- 125.0
data$T3216800[150.0 <= data$T3216800 & data$T3216800 <= 174.0] <- 150.0
data$T3216800[175.0 <= data$T3216800 & data$T3216800 <= 199.0] <- 175.0
data$T3216800[200.0 <= data$T3216800 & data$T3216800 <= 224.0] <- 200.0
data$T3216800[225.0 <= data$T3216800 & data$T3216800 <= 249.0] <- 225.0
data$T3216800[250.0 <= data$T3216800 & data$T3216800 <= 9.9999999E7] <- 250.0
data$T3216800 <- factor(data$T3216800,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T3216900[1.0 <= data$T3216900 & data$T3216900 <= 24.0] <- 1.0
data$T3216900[25.0 <= data$T3216900 & data$T3216900 <= 49.0] <- 25.0
data$T3216900[50.0 <= data$T3216900 & data$T3216900 <= 74.0] <- 50.0
data$T3216900[75.0 <= data$T3216900 & data$T3216900 <= 99.0] <- 75.0
data$T3216900[100.0 <= data$T3216900 & data$T3216900 <= 124.0] <- 100.0
data$T3216900[125.0 <= data$T3216900 & data$T3216900 <= 149.0] <- 125.0
data$T3216900[150.0 <= data$T3216900 & data$T3216900 <= 174.0] <- 150.0
data$T3216900[175.0 <= data$T3216900 & data$T3216900 <= 199.0] <- 175.0
data$T3216900[200.0 <= data$T3216900 & data$T3216900 <= 224.0] <- 200.0
data$T3216900[225.0 <= data$T3216900 & data$T3216900 <= 249.0] <- 225.0
data$T3216900[250.0 <= data$T3216900 & data$T3216900 <= 9.9999999E7] <- 250.0
data$T3216900 <- factor(data$T3216900,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T3217000[1.0 <= data$T3217000 & data$T3217000 <= 24.0] <- 1.0
data$T3217000[25.0 <= data$T3217000 & data$T3217000 <= 49.0] <- 25.0
data$T3217000[50.0 <= data$T3217000 & data$T3217000 <= 74.0] <- 50.0
data$T3217000[75.0 <= data$T3217000 & data$T3217000 <= 99.0] <- 75.0
data$T3217000[100.0 <= data$T3217000 & data$T3217000 <= 124.0] <- 100.0
data$T3217000[125.0 <= data$T3217000 & data$T3217000 <= 149.0] <- 125.0
data$T3217000[150.0 <= data$T3217000 & data$T3217000 <= 174.0] <- 150.0
data$T3217000[175.0 <= data$T3217000 & data$T3217000 <= 199.0] <- 175.0
data$T3217000[200.0 <= data$T3217000 & data$T3217000 <= 224.0] <- 200.0
data$T3217000[225.0 <= data$T3217000 & data$T3217000 <= 249.0] <- 225.0
data$T3217000[250.0 <= data$T3217000 & data$T3217000 <= 9.9999999E7] <- 250.0
data$T3217000 <- factor(data$T3217000,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T3976400[10.0 <= data$T3976400 & data$T3976400 <= 999.0] <- 10.0
data$T3976400 <- factor(data$T3976400,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T4206500[1.0 <= data$T4206500 & data$T4206500 <= 24.0] <- 1.0
data$T4206500[25.0 <= data$T4206500 & data$T4206500 <= 49.0] <- 25.0
data$T4206500[50.0 <= data$T4206500 & data$T4206500 <= 74.0] <- 50.0
data$T4206500[75.0 <= data$T4206500 & data$T4206500 <= 99.0] <- 75.0
data$T4206500[100.0 <= data$T4206500 & data$T4206500 <= 124.0] <- 100.0
data$T4206500[125.0 <= data$T4206500 & data$T4206500 <= 149.0] <- 125.0
data$T4206500[150.0 <= data$T4206500 & data$T4206500 <= 174.0] <- 150.0
data$T4206500[175.0 <= data$T4206500 & data$T4206500 <= 199.0] <- 175.0
data$T4206500[200.0 <= data$T4206500 & data$T4206500 <= 224.0] <- 200.0
data$T4206500[225.0 <= data$T4206500 & data$T4206500 <= 249.0] <- 225.0
data$T4206500[250.0 <= data$T4206500 & data$T4206500 <= 9.9999999E7] <- 250.0
data$T4206500 <- factor(data$T4206500,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T4206600[1.0 <= data$T4206600 & data$T4206600 <= 24.0] <- 1.0
data$T4206600[25.0 <= data$T4206600 & data$T4206600 <= 49.0] <- 25.0
data$T4206600[50.0 <= data$T4206600 & data$T4206600 <= 74.0] <- 50.0
data$T4206600[75.0 <= data$T4206600 & data$T4206600 <= 99.0] <- 75.0
data$T4206600[100.0 <= data$T4206600 & data$T4206600 <= 124.0] <- 100.0
data$T4206600[125.0 <= data$T4206600 & data$T4206600 <= 149.0] <- 125.0
data$T4206600[150.0 <= data$T4206600 & data$T4206600 <= 174.0] <- 150.0
data$T4206600[175.0 <= data$T4206600 & data$T4206600 <= 199.0] <- 175.0
data$T4206600[200.0 <= data$T4206600 & data$T4206600 <= 224.0] <- 200.0
data$T4206600[225.0 <= data$T4206600 & data$T4206600 <= 249.0] <- 225.0
data$T4206600[250.0 <= data$T4206600 & data$T4206600 <= 9.9999999E7] <- 250.0
data$T4206600 <- factor(data$T4206600,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T4206700[1.0 <= data$T4206700 & data$T4206700 <= 24.0] <- 1.0
data$T4206700[25.0 <= data$T4206700 & data$T4206700 <= 49.0] <- 25.0
data$T4206700[50.0 <= data$T4206700 & data$T4206700 <= 74.0] <- 50.0
data$T4206700[75.0 <= data$T4206700 & data$T4206700 <= 99.0] <- 75.0
data$T4206700[100.0 <= data$T4206700 & data$T4206700 <= 124.0] <- 100.0
data$T4206700[125.0 <= data$T4206700 & data$T4206700 <= 149.0] <- 125.0
data$T4206700[150.0 <= data$T4206700 & data$T4206700 <= 174.0] <- 150.0
data$T4206700[175.0 <= data$T4206700 & data$T4206700 <= 199.0] <- 175.0
data$T4206700[200.0 <= data$T4206700 & data$T4206700 <= 224.0] <- 200.0
data$T4206700[225.0 <= data$T4206700 & data$T4206700 <= 249.0] <- 225.0
data$T4206700[250.0 <= data$T4206700 & data$T4206700 <= 9.9999999E7] <- 250.0
data$T4206700 <- factor(data$T4206700,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T4914700[10.0 <= data$T4914700 & data$T4914700 <= 999.0] <- 10.0
data$T4914700 <- factor(data$T4914700,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
data$T5180600[1.0 <= data$T5180600 & data$T5180600 <= 24.0] <- 1.0
data$T5180600[25.0 <= data$T5180600 & data$T5180600 <= 49.0] <- 25.0
data$T5180600[50.0 <= data$T5180600 & data$T5180600 <= 74.0] <- 50.0
data$T5180600[75.0 <= data$T5180600 & data$T5180600 <= 99.0] <- 75.0
data$T5180600[100.0 <= data$T5180600 & data$T5180600 <= 124.0] <- 100.0
data$T5180600[125.0 <= data$T5180600 & data$T5180600 <= 149.0] <- 125.0
data$T5180600[150.0 <= data$T5180600 & data$T5180600 <= 174.0] <- 150.0
data$T5180600[175.0 <= data$T5180600 & data$T5180600 <= 199.0] <- 175.0
data$T5180600[200.0 <= data$T5180600 & data$T5180600 <= 224.0] <- 200.0
data$T5180600[225.0 <= data$T5180600 & data$T5180600 <= 249.0] <- 225.0
data$T5180600[250.0 <= data$T5180600 & data$T5180600 <= 9.9999999E7] <- 250.0
data$T5180600 <- factor(data$T5180600,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T5180700[1.0 <= data$T5180700 & data$T5180700 <= 24.0] <- 1.0
data$T5180700[25.0 <= data$T5180700 & data$T5180700 <= 49.0] <- 25.0
data$T5180700[50.0 <= data$T5180700 & data$T5180700 <= 74.0] <- 50.0
data$T5180700[75.0 <= data$T5180700 & data$T5180700 <= 99.0] <- 75.0
data$T5180700[100.0 <= data$T5180700 & data$T5180700 <= 124.0] <- 100.0
data$T5180700[125.0 <= data$T5180700 & data$T5180700 <= 149.0] <- 125.0
data$T5180700[150.0 <= data$T5180700 & data$T5180700 <= 174.0] <- 150.0
data$T5180700[175.0 <= data$T5180700 & data$T5180700 <= 199.0] <- 175.0
data$T5180700[200.0 <= data$T5180700 & data$T5180700 <= 224.0] <- 200.0
data$T5180700[225.0 <= data$T5180700 & data$T5180700 <= 249.0] <- 225.0
data$T5180700[250.0 <= data$T5180700 & data$T5180700 <= 9.9999999E7] <- 250.0
data$T5180700 <- factor(data$T5180700,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T7749900[1.0 <= data$T7749900 & data$T7749900 <= 24.0] <- 1.0
data$T7749900[25.0 <= data$T7749900 & data$T7749900 <= 49.0] <- 25.0
data$T7749900[50.0 <= data$T7749900 & data$T7749900 <= 74.0] <- 50.0
data$T7749900[75.0 <= data$T7749900 & data$T7749900 <= 99.0] <- 75.0
data$T7749900[100.0 <= data$T7749900 & data$T7749900 <= 124.0] <- 100.0
data$T7749900[125.0 <= data$T7749900 & data$T7749900 <= 149.0] <- 125.0
data$T7749900[150.0 <= data$T7749900 & data$T7749900 <= 174.0] <- 150.0
data$T7749900[175.0 <= data$T7749900 & data$T7749900 <= 199.0] <- 175.0
data$T7749900[200.0 <= data$T7749900 & data$T7749900 <= 224.0] <- 200.0
data$T7749900[225.0 <= data$T7749900 & data$T7749900 <= 249.0] <- 225.0
data$T7749900[250.0 <= data$T7749900 & data$T7749900 <= 9.9999999E7] <- 250.0
data$T7749900 <- factor(data$T7749900,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T7750000[1.0 <= data$T7750000 & data$T7750000 <= 24.0] <- 1.0
data$T7750000[25.0 <= data$T7750000 & data$T7750000 <= 49.0] <- 25.0
data$T7750000[50.0 <= data$T7750000 & data$T7750000 <= 74.0] <- 50.0
data$T7750000[75.0 <= data$T7750000 & data$T7750000 <= 99.0] <- 75.0
data$T7750000[100.0 <= data$T7750000 & data$T7750000 <= 124.0] <- 100.0
data$T7750000[125.0 <= data$T7750000 & data$T7750000 <= 149.0] <- 125.0
data$T7750000[150.0 <= data$T7750000 & data$T7750000 <= 174.0] <- 150.0
data$T7750000[175.0 <= data$T7750000 & data$T7750000 <= 199.0] <- 175.0
data$T7750000[200.0 <= data$T7750000 & data$T7750000 <= 224.0] <- 200.0
data$T7750000[225.0 <= data$T7750000 & data$T7750000 <= 249.0] <- 225.0
data$T7750000[250.0 <= data$T7750000 & data$T7750000 <= 9.9999999E7] <- 250.0
data$T7750000 <- factor(data$T7750000,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
data$T7750100[1.0 <= data$T7750100 & data$T7750100 <= 24.0] <- 1.0
data$T7750100[25.0 <= data$T7750100 & data$T7750100 <= 49.0] <- 25.0
data$T7750100[50.0 <= data$T7750100 & data$T7750100 <= 74.0] <- 50.0
data$T7750100[75.0 <= data$T7750100 & data$T7750100 <= 99.0] <- 75.0
data$T7750100[100.0 <= data$T7750100 & data$T7750100 <= 124.0] <- 100.0
data$T7750100[125.0 <= data$T7750100 & data$T7750100 <= 149.0] <- 125.0
data$T7750100[150.0 <= data$T7750100 & data$T7750100 <= 174.0] <- 150.0
data$T7750100[175.0 <= data$T7750100 & data$T7750100 <= 199.0] <- 175.0
data$T7750100[200.0 <= data$T7750100 & data$T7750100 <= 224.0] <- 200.0
data$T7750100[225.0 <= data$T7750100 & data$T7750100 <= 249.0] <- 225.0
data$T7750100[250.0 <= data$T7750100 & data$T7750100 <= 9.9999999E7] <- 250.0
data$T7750100 <- factor(data$T7750100,
levels=c(0.0,1.0,25.0,50.0,75.0,100.0,125.0,150.0,175.0,200.0,225.0,250.0),
labels=c("0",
"1 TO 24",
"25 TO 49",
"50 TO 74",
"75 TO 99",
"100 TO 124",
"125 TO 149",
"150 TO 174",
"175 TO 199",
"200 TO 224",
"225 TO 249",
"250 TO 99999999: 250+"))
return(data)
}

varlabels <- c("ID# (1-12686) 79",
"SAMPLE ID  79 INT",
"RACL/ETHNIC COHORT /SCRNR 79",
"SEX OF R 79",
"HGHST GRADE/YR COMPLTD & GOT CREDIT 2006",
"TTL CREDIT HRS EARNED AT SCHL L1 2006",
"TTL CREDIT HRS EARNED AT SCHL L2 2006",
"TTL CREDIT HRS EARNED AT SCHL L3 2006",
"# OF DRINKS R HAS ON AVERAGE DAY 2006",
"AGE AT INTERVIEW DATE 2006",
"HGHST GRADE/YR COMPLTD & GOT CREDIT 2008",
"TTL CREDIT HRS EARNED AT SCHL L1 2008",
"TTL CREDIT HRS EARNED AT SCHL L2 2008",
"TTL CREDIT HRS EARNED AT SCHL L3 2008",
"# OF DRINKS R HAS ON AVERAGE DAY 2008",
"AGE AT INTERVIEW DATE 2008",
"HGHST GRADE/YR COMPLTD & GOT CREDIT 2010",
"TTL CREDIT HRS EARNED AT SCHL L1 2010",
"TTL CREDIT HRS EARNED AT SCHL L2 2010",
"# OF DRINKS R HAS ON AVERAGE DAY 2010",
"AGE AT INTERVIEW DATE 2010",
"HGHST GRADE/YR COMPLTD & GOT CREDIT 2012",
"TTL CREDIT HRS EARNED AT SCHL L1 2012",
"TTL CREDIT HRS EARNED AT SCHL L2 2012",
"TTL CREDIT HRS EARNED AT SCHL L3 2012",
"# OF DRINKS R HAS ON AVERAGE DAY 2012",
"AGE AT INTERVIEW DATE 2012",
"HGHST GRADE/YR COMPLTD & GOT CREDIT 2014",
"TTL CREDIT HRS EARNED AT SCHL L1 2014",
"TTL CREDIT HRS EARNED AT SCHL L2 2014",
"TTL CREDIT HRS EARNED AT SCHL L3 2014",
"# OF DRINKS R HAS ON AVERAGE DAY 2014",
"R SATISFACTION WITH LIFE 2014",
"AGE AT INTERVIEW 2014",
"HGHST GRADE/YR COMPLTD & GOT CREDIT 2016",
"TTL CREDIT HRS EARNED AT SCHL L1 2016",
"TTL CREDIT HRS EARNED AT SCHL L2 2016",
"R SATISFACTION WITH LIFE 2016",
"AGE AT INTERVIEW 2016",
"HGHST GRADE/YR COMPLTD & GOT CREDIT 2018",
"TTL CREDIT HRS EARNED AT SCHL L1 2018",
"TTL CREDIT HRS EARNED AT SCHL L2 2018",
"TTL CREDIT HRS EARNED AT SCHL L3 2018",
"R SATISFACTION WITH LIFE 2018",
"AGE AT INTERVIEW 2018"
)


# Use qnames rather than rnums

qnames = function(data) {
names(data) <- c("CASEID_1979",
"SAMPLE_ID_1979",
"SAMPLE_RACE_78SCRN",
"SAMPLE_SEX_1979",
"Q3-4_2006",
"Q3-25.01_2006",
"Q3-25.02_2006",
"Q3-25.03_2006",
"Q12-6_2006",
"AGEATINT_2006",
"Q3-4_2008",
"Q3-25.01_2008",
"Q3-25.02_2008",
"Q3-25.03_2008",
"Q12-6_2008",
"AGEATINT_2008",
"Q3-4_2010",
"Q3-25.01_2010",
"Q3-25.02_2010",
"Q12-6_2010",
"AGEATINT_2010",
"Q3-4_2012",
"Q3-25.01_2012",
"Q3-25.02_2012",
"Q3-25.03_2012",
"Q12-6_2012",
"AGEATINT_2012",
"Q3-4_2014",
"Q3-25.01_2014",
"Q3-25.02_2014",
"Q3-25.03_2014",
"Q12-6_2014",
"LIFE-SATISFACTION_2014",
"AGEATINT_2014",
"Q3-4_2016",
"Q3-25.01_2016",
"Q3-25.02_2016",
"LIFE-SATISFACTION_2016",
"AGEATINT_2016",
"Q3-4_2018",
"Q3-25.01_2018",
"Q3-25.02_2018",
"Q3-25.03_2018",
"LIFE-SATISFACTION_2018",
"AGEATINT_2018")
return(data)
}


#********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels.
#categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers
#new_data <- qnames(new_data)
#categories <- qnames(categories)

# Produce summaries for the raw (uncategorized) data file
summary(new_data)

# Remove the '#' before the following lines to produce summaries for the "categories" data file.
#categories <- vallabels(new_data)
#categories <- vallabels_continuous(new_data)
#summary(categories)

#************************************************************************************************************

