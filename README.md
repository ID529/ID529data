Teaching Dataset for ID529 — Data Management and Analytic Workflows in R
<a href='https://id529.github.io'><img src='https://github.com/ID529/lectures/raw/testa_dec19/graphics/id529-sticker.png' align='right' height='139' /></a>
================

This is an R package that you can install with the following R code:

``` r
# install devtools if you haven't already
install.packages("devtools")

library(devtools)
devtools::install_github("ID529/ID529data")
```

Once you’ve installed the package, you can load the package and the
`nhanes` dataset built into it. This will be our primary dataset for
teaching examples.

``` r
library(ID529data)
data(nhanes, package = 'ID529data')
```

## Documentation

The documentation for the dataset can be accessed by running `?nhanes`
after loading the data.

## Data Labels

The data comes with a built-in data dictionary:

``` r
labelled::generate_dictionary(nhanes, details = 'full')
```

``` txt
 pos variable                                                 label                                                                                                               col_type values              
 1   id                                                       —                                                                                                                   chr      range: 73568 - 83726
 2   race_ethnicity                                           Race/Ethnicity                                                                                                      fct      Non-Hispanic White  
                                                                                                                                                                                           Non-Hispanic Black  
                                                                                                                                                                                           Hispanic            
 3   sex_gender                                               Sex/Gender [as binary]                                                                                              fct      Male                
                                                                                                                                                                                           Female              
 4   poverty_ratio                                            Ratio of Household Income to US Federal Poverty Line. The value was not computed if the respondent only reported i~ dbl      range: 0 - 5        
 5   days_dental_floss                                        Days [Reported] Respondents Floss per Week [days/week]                                                              dbl      range: 0 - 7        
 6   PFAS_total                                               Perfluoroalkyl and Polyfluoroalkyl Substances [ng/mL]                                                               dbl      range: 0.49 - 1423.1
 7   PFOS                                                     Perfluorooctane Sulfonate [ng/mL]                                                                                   dbl      range: 0.14 - 1403  
 8   PFOA                                                     Perfluorooctanoic Acid [ng/mL]                                                                                      dbl      range: 0.14 - 85.27 
 9   PFNA                                                     Perfluorononanoic Acid [ng/mL]                                                                                      dbl      range: 0.07 - 16.3  
 10  PFHS                                                     Perfluorohexane Sulfonate [ng/mL]                                                                                   dbl      range: 0.07 - 33.9  
 11  PFDE                                                     Perfluorodecanoic Acid [ng/mL]                                                                                      dbl      range: 0.07 - 51.3  
 12  total_energy                                             Calories in Daily Dietary Intake [reported] [kCal]                                                                  dbl      range: 130 - 12108  
 13  fast_food_energy_no_popcorn_no_seafood                   Calories from fast food excluding popcorn and seafood in daily dietary recall [kCal]                                dbl      range: 0 - 7539     
 14  restaurant_energy_no_popcorn_no_seafood                  Calories from food at restaurants excluding popcorn and seafood in daily dietary recall [kCal]                      dbl      range: 0 - 3424     
 15  non_fast_food_or_restaurant_energy_no_popcorn_no_seafood Calories from food that is not from fast food or restaurants excluding popcorn and seafood in dietary recall [kCal] dbl      range: 0 - 10765    
 16  popcorn_energy                                           Calories from popcorn in dietary recall [kCal]                                                                      dbl      range: 0 - 852      
 17  shellfish_energy                                         Calories from shellfish in dietary recall [kCal]                                                                    dbl      range: 0 - 1039     
 18  fish_energy                                              Calories from fish in dietary recall [kCal]                                                                         dbl      range: 0 - 1518     
```

For any single variable, the description can be retrieved using
`var_label` from the `labelled` package.

``` r
labelled::var_label(x = nhanes$poverty_ratio)
```

    ## [1] "Ratio of Household Income to US Federal Poverty Line. The value was not computed if the respondent only reported income as < $20,000 or ≥ $20,000. If family income was reported as a more detailed category, the midpoint of the range was used to compute the ratio. Values at or above 5.00 were coded as 5.00 or more because of disclosure concerns."

## Correlation among quantitative variables

``` r
library(ggcorrplot)

cor_mat <- cor(nhanes %>% dplyr::select(where(is.numeric)), use = 'pairwise.complete.obs')

ggcorrplot::ggcorrplot(
  cor_mat,
  hc.order = TRUE,
  type = "lower",
  outline.color = "white",
  ggtheme = ggplot2::theme_gray,
  colors = c("#6D9EC1", "white", "#E46726"),
  lab = TRUE)
```

![](README_files/figure-gfm/correlation%20figure-1.png)<!-- -->
