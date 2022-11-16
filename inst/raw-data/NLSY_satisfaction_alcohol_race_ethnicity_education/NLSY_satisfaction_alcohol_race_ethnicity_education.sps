file handle pcdat/name='NLSY_satisfaction_alcohol_race_ethnicity_education.dat' /lrecl=153.
data list file pcdat free /
  R0000100 (F5)
  R0173600 (F2)
  R0214700 (F2)
  R0214800 (F2)
  T0014400 (F2)
  T0017900 (F3)
  T0018000 (F3)
  T0018100 (F2)
  T0911300 (F2)
  T0989000 (F2)
  T1214300 (F2)
  T1218200 (F3)
  T1218300 (F3)
  T1218400 (F2)
  T2075600 (F2)
  T2210800 (F2)
  T2272800 (F2)
  T2276100 (F3)
  T2276200 (F3)
  T3044200 (F2)
  T3108700 (F2)
  T3212900 (F2)
  T3216800 (F3)
  T3216900 (F3)
  T3217000 (F3)
  T3976400 (F2)
  T4113200 (F2)
  T4201100 (F2)
  T4206500 (F3)
  T4206600 (F2)
  T4206700 (F2)
  T4914700 (F2)
  T5006600 (F2)
  T5023600 (F2)
  T5176100 (F2)
  T5180600 (F3)
  T5180700 (F2)
  T5740700 (F2)
  T5771500 (F2)
  T7743900 (F2)
  T7749900 (F3)
  T7750000 (F3)
  T7750100 (F2)
  T8187800 (F2)
  T8219400 (F2)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  R0000100  "ID# (1-12686) 79"
  R0173600  "SAMPLE ID  79 INT"
  R0214700  "RACL/ETHNIC COHORT /SCRNR 79"
  R0214800  "SEX OF R 79"
  T0014400  "HGHST GRADE/YR COMPLTD & GOT CREDIT 2006"
  T0017900  "TTL CREDIT HRS EARNED AT SCHL L1 2006"
  T0018000  "TTL CREDIT HRS EARNED AT SCHL L2 2006"
  T0018100  "TTL CREDIT HRS EARNED AT SCHL L3 2006"
  T0911300  "# OF DRINKS R HAS ON AVERAGE DAY 2006"
  T0989000  "AGE AT INTERVIEW DATE 2006"
  T1214300  "HGHST GRADE/YR COMPLTD & GOT CREDIT 2008"
  T1218200  "TTL CREDIT HRS EARNED AT SCHL L1 2008"
  T1218300  "TTL CREDIT HRS EARNED AT SCHL L2 2008"
  T1218400  "TTL CREDIT HRS EARNED AT SCHL L3 2008"
  T2075600  "# OF DRINKS R HAS ON AVERAGE DAY 2008"
  T2210800  "AGE AT INTERVIEW DATE 2008"
  T2272800  "HGHST GRADE/YR COMPLTD & GOT CREDIT 2010"
  T2276100  "TTL CREDIT HRS EARNED AT SCHL L1 2010"
  T2276200  "TTL CREDIT HRS EARNED AT SCHL L2 2010"
  T3044200  "# OF DRINKS R HAS ON AVERAGE DAY 2010"
  T3108700  "AGE AT INTERVIEW DATE 2010"
  T3212900  "HGHST GRADE/YR COMPLTD & GOT CREDIT 2012"
  T3216800  "TTL CREDIT HRS EARNED AT SCHL L1 2012"
  T3216900  "TTL CREDIT HRS EARNED AT SCHL L2 2012"
  T3217000  "TTL CREDIT HRS EARNED AT SCHL L3 2012"
  T3976400  "# OF DRINKS R HAS ON AVERAGE DAY 2012"
  T4113200  "AGE AT INTERVIEW DATE 2012"
  T4201100  "HGHST GRADE/YR COMPLTD & GOT CREDIT 2014"
  T4206500  "TTL CREDIT HRS EARNED AT SCHL L1 2014"
  T4206600  "TTL CREDIT HRS EARNED AT SCHL L2 2014"
  T4206700  "TTL CREDIT HRS EARNED AT SCHL L3 2014"
  T4914700  "# OF DRINKS R HAS ON AVERAGE DAY 2014"
  T5006600  "R SATISFACTION WITH LIFE 2014"
  T5023600  "AGE AT INTERVIEW 2014"
  T5176100  "HGHST GRADE/YR COMPLTD & GOT CREDIT 2016"
  T5180600  "TTL CREDIT HRS EARNED AT SCHL L1 2016"
  T5180700  "TTL CREDIT HRS EARNED AT SCHL L2 2016"
  T5740700  "R SATISFACTION WITH LIFE 2016"
  T5771500  "AGE AT INTERVIEW 2016"
  T7743900  "HGHST GRADE/YR COMPLTD & GOT CREDIT 2018"
  T7749900  "TTL CREDIT HRS EARNED AT SCHL L1 2018"
  T7750000  "TTL CREDIT HRS EARNED AT SCHL L2 2018"
  T7750100  "TTL CREDIT HRS EARNED AT SCHL L3 2018"
  T8187800  "R SATISFACTION WITH LIFE 2018"
  T8219400  "AGE AT INTERVIEW 2018"
.

* Recode continuous values. 
* recode 
    / 
 T0017900 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T0018000 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T0018100 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T0911300 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T1218200 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T1218300 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T1218400 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T2075600 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T2276100 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T2276200 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T3044200 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T3216800 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T3216900 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T3217000 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T3976400 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T4206500 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T4206600 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T4206700 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T4914700 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T5180600 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T5180700 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T7749900 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T7750000 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T7750100 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
.

* value labels
 R0173600
    1 "CROSS MALE WHITE"
    2 "CROSS MALE WH. POOR"
    3 "CROSS MALE BLACK"
    4 "CROSS MALE HISPANIC"
    5 "CROSS FEMALE WHITE"
    6 "CROSS FEMALE WH POOR"
    7 "CROSS FEMALE BLACK"
    8 "CROSS FEMALE HISPANIC"
    9 "SUP MALE WH POOR"
    10 "SUP MALE BLACK"
    11 "SUP MALE HISPANIC"
    12 "SUP FEM WH POOR"
    13 "SUP FEMALE BLACK"
    14 "SUP FEMALE HISPANIC"
    15 "MIL MALE WHITE"
    16 "MIL MALE BLACK"
    17 "MIL MALE HISPANIC"
    18 "MIL FEMALE WHITE"
    19 "MIL FEMALE BLACK"
    20 "MIL FEMALE HISPANIC"
    /
 R0214700
    1 "HISPANIC"
    2 "BLACK"
    3 "NON-BLACK, NON-HISPANIC"
    /
 R0214800
    1 "MALE"
    2 "FEMALE"
    /
 T0014400
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 T0017900
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T0018000
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T0018100
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T0911300
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T0989000
    40 "40"
    41 "41"
    42 "42"
    43 "43"
    44 "44"
    45 "45"
    46 "46"
    47 "47"
    48 "48"
    49 "49"
    50 "50"
    51 "51"
    52 "52"
    /
 T1214300
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 T1218200
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T1218300
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T1218400
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T2075600
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T2210800
    40 "40"
    41 "41"
    42 "42"
    43 "43"
    44 "44"
    45 "45"
    46 "46"
    47 "47"
    48 "48"
    49 "49"
    50 "50"
    51 "51"
    52 "52"
    /
 T2272800
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 T2276100
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T2276200
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T3044200
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T3108700
    40 "40"
    41 "41"
    42 "42"
    43 "43"
    44 "44"
    45 "45"
    46 "46"
    47 "47"
    48 "48"
    49 "49"
    50 "50"
    51 "51"
    52 "52"
    53 "53"
    /
 T3212900
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 T3216800
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T3216900
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T3217000
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T3976400
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T4113200
    40 "40"
    41 "41"
    42 "42"
    43 "43"
    44 "44"
    45 "45"
    46 "46"
    47 "47"
    48 "48"
    49 "49"
    50 "50"
    51 "51"
    52 "52"
    53 "53"
    54 "54"
    55 "55"
    56 "56"
    /
 T4201100
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 T4206500
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T4206600
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T4206700
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T4914700
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T5006600
    1 "1 (not at all satisfied)"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7 (completely satisfied)"
    /
 T5023600
    40 "40"
    41 "41"
    42 "42"
    43 "43"
    44 "44"
    45 "45"
    46 "46"
    47 "47"
    48 "48"
    49 "49"
    50 "50"
    51 "51"
    52 "52"
    53 "53"
    54 "54"
    55 "55"
    56 "56"
    57 "57"
    58 "58"
    /
 T5176100
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 T5180600
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T5180700
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T5740700
    1 "1 (not at all satisfied)"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7 (completely satisfied)"
    /
 T5771500
    40 "40"
    41 "41"
    42 "42"
    43 "43"
    44 "44"
    45 "45"
    46 "46"
    47 "47"
    48 "48"
    49 "49"
    50 "50"
    51 "51"
    52 "52"
    53 "53"
    54 "54"
    55 "55"
    56 "56"
    57 "57"
    58 "58"
    59 "59"
    60 "60"
    61 "61"
    62 "62"
    /
 T7743900
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 T7749900
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T7750000
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T7750100
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T8187800
    1 "1 (not at all satisfied)"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7 (completely satisfied)"
    /
 T8219400
    40 "40"
    41 "41"
    42 "42"
    43 "43"
    44 "44"
    45 "45"
    46 "46"
    47 "47"
    48 "48"
    49 "49"
    50 "50"
    51 "51"
    52 "52"
    53 "53"
    54 "54"
    55 "55"
    56 "56"
    57 "57"
    58 "58"
    59 "59"
    60 "60"
    61 "61"
    62 "62"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */  /* *start* */

* RENAME VARIABLES
  (R0000100 = CASEID_1979) 
  (R0173600 = SAMPLE_ID_1979) 
  (R0214700 = SAMPLE_RACE_78SCRN) 
  (R0214800 = SAMPLE_SEX_1979) 
  (T0014400 = Q3_4_2006)   /* Q3-4 */
  (T0017900 = Q3_25_01_2006)   /* Q3-25.01 */
  (T0018000 = Q3_25_02_2006)   /* Q3-25.02 */
  (T0018100 = Q3_25_03_2006)   /* Q3-25.03 */
  (T0911300 = Q12_6_2006)   /* Q12-6 */
  (T0989000 = AGEATINT_2006) 
  (T1214300 = Q3_4_2008)   /* Q3-4 */
  (T1218200 = Q3_25_01_2008)   /* Q3-25.01 */
  (T1218300 = Q3_25_02_2008)   /* Q3-25.02 */
  (T1218400 = Q3_25_03_2008)   /* Q3-25.03 */
  (T2075600 = Q12_6_2008)   /* Q12-6 */
  (T2210800 = AGEATINT_2008) 
  (T2272800 = Q3_4_2010)   /* Q3-4 */
  (T2276100 = Q3_25_01_2010)   /* Q3-25.01 */
  (T2276200 = Q3_25_02_2010)   /* Q3-25.02 */
  (T3044200 = Q12_6_2010)   /* Q12-6 */
  (T3108700 = AGEATINT_2010) 
  (T3212900 = Q3_4_2012)   /* Q3-4 */
  (T3216800 = Q3_25_01_2012)   /* Q3-25.01 */
  (T3216900 = Q3_25_02_2012)   /* Q3-25.02 */
  (T3217000 = Q3_25_03_2012)   /* Q3-25.03 */
  (T3976400 = Q12_6_2012)   /* Q12-6 */
  (T4113200 = AGEATINT_2012) 
  (T4201100 = Q3_4_2014)   /* Q3-4 */
  (T4206500 = Q3_25_01_2014)   /* Q3-25.01 */
  (T4206600 = Q3_25_02_2014)   /* Q3-25.02 */
  (T4206700 = Q3_25_03_2014)   /* Q3-25.03 */
  (T4914700 = Q12_6_2014)   /* Q12-6 */
  (T5006600 = LIFE_SATISFACTION_2014)   /* LIFE-SATISFACTION */
  (T5023600 = AGEATINT_2014) 
  (T5176100 = Q3_4_2016)   /* Q3-4 */
  (T5180600 = Q3_25_01_2016)   /* Q3-25.01 */
  (T5180700 = Q3_25_02_2016)   /* Q3-25.02 */
  (T5740700 = LIFE_SATISFACTION_2016)   /* LIFE-SATISFACTION */
  (T5771500 = AGEATINT_2016) 
  (T7743900 = Q3_4_2018)   /* Q3-4 */
  (T7749900 = Q3_25_01_2018)   /* Q3-25.01 */
  (T7750000 = Q3_25_02_2018)   /* Q3-25.02 */
  (T7750100 = Q3_25_03_2018)   /* Q3-25.03 */
  (T8187800 = LIFE_SATISFACTION_2018)   /* LIFE-SATISFACTION */
  (T8219400 = AGEATINT_2018) 
.
  /* *end* */

descriptives all.

*--- Tabulations using reference number variables.
*freq var=R0000100, 
  R0173600, 
  R0214700, 
  R0214800, 
  T0014400, 
  T0017900, 
  T0018000, 
  T0018100, 
  T0911300, 
  T0989000, 
  T1214300, 
  T1218200, 
  T1218300, 
  T1218400, 
  T2075600, 
  T2210800, 
  T2272800, 
  T2276100, 
  T2276200, 
  T3044200, 
  T3108700, 
  T3212900, 
  T3216800, 
  T3216900, 
  T3217000, 
  T3976400, 
  T4113200, 
  T4201100, 
  T4206500, 
  T4206600, 
  T4206700, 
  T4914700, 
  T5006600, 
  T5023600, 
  T5176100, 
  T5180600, 
  T5180700, 
  T5740700, 
  T5771500, 
  T7743900, 
  T7749900, 
  T7750000, 
  T7750100, 
  T8187800, 
  T8219400.

*--- Tabulations using qname variables.
*freq var=CASEID_1979, 
  SAMPLE_ID_1979, 
  SAMPLE_RACE_78SCRN, 
  SAMPLE_SEX_1979, 
  Q3_4_2006, 
  Q3_25_01_2006, 
  Q3_25_02_2006, 
  Q3_25_03_2006, 
  Q12_6_2006, 
  AGEATINT_2006, 
  Q3_4_2008, 
  Q3_25_01_2008, 
  Q3_25_02_2008, 
  Q3_25_03_2008, 
  Q12_6_2008, 
  AGEATINT_2008, 
  Q3_4_2010, 
  Q3_25_01_2010, 
  Q3_25_02_2010, 
  Q12_6_2010, 
  AGEATINT_2010, 
  Q3_4_2012, 
  Q3_25_01_2012, 
  Q3_25_02_2012, 
  Q3_25_03_2012, 
  Q12_6_2012, 
  AGEATINT_2012, 
  Q3_4_2014, 
  Q3_25_01_2014, 
  Q3_25_02_2014, 
  Q3_25_03_2014, 
  Q12_6_2014, 
  LIFE_SATISFACTION_2014, 
  AGEATINT_2014, 
  Q3_4_2016, 
  Q3_25_01_2016, 
  Q3_25_02_2016, 
  LIFE_SATISFACTION_2016, 
  AGEATINT_2016, 
  Q3_4_2018, 
  Q3_25_01_2018, 
  Q3_25_02_2018, 
  Q3_25_03_2018, 
  LIFE_SATISFACTION_2018, 
  AGEATINT_2018.
