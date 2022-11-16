options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'NLSY_satisfaction_alcohol_race_ethnicity_education.dat' lrecl=153 missover DSD DLM=' ' print;
input
  R0000100
  R0173600
  R0214700
  R0214800
  T0014400
  T0017900
  T0018000
  T0018100
  T0911300
  T0989000
  T1214300
  T1218200
  T1218300
  T1218400
  T2075600
  T2210800
  T2272800
  T2276100
  T2276200
  T3044200
  T3108700
  T3212900
  T3216800
  T3216900
  T3217000
  T3976400
  T4113200
  T4201100
  T4206500
  T4206600
  T4206700
  T4914700
  T5006600
  T5023600
  T5176100
  T5180600
  T5180700
  T5740700
  T5771500
  T7743900
  T7749900
  T7750000
  T7750100
  T8187800
  T8219400
;
array nvarlist _numeric_;


*---Recode missing values to SAS custom system missing. See SAS
      documentation for use of MISSING option in procedures, e.g. PROC FREQ;

do over nvarlist;
  if nvarlist = -1 then nvarlist = .R;  /* Refused */
  if nvarlist = -2 then nvarlist = .D;  /* Dont know */
  if nvarlist = -3 then nvarlist = .I;  /* Invalid missing */
  if nvarlist = -4 then nvarlist = .V;  /* Valid missing */
  if nvarlist = -5 then nvarlist = .N;  /* Non-interview */
end;

  label R0000100 = "ID# (1-12686) 79";
  label R0173600 = "SAMPLE ID  79 INT";
  label R0214700 = "RACL/ETHNIC COHORT /SCRNR 79";
  label R0214800 = "SEX OF R 79";
  label T0014400 = "HGHST GRADE/YR COMPLTD & GOT CREDIT 2006";
  label T0017900 = "TTL CREDIT HRS EARNED AT SCHL L1 2006";
  label T0018000 = "TTL CREDIT HRS EARNED AT SCHL L2 2006";
  label T0018100 = "TTL CREDIT HRS EARNED AT SCHL L3 2006";
  label T0911300 = "# OF DRINKS R HAS ON AVERAGE DAY 2006";
  label T0989000 = "AGE AT INTERVIEW DATE 2006";
  label T1214300 = "HGHST GRADE/YR COMPLTD & GOT CREDIT 2008";
  label T1218200 = "TTL CREDIT HRS EARNED AT SCHL L1 2008";
  label T1218300 = "TTL CREDIT HRS EARNED AT SCHL L2 2008";
  label T1218400 = "TTL CREDIT HRS EARNED AT SCHL L3 2008";
  label T2075600 = "# OF DRINKS R HAS ON AVERAGE DAY 2008";
  label T2210800 = "AGE AT INTERVIEW DATE 2008";
  label T2272800 = "HGHST GRADE/YR COMPLTD & GOT CREDIT 2010";
  label T2276100 = "TTL CREDIT HRS EARNED AT SCHL L1 2010";
  label T2276200 = "TTL CREDIT HRS EARNED AT SCHL L2 2010";
  label T3044200 = "# OF DRINKS R HAS ON AVERAGE DAY 2010";
  label T3108700 = "AGE AT INTERVIEW DATE 2010";
  label T3212900 = "HGHST GRADE/YR COMPLTD & GOT CREDIT 2012";
  label T3216800 = "TTL CREDIT HRS EARNED AT SCHL L1 2012";
  label T3216900 = "TTL CREDIT HRS EARNED AT SCHL L2 2012";
  label T3217000 = "TTL CREDIT HRS EARNED AT SCHL L3 2012";
  label T3976400 = "# OF DRINKS R HAS ON AVERAGE DAY 2012";
  label T4113200 = "AGE AT INTERVIEW DATE 2012";
  label T4201100 = "HGHST GRADE/YR COMPLTD & GOT CREDIT 2014";
  label T4206500 = "TTL CREDIT HRS EARNED AT SCHL L1 2014";
  label T4206600 = "TTL CREDIT HRS EARNED AT SCHL L2 2014";
  label T4206700 = "TTL CREDIT HRS EARNED AT SCHL L3 2014";
  label T4914700 = "# OF DRINKS R HAS ON AVERAGE DAY 2014";
  label T5006600 = "R SATISFACTION WITH LIFE 2014";
  label T5023600 = "AGE AT INTERVIEW 2014";
  label T5176100 = "HGHST GRADE/YR COMPLTD & GOT CREDIT 2016";
  label T5180600 = "TTL CREDIT HRS EARNED AT SCHL L1 2016";
  label T5180700 = "TTL CREDIT HRS EARNED AT SCHL L2 2016";
  label T5740700 = "R SATISFACTION WITH LIFE 2016";
  label T5771500 = "AGE AT INTERVIEW 2016";
  label T7743900 = "HGHST GRADE/YR COMPLTD & GOT CREDIT 2018";
  label T7749900 = "TTL CREDIT HRS EARNED AT SCHL L1 2018";
  label T7750000 = "TTL CREDIT HRS EARNED AT SCHL L2 2018";
  label T7750100 = "TTL CREDIT HRS EARNED AT SCHL L3 2018";
  label T8187800 = "R SATISFACTION WITH LIFE 2018";
  label T8219400 = "AGE AT INTERVIEW 2018";

/*---------------------------------------------------------------------*
 *  Crosswalk for Reference number & Question name                     *
 *---------------------------------------------------------------------*
 * Uncomment and edit this RENAME statement to rename variables
 * for ease of use.  You may need to use  name literal strings
 * e.g.  'variable-name'n   to create valid SAS variable names, or 
 * alter variables similarly named across years.
 * This command does not guarantee uniqueness

 * See SAS documentation for use of name literals and use of the
 * VALIDVARNAME=ANY option.     
 *---------------------------------------------------------------------*/
  /* *start* */

* RENAME
  R0000100 = 'CASEID_1979'n
  R0173600 = 'SAMPLE_ID_1979'n
  R0214700 = 'SAMPLE_RACE_78SCRN'n
  R0214800 = 'SAMPLE_SEX_1979'n
  T0014400 = 'Q3-4_2006'n
  T0017900 = 'Q3-25.01_2006'n
  T0018000 = 'Q3-25.02_2006'n
  T0018100 = 'Q3-25.03_2006'n
  T0911300 = 'Q12-6_2006'n
  T0989000 = 'AGEATINT_2006'n
  T1214300 = 'Q3-4_2008'n
  T1218200 = 'Q3-25.01_2008'n
  T1218300 = 'Q3-25.02_2008'n
  T1218400 = 'Q3-25.03_2008'n
  T2075600 = 'Q12-6_2008'n
  T2210800 = 'AGEATINT_2008'n
  T2272800 = 'Q3-4_2010'n
  T2276100 = 'Q3-25.01_2010'n
  T2276200 = 'Q3-25.02_2010'n
  T3044200 = 'Q12-6_2010'n
  T3108700 = 'AGEATINT_2010'n
  T3212900 = 'Q3-4_2012'n
  T3216800 = 'Q3-25.01_2012'n
  T3216900 = 'Q3-25.02_2012'n
  T3217000 = 'Q3-25.03_2012'n
  T3976400 = 'Q12-6_2012'n
  T4113200 = 'AGEATINT_2012'n
  T4201100 = 'Q3-4_2014'n
  T4206500 = 'Q3-25.01_2014'n
  T4206600 = 'Q3-25.02_2014'n
  T4206700 = 'Q3-25.03_2014'n
  T4914700 = 'Q12-6_2014'n
  T5006600 = 'LIFE-SATISFACTION_2014'n
  T5023600 = 'AGEATINT_2014'n
  T5176100 = 'Q3-4_2016'n
  T5180600 = 'Q3-25.01_2016'n
  T5180700 = 'Q3-25.02_2016'n
  T5740700 = 'LIFE-SATISFACTION_2016'n
  T5771500 = 'AGEATINT_2016'n
  T7743900 = 'Q3-4_2018'n
  T7749900 = 'Q3-25.01_2018'n
  T7750000 = 'Q3-25.02_2018'n
  T7750100 = 'Q3-25.03_2018'n
  T8187800 = 'LIFE-SATISFACTION_2018'n
  T8219400 = 'AGEATINT_2018'n
;
  /* *finish* */

run;

proc means data=new_data n mean min max;
run;


/*---------------------------------------------------------------------*
 *  FORMATTED TABULATIONS                                              *
 *---------------------------------------------------------------------*
 * You can uncomment and edit the PROC FORMAT and PROC FREQ statements 
 * provided below to obtain formatted tabulations. The tabulations 
 * should reflect codebook values.
 * 
 * Please edit the formats below reflect any renaming of the variables
 * you may have done in the first data step. 
 *---------------------------------------------------------------------*/

/*
proc format; 
value vx1f
  1='CROSS MALE WHITE'
  2='CROSS MALE WH. POOR'
  3='CROSS MALE BLACK'
  4='CROSS MALE HISPANIC'
  5='CROSS FEMALE WHITE'
  6='CROSS FEMALE WH POOR'
  7='CROSS FEMALE BLACK'
  8='CROSS FEMALE HISPANIC'
  9='SUP MALE WH POOR'
  10='SUP MALE BLACK'
  11='SUP MALE HISPANIC'
  12='SUP FEM WH POOR'
  13='SUP FEMALE BLACK'
  14='SUP FEMALE HISPANIC'
  15='MIL MALE WHITE'
  16='MIL MALE BLACK'
  17='MIL MALE HISPANIC'
  18='MIL FEMALE WHITE'
  19='MIL FEMALE BLACK'
  20='MIL FEMALE HISPANIC'
;
value vx2f
  1='HISPANIC'
  2='BLACK'
  3='NON-BLACK, NON-HISPANIC'
;
value vx3f
  1='MALE'
  2='FEMALE'
;
value vx4f
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx5f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx6f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx7f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx8f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx9f
  40='40'
  41='41'
  42='42'
  43='43'
  44='44'
  45='45'
  46='46'
  47='47'
  48='48'
  49='49'
  50='50'
  51='51'
  52='52'
;
value vx10f
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx11f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx12f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx13f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx14f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx15f
  40='40'
  41='41'
  42='42'
  43='43'
  44='44'
  45='45'
  46='46'
  47='47'
  48='48'
  49='49'
  50='50'
  51='51'
  52='52'
;
value vx16f
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx17f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx18f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx19f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx20f
  40='40'
  41='41'
  42='42'
  43='43'
  44='44'
  45='45'
  46='46'
  47='47'
  48='48'
  49='49'
  50='50'
  51='51'
  52='52'
  53='53'
;
value vx21f
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx22f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx23f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx24f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx25f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx26f
  40='40'
  41='41'
  42='42'
  43='43'
  44='44'
  45='45'
  46='46'
  47='47'
  48='48'
  49='49'
  50='50'
  51='51'
  52='52'
  53='53'
  54='54'
  55='55'
  56='56'
;
value vx27f
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx28f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx29f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx30f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx31f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx32f
  1='1 (not at all satisfied)'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7 (completely satisfied)'
;
value vx33f
  40='40'
  41='41'
  42='42'
  43='43'
  44='44'
  45='45'
  46='46'
  47='47'
  48='48'
  49='49'
  50='50'
  51='51'
  52='52'
  53='53'
  54='54'
  55='55'
  56='56'
  57='57'
  58='58'
;
value vx34f
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx35f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx36f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx37f
  1='1 (not at all satisfied)'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7 (completely satisfied)'
;
value vx38f
  40='40'
  41='41'
  42='42'
  43='43'
  44='44'
  45='45'
  46='46'
  47='47'
  48='48'
  49='49'
  50='50'
  51='51'
  52='52'
  53='53'
  54='54'
  55='55'
  56='56'
  57='57'
  58='58'
  59='59'
  60='60'
  61='61'
  62='62'
;
value vx39f
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx40f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx41f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx42f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx43f
  1='1 (not at all satisfied)'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7 (completely satisfied)'
;
value vx44f
  40='40'
  41='41'
  42='42'
  43='43'
  44='44'
  45='45'
  46='46'
  47='47'
  48='48'
  49='49'
  50='50'
  51='51'
  52='52'
  53='53'
  54='54'
  55='55'
  56='56'
  57='57'
  58='58'
  59='59'
  60='60'
  61='61'
  62='62'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format R0173600 vx1f.;
  format R0214700 vx2f.;
  format R0214800 vx3f.;
  format T0014400 vx4f.;
  format T0017900 vx5f.;
  format T0018000 vx6f.;
  format T0018100 vx7f.;
  format T0911300 vx8f.;
  format T0989000 vx9f.;
  format T1214300 vx10f.;
  format T1218200 vx11f.;
  format T1218300 vx12f.;
  format T1218400 vx13f.;
  format T2075600 vx14f.;
  format T2210800 vx15f.;
  format T2272800 vx16f.;
  format T2276100 vx17f.;
  format T2276200 vx18f.;
  format T3044200 vx19f.;
  format T3108700 vx20f.;
  format T3212900 vx21f.;
  format T3216800 vx22f.;
  format T3216900 vx23f.;
  format T3217000 vx24f.;
  format T3976400 vx25f.;
  format T4113200 vx26f.;
  format T4201100 vx27f.;
  format T4206500 vx28f.;
  format T4206600 vx29f.;
  format T4206700 vx30f.;
  format T4914700 vx31f.;
  format T5006600 vx32f.;
  format T5023600 vx33f.;
  format T5176100 vx34f.;
  format T5180600 vx35f.;
  format T5180700 vx36f.;
  format T5740700 vx37f.;
  format T5771500 vx38f.;
  format T7743900 vx39f.;
  format T7749900 vx40f.;
  format T7750000 vx41f.;
  format T7750100 vx42f.;
  format T8187800 vx43f.;
  format T8219400 vx44f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format 'SAMPLE_ID_1979'n vx1f.;
  format 'SAMPLE_RACE_78SCRN'n vx2f.;
  format 'SAMPLE_SEX_1979'n vx3f.;
  format 'Q3-4_2006'n vx4f.;
  format 'Q3-25.01_2006'n vx5f.;
  format 'Q3-25.02_2006'n vx6f.;
  format 'Q3-25.03_2006'n vx7f.;
  format 'Q12-6_2006'n vx8f.;
  format 'AGEATINT_2006'n vx9f.;
  format 'Q3-4_2008'n vx10f.;
  format 'Q3-25.01_2008'n vx11f.;
  format 'Q3-25.02_2008'n vx12f.;
  format 'Q3-25.03_2008'n vx13f.;
  format 'Q12-6_2008'n vx14f.;
  format 'AGEATINT_2008'n vx15f.;
  format 'Q3-4_2010'n vx16f.;
  format 'Q3-25.01_2010'n vx17f.;
  format 'Q3-25.02_2010'n vx18f.;
  format 'Q12-6_2010'n vx19f.;
  format 'AGEATINT_2010'n vx20f.;
  format 'Q3-4_2012'n vx21f.;
  format 'Q3-25.01_2012'n vx22f.;
  format 'Q3-25.02_2012'n vx23f.;
  format 'Q3-25.03_2012'n vx24f.;
  format 'Q12-6_2012'n vx25f.;
  format 'AGEATINT_2012'n vx26f.;
  format 'Q3-4_2014'n vx27f.;
  format 'Q3-25.01_2014'n vx28f.;
  format 'Q3-25.02_2014'n vx29f.;
  format 'Q3-25.03_2014'n vx30f.;
  format 'Q12-6_2014'n vx31f.;
  format 'LIFE-SATISFACTION_2014'n vx32f.;
  format 'AGEATINT_2014'n vx33f.;
  format 'Q3-4_2016'n vx34f.;
  format 'Q3-25.01_2016'n vx35f.;
  format 'Q3-25.02_2016'n vx36f.;
  format 'LIFE-SATISFACTION_2016'n vx37f.;
  format 'AGEATINT_2016'n vx38f.;
  format 'Q3-4_2018'n vx39f.;
  format 'Q3-25.01_2018'n vx40f.;
  format 'Q3-25.02_2018'n vx41f.;
  format 'Q3-25.03_2018'n vx42f.;
  format 'LIFE-SATISFACTION_2018'n vx43f.;
  format 'AGEATINT_2018'n vx44f.;
run;
*/