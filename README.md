# Prepared Datasets for ID529 — Data Management and Analytic Workflows in R

This is an R package that you can install with the following code: 

```r
# install devtools if you haven't already
install.packages("devtools")

library(devtools)
devtools::install_github("ID529/ID529data")
```

## Overview 

We've prepared the following datasets for you: 

- A sample of measures and participants from NHANES III (1988-1994)
- County level data from CDC WONDER on heart-disease mortality
- A sample of data from the NLSY on education, race/ethnicity, alcohol use, and 
  life satisfaction

### NHANES III (1988-1994)

[NHANES](https://wwwn.cdc.gov/nchs/nhanes/) stands for the National Health and
Nutrition Examination Survey, which is a survey that has been conducted by CDC's
National Center for Health Statistics going back to 1971 under the name NHANES
and had predecessors that started in 1959.  The NHANES data are repeated
cross-sectional data of a nationwide probability sample.

We're using NHANES III as one of our example datasets because of its older
formatting and the unique features that come with that.  Back in the day, data
used to be stored on magnetic tape reels (imagine like a bigger, older version
of a music tape cassette) and because data storage was much more expensive,
certain techniques were used to maximize the density with which data was stored.

![CDC 679-6 Magnetic Tape Transport](https://upload.wikimedia.org/wikipedia/commons/6/61/CDC_679-6_Magnetic_Tape_Transport.jpg)

The most salient aspect that researchers need to deal with on a regular basis is
figuring out how to deal with what are called "fixed width files" where every 
row of the data contain the same number of characters. 

If you open up the file, you'll find a couple things: 

  1. It's really just a text-file
  2. Every line has the same number of characters
  3. There's a lot of spaces where data were not recorded (e.g., for people for whom the questions did not apply)
  4. Basically all of it is numeric data.  Some of them are integers and some are 
     real valued (i.e., decimal numbers)

![NHANES fixed width data zoomed out](images/NHANES_wide.png)

![NHANES fixed width data zoomed in](images/NHANES_zoomed.png)

You can find the documentation for NHANES III here:
<https://wwwn.cdc.gov/nchs/nhanes/nhanes3/datafiles.aspx#core>

### CDC WONDER


### NLSY