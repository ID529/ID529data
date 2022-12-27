#' Sociodemographics, Dietary Patterns, and PFAS Levels from NHANES 2013-2014
#'
#' A subset of data from the National Health and Nutrition Examination Survey
#' 2013-2014.
#'
#' These data are based on the data used in the 2019 article *Dietary Habits
#' Related to Food Packaging and Population Exposure to PFASs* by Herbert P.
#' Susmann, Laurel A. Schaider, Kathryn M. Rodgers, and Ruthann A. Rudel. 9
#' October 2019. \url{https://doi.org/10.1289/EHP4092} Published in Environmental
#' Health Perspectives.
#'
#' The supplemental data these are based on are available here:
#' \url{https://ehp.niehs.nih.gov/doi/suppl/10.1289/EHP4092}
#'
#' @format `nhanes`
#' A data frame with 2,339 rows and 18 columns:
#' \describe{
#'   \item{id}{Unique identifier for individuals in NHANES}
#'   \item{race_ethnicity}{Race/Ethnicity: one of non-Hispanic White, non-Hispanic Black, or Hispanic}
#'   \item{sex_gender}{Sex/Gender [as binary]}
#'   \item{age}{Age [in years] at screening}
#'   \item{poverty_ratio}{Ratio of Household Income to US Federal Poverty Line}
#'   \item{days_dental_floss}{Days [Reported] Respondents Floss per Week [days/week]}
#'   \item{PFAS_total}{Perfluoroalkyl and Polyfluoroalkyl Substances [ng/mL]}
#'   \item{PFOS}{Perfluorooctane Sulfonate [ng/mL]}
#'   \item{PFOA}{Perfluorooctanoic Acid [ng/mL]}
#'   \item{PFNA}{Perfluorononanoic Acid [ng/mL]}
#'   \item{PFHS}{Perfluorohexane Sulfonate [ng/mL]}
#'   \item{PFDE}{Perfluorodecanoic Acid [ng/mL]}
#'   \item{total_energy}{Calories in Daily Dietary Intake [reported] [kCal]}
#'   \item{fast_food_energy_no_popcorn_no_seafood}{Calories from fast food excluding popcorn and seafood in daily dietary recall [kCal]}
#'   \item{restaurant_energy_no_popcorn_no_seafood}{Calories from food at restaurants excluding popcorn and seafood in daily dietary recall [kCal]}
#'   \item{non_fast_food_or_restaurant_energy_no_popcorn_no_seafood}{Calories from food that is not from fast food or restaurants excluding popcorn and seafood in dietary recall [kCal]}
#'   \item{popcorn_energy}{Calories from popcorn in dietary recall [kCal]}
#'   \item{shellfish_energy}{Calories from shellfish in dietary recall [kCal]}
#'   \item{fish_energy}{Calories from fish in dietary recall [kCal]}
#'   \item{weight}{Weight [kg]}
#'   \item{height}{Height [cm]}
#'   \item{mean_BP}{Mean Systolic Blood Pressure [mm Hg]}
#' }
#'
#' @source \url{https://www.cdc.gov/nchs/nhanes/index.htm}
#' @source \url{https://ehp.niehs.nih.gov/doi/10.1289/EHP4092}
#' @source \url{https://ehp.niehs.nih.gov/doi/suppl/10.1289/EHP4092}
"nhanes"
