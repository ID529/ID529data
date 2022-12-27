
# The data we're extracting from the NHANES is based on this source:
#
# Dietary Habits Related to Food Packaging and Population Exposure to PFASs
# https://ehp.niehs.nih.gov/doi/10.1289/EHP4092
#  Herbert P. Susmann, Laurel A. Schaider, Kathryn M. Rodgers, and Ruthann A. Rudel
# 9 October 2019CID: 107003https://doi.org/10.1289/EHP4092
# Published in Environmental Health Perspectives
#
# The supplemental data are available here:
# https://ehp.niehs.nih.gov/doi/suppl/10.1289/EHP4092
#
#

#' Download and Clean NHNAES data
#'
#' This function downloads NHANES data, cleans it, and stores it inside this
#' package. This function is meant for the ID529data package developers to use
#' and is not exported for general use.  The source code may be useful to
#' reference for people interested in how the data were created.
#'
#' @seealso nhanes
.download_and_clean_nhanes_data <- function() {

  # package requirements for this function
  # these are listed in the Suggests dependencies for this package
  require(RNHANES)
  require(tidyverse)
  require(testthat)

  ###### Download data #####

  # Diet, Behavior and Nutrition
  # includes number of fast food meals consumed in the past week
  questionnaire_files <- tribble(
    ~cycle,      ~file_name,
    "2013-2014", "DBQ_H",
    "2011-2012", "DBQ_G",
    "2009-2010", "DBQ_F",
    "2007-2008", "DBQ_E"
  )

  # PFAS concentration data in serum
  pfas_files <- tribble(
    ~cycle,      ~file_name,
    "2013-2014", "PFAS_H",
    "2013-2014", "SSPFAS_H",
    "2011-2012", "PFC_G",
    "2009-2010", "PFC_F",
    "2007-2008", "PFC_E",
    "2005-2006", "PFC_D",
    "2003-2004", "L24PFC_C"
  )

  # 24 hour recall data
  diet_files <- tribble(
    ~cycle,      ~file_name,
    "2013-2014", "DR1IFF_H",
    "2011-2012", "DR1IFF_G",
    "2009-2010", "DR1IFF_F",
    "2007-2008", "DR1IFF_E",
    "2005-2006", "DR1IFF_D",
    "2003-2004", "DR1IFF_C"
  )


  # phsyical measurements that include BMI data
  bmi_files <- tribble(
    ~cycle,      ~file_name,
    "2013-2014", "BMX_H",
    "2011-2012", "BMX_G",
    "2009-2010", "BMX_F",
    "2007-2008", "BMX_E",
    "2005-2006", "BMX_D",
    "2003-2004", "BMX_C"
  )


  # total nutrition files
  # these include number of fish and shellfish consumed in the past 30 days
  total_nutrition_files <- tribble(
    ~cycle,      ~file_name,
    "2013-2014", "DR1TOT_H",
    "2011-2012", "DR1TOT_G",
    "2009-2010", "DR1TOT_F",
    "2007-2008", "DR1TOT_E"
  )


  # one year food frequency questionnaire
  ffq_files <- tribble(
    ~cycle,      ~file_name,
    "2005-2006", "FOODLK_D",
    "2005-2006", "FFQDC_D",
    "2003-2004", "FOODLK_C",
    "2003-2004", "FFQDC_C"
  )

  # Oral hygiene files
  oh_files <- tribble(
    ~cycle,      ~file_name,
    "2013-2014", "OHQ_H",
    "2011-2012", "OHQ_G",
    "2009-2010", "OHQ_F",
    "2007-2008", "OHQ_E",
    "2005-2006", "OHQ_D",
    "2003-2004", "OHQ_C"
  )

  #blood pressure files
  bp_files <- tribble(
    ~cycle,      ~file_name,
    "2013-2014", "BPX_H",
    "2011-2012", "BPX_G",
    "2009-2010", "BPX_F",
    "2007-2008", "BPX_E",
    "2005-2006", "BPX_D",
    "2003-2004", "BPX_C"
  )



  cat("Downloading data. Warning: downloading the data for the first time takes a while.\n")

  nhanes_pfas_data <-          nhanes_load_data(file_name = pfas_files$file_name,
                                                year = pfas_files$cycle,
                                                destination = "./inst/raw-data/NHANES_EHP_suppl_materials",
                                                demographics = TRUE)

  nhanes_children_pfas_data <- nhanes_load_data(file_name = "SSPFAC_H",
                                                year = "2013-2014",
                                                destination = "./inst/raw-data/NHANES_EHP_suppl_materials",
                                                demographics = TRUE)

  nhanes_questionnaire_data <- nhanes_load_data(file_name = questionnaire_files$file_name,
                                                year = questionnaire_files$cycle,
                                                destination = "./inst/raw-data/NHANES_EHP_suppl_materials")

  nhanes_diet_data <-          nhanes_load_data(file_name = diet_files$file_name,
                                                year = diet_files$cycle,
                                                destination = "./inst/raw-data/NHANES_EHP_suppl_materials")

  nhanes_bmi_data <-           nhanes_load_data(file_name = bmi_files$file_name,
                                                year = bmi_files$cycle,
                                                destination = "./inst/raw-data/NHANES_EHP_suppl_materials")

  nhanes_nutrition_data <-     nhanes_load_data(file_name = total_nutrition_files$file_name,
                                                year = total_nutrition_files$cycle,
                                                destination = "./inst/raw-data/NHANES_EHP_suppl_materials")

  nhanes_ffq_data <-           nhanes_load_data(file_name = ffq_files$file_name,
                                                year = ffq_files$cycle,
                                                destination = "./inst/raw-data/NHANES_EHP_suppl_materials")

  nhanes_oh_data <-            nhanes_load_data(file_name = oh_files$file_name,
                                                year = oh_files$cycle,
                                                destination = "./inst/raw-data/NHANES_EHP_suppl_materials")

  nhanes_bp_data <-            nhanes_load_data(file_name = bp_files$file_name,
                                                  year = bp_files$cycle,
                                                  destination = "./inst/raw-data/NHANES_EHP_suppl_materials")


  ###### Clean PFAS data #####

  # In 2013-2014, PFOA and PFAS are reported as separate linear/branched versions.
  # to make this comparable to the other cycles, sum the two variants.
  sspfas_reduced <- nhanes_pfas_data$SSPFAS_H %>%
    select(SEQN, SSNPFOA, SSBPFOA, SSNPFOS, SSMPFOS, SDNPFOAL, SDBPFOAL, SDNPFOSL, SDMPFOSL)

  # Fix PFAS_H and SSPFAS_H
  nhanes_pfas_data$PFAS_H <- left_join(nhanes_pfas_data$PFAS_H, sspfas_reduced, by = "SEQN")
  nhanes_pfas_data$PFAS_H$LBXPFOA <- rowSums(nhanes_pfas_data$PFAS_H[,c('SSNPFOA', 'SSBPFOA')])
  nhanes_pfas_data$PFAS_H$LBDPFOAL <- ifelse(nhanes_pfas_data$PFAS_H$SDNPFOAL == 0 | nhanes_pfas_data$PFAS_H$SDBPFOA == 0, 0, 1)
  nhanes_pfas_data$PFAS_H$LBXPFOS <- rowSums(nhanes_pfas_data$PFAS_H[,c('SSNPFOS', 'SSMPFOS')])
  nhanes_pfas_data$PFAS_H$LBDPFOSL <- ifelse(nhanes_pfas_data$PFAS_H$SDNPFOSL == 0 | nhanes_pfas_data$PFAS_H$SDMPFOSL == 0, 0, 1)
  nhanes_pfas_data$SSPFAS_H <- NULL

  nhanes_pfas_data

  # Fix in the child subsample from 2013-2014 - SSPFAC_H

  nhanes_children_pfas_data <- nhanes_children_pfas_data %>%
    mutate(
      SSPFOA = SSNPFOA + SSBPFOA,
      SSPFOAL = ifelse(SSNPFOAL == 0 | SSBPFOA == 0, 0, 1),
      SSPFOS = SSNPFOS + SSMPFOS,
      SSPFOSL = ifelse(SSNPFOSL == 0 | SSMPFOSL == 0, 0, 1)
    )

  # Combine all the cycles and recategorize the race variable.
  # Set non-hispanic whites as the referent factor level.
  recategorize_race <- function(x) x %>%
    mutate(race_cat = factor(case_when(
      .$RIDRETH1 == 1 ~ "Hispanic",
      .$RIDRETH1 == 2 ~ "Hispanic",
      .$RIDRETH1 == 3 ~ "Non-Hispanic White",
      .$RIDRETH1 == 4 ~ "Non-Hispanic Black"
    ), levels = c("Non-Hispanic White", "Non-Hispanic Black", "Hispanic")))

  recategorize_sex <- function(x) x %>%
    mutate(sex_cat = factor(case_when(
      .$RIAGENDR == 1 ~ "Male",
      .$RIAGENDR == 2 ~ "Female"
    ), levels = c("Male", "Female")))

  nhanes_combined_pfas_data <- bind_rows(nhanes_pfas_data) %>%
    recategorize_race() %>%
    recategorize_sex()

  nhanes_combined_pfas_data$LBXSUMPFAS <- nhanes_combined_pfas_data$LBXPFOS +
    nhanes_combined_pfas_data$LBXPFOA +
    nhanes_combined_pfas_data$LBXPFNA +
    nhanes_combined_pfas_data$LBXPFHS +
    nhanes_combined_pfas_data$LBXPFDE

  nhanes_children_pfas_data <- nhanes_children_pfas_data %>%
    recategorize_race() %>%
    recategorize_sex()

  nhanes_children_pfas_data$SSSUMPFAS <- nhanes_children_pfas_data$SSPFOA +
    nhanes_children_pfas_data$SSPFOS +
    nhanes_children_pfas_data$SSPFNA +
    nhanes_children_pfas_data$SSPFHS +
    nhanes_children_pfas_data$SSPFDE

  ###### Clean 24-hour dietary recall data #####
  #FASTFOOD_FOOD_SOURCE = c(3, 14, 25)
  FASTFOOD_FOOD_SOURCE = c(3)
  RESTAURANT_FOOD_SOURCES = c(2, 5)
  MICROWAVE_POPCORN_CODES = c("54403000", "54403020", "54403070", "54403060", "54403090")
  NON_MICROWAVE_POPCORN_CODES = c("54403010", "54403040", "54403050", "54403110", "54403120", "54403150")

  seafood_mixtures <- data.frame(
    fish_seafood_mixtures = c(
      "261, 262, 27150010, 27150250, 27150310, 27150320, 27150350,",
      "27150370, 27151030, 27151070, 27250030, 27250050, 27250060,",
      "27250070, 27250160, 27250250, 27250510, 27250520, 27250610,",
      "27250630, 27250710, 27250810, 27250820, 27250830, 27250900,",
      "27350020, 27350030, 27350080, 27350100, 27350110, 27350310,",
      "27350410, 27450030, 27450060, 27450061, 27450062, 27450063,",
      "27450066, 27450068, 27450080, 27450090, 27450100, 27450150,",
      "27450180, 27450510, 27450700, 27450710, 27450740, 27450750,",
      "27451070, 27550000, 27550100, 27550720, 27550750, 27550751,",
      "28150210, 28150510, 28150650, 28350040, 28350050, 28351110,",
      "28351120, 28355350, 28355450, 28355460, 28355470, 28355480"),
    shellfish_mixtures = c(
      "263, 27150020, 27150030, 27150060, 27150070, 27150100, 27150110,",
      "27150130, 27150140, 27150160, 27150170, 27150190, 27150200,",
      "27150210, 27150230, 27150330, 27150410, 27151040, 27151050,",
      "27250020, 27250040, 27250110, 27250120, 27250122, 27250126,",
      "27250128, 27250130, 27250132, 27250210, 27250260, 27250400,",
      "27250410, 27250450, 27250950, 27350050, 27350060, 27450010,",
      "27450020, 27450040, 27450070, 27450120, 27450130, 27450400,",
      "27450405, 27450410, 27450420, 27450430, 27450450, 27450470,",
      "27450600, 27450610, 27450650, 27450660, 27451030, 28152050,",
      "28154010, 28350110, 28350120, 28350210, 28350220, 28355110,",
      "28355120, 28355130, 28355140, 28355210, 28355250, 28355310, 28355410, 28355420, 28355430, 28355440")
  ) %>%
    pivot_longer(names_to = "food_cat", values_to = "DR1IFDCD", everything()) %>%
    separate_rows(DR1IFDCD, sep = ", ") %>%
    mutate(DR1IFDCD = str_remove(DR1IFDCD, ","))

  SEAFOOD_MIXTURE_CODES = seafood_mixtures$DR1IFDCD
  FISH_MIXTURE_CODES = seafood_mixtures$DR1IFDCD[which(seafood_mixtures$food_cat == "fish_seafood_mixtures")]
  SHELLFISH_MIXTURE_CODES = seafood_mixtures$DR1IFDCD[which(seafood_mixtures$food_cat == "shellfish_mixtures")]


  nhanes_combined_diet_data_raw <- nhanes_diet_data %>%
    bind_rows() %>%
    select(SEQN, DR1IKCAL, DR1FS, DR1ITFAT, DR1IFDCD, DR1_040Z) %>%
    filter(!is.na(DR1FS))

  nhanes_combined_diet_data <- nhanes_combined_diet_data_raw %>%
    group_by(SEQN) %>%
    summarize(total_energy = sum(DR1IKCAL, na.rm = TRUE),
              fast_food_energy = sum(DR1IKCAL * (DR1FS %in% FASTFOOD_FOOD_SOURCE), na.rm = TRUE),
              restaurant_energy = sum(DR1IKCAL * (DR1FS %in% RESTAURANT_FOOD_SOURCES), na.rm = TRUE),
              non_fast_food_or_restaurant_energy_eaten_home = sum(DR1IKCAL * (DR1FS != FASTFOOD_FOOD_SOURCE) * !(DR1FS %in% RESTAURANT_FOOD_SOURCES) & DR1_040Z == 1),
              non_fast_food_or_restaurant_energy_not_eaten_home = sum(DR1IKCAL * (DR1FS != FASTFOOD_FOOD_SOURCE) * !(DR1FS %in% RESTAURANT_FOOD_SOURCES) & DR1_040Z == 0),
              popcorn_energy = sum(DR1IKCAL * (DR1IFDCD %in% MICROWAVE_POPCORN_CODES)),
              popcorn_energy_prop_total = popcorn_energy / total_energy,
              non_microwave_popcorn_energy = sum(DR1IKCAL * (DR1IFDCD %in% NON_MICROWAVE_POPCORN_CODES)),

              prop_energy_from_fast_food = fast_food_energy / total_energy,

              shellfish_energy = sum(DR1IKCAL * (str_sub(DR1IFDCD, 0, 3) == 263 | DR1IFDCD %in% SHELLFISH_MIXTURE_CODES)),
              fish_energy = sum(DR1IKCAL * (str_sub(DR1IFDCD, 0, 3) %in% c(261, 262) | (DR1IFDCD %in% FISH_MIXTURE_CODES))),

              fast_food_energy_no_popcorn = sum(DR1IKCAL *
                                                  (DR1FS %in% FASTFOOD_FOOD_SOURCE &
                                                     !(DR1IFDCD %in% MICROWAVE_POPCORN_CODES)), na.rm = TRUE),

              restaurant_energy_no_popcorn = sum(DR1IKCAL *
                                                   (DR1FS %in% RESTAURANT_FOOD_SOURCES &
                                                      !(DR1IFDCD %in% MICROWAVE_POPCORN_CODES)), na.rm = TRUE),

              non_fast_food_or_restaurant_energy_no_popcorn = sum(DR1IKCAL *
                                                                    (!(DR1FS %in% FASTFOOD_FOOD_SOURCE) &
                                                                       !(DR1FS %in% RESTAURANT_FOOD_SOURCES) &
                                                                       !(DR1IFDCD %in% MICROWAVE_POPCORN_CODES)), na.rm = TRUE),


              fast_food_energy_no_popcorn_no_seafood = sum(DR1IKCAL *
                                                             (DR1FS %in% FASTFOOD_FOOD_SOURCE &
                                                                !(DR1IFDCD %in% MICROWAVE_POPCORN_CODES) &
                                                                str_sub(DR1IFDCD, 0, 2) != 26 &
                                                                !(DR1IFDCD %in% SEAFOOD_MIXTURE_CODES)), na.rm = TRUE),

              fast_food_energy_no_popcorn_no_seafood_prop_total = fast_food_energy_no_popcorn_no_seafood / total_energy,

              restaurant_energy_no_popcorn_no_seafood = sum(DR1IKCAL *
                                                              (DR1FS %in% RESTAURANT_FOOD_SOURCES &
                                                                 !(DR1IFDCD %in% MICROWAVE_POPCORN_CODES) &
                                                                 str_sub(DR1IFDCD, 0, 2) != 26 &
                                                                 !(DR1IFDCD %in% SEAFOOD_MIXTURE_CODES)), na.rm = TRUE),

              restaurant_energy_no_popcorn_no_seafood_prop_total = restaurant_energy_no_popcorn_no_seafood / total_energy,

              non_fast_food_or_restaurant_energy_no_popcorn_no_seafood = sum(DR1IKCAL *
                                                                               (!(DR1FS %in% FASTFOOD_FOOD_SOURCE) &
                                                                                  !(DR1FS %in% RESTAURANT_FOOD_SOURCES) &
                                                                                  !(DR1IFDCD %in% MICROWAVE_POPCORN_CODES) &
                                                                                  str_sub(DR1IFDCD, 0, 2) != 26 &
                                                                                  !(DR1IFDCD %in% SEAFOOD_MIXTURE_CODES)), na.rm = TRUE),


              non_fast_food_or_restaurant_energy_no_popcorn_no_seafood_eaten_home = sum(DR1IKCAL *
                                                                                          (!(DR1FS %in% FASTFOOD_FOOD_SOURCE) &
                                                                                             !(DR1FS %in% RESTAURANT_FOOD_SOURCES) &
                                                                                             !(DR1IFDCD %in% MICROWAVE_POPCORN_CODES) &
                                                                                             str_sub(DR1IFDCD, 0, 2) != 26 &
                                                                                             !(DR1IFDCD %in% SEAFOOD_MIXTURE_CODES) &
                                                                                             DR1_040Z == 1), na.rm = TRUE),

              non_fast_food_or_restaurant_energy_no_popcorn_no_seafood_eaten_home_prop_total = non_fast_food_or_restaurant_energy_no_popcorn_no_seafood_eaten_home / total_energy,

              non_fast_food_or_restaurant_energy_no_popcorn_no_seafood_not_eaten_home = sum(DR1IKCAL *
                                                                                              (!(DR1FS %in% FASTFOOD_FOOD_SOURCE) &
                                                                                                 !(DR1FS %in% RESTAURANT_FOOD_SOURCES) &
                                                                                                 !(DR1IFDCD %in% MICROWAVE_POPCORN_CODES) &
                                                                                                 str_sub(DR1IFDCD, 0, 2) != 26 &
                                                                                                 !(DR1IFDCD %in% SEAFOOD_MIXTURE_CODES) &
                                                                                                 DR1_040Z == 2), na.rm = TRUE),

              non_fast_food_or_restaurant_energy_no_popcorn_no_seafood_not_eaten_home_prop_total = non_fast_food_or_restaurant_energy_no_popcorn_no_seafood_not_eaten_home / total_energy,

              ate_fast_food_one_day = fast_food_energy_no_popcorn_no_seafood > 0,
              ate_popcorn_one_day = popcorn_energy > 0,
              ate_restaurant_one_day = restaurant_energy_no_popcorn_no_seafood > 0,
              ate_other_home_one_day = non_fast_food_or_restaurant_energy_no_popcorn_no_seafood_eaten_home > 0,
              ate_other_not_home_one_day = non_fast_food_or_restaurant_energy_no_popcorn_no_seafood_not_eaten_home > 0
    )


  test_that("Food source calories add up to total calories", {
    expect_equal(nhanes_combined_diet_data$total_energy, rowSums(select(nhanes_combined_diet_data,
                                                                        shellfish_energy,
                                                                        fish_energy,
                                                                        popcorn_energy,
                                                                        fast_food_energy_no_popcorn_no_seafood,
                                                                        restaurant_energy_no_popcorn_no_seafood,
                                                                        non_fast_food_or_restaurant_energy_no_popcorn_no_seafood)))
  })



  ###### clean diet/nutrition behavior questionnaire data #####
  nhanes_combined_questionnaire_data <- nhanes_questionnaire_data %>%
    bind_rows() %>%
    select(SEQN, DBD895, DBD900, DBD905, DBD910) %>%
    mutate(proportion_fast_food = DBD900/DBD895,
           ate_fast_food_one_week = DBD900 > 0,
           meals_eaten_elsewhere = DBD895 - DBD900)


  ##### Clean 30-day fish/shellfish questionnaire data #####

  shellfish_columns <- c(paste0("DRD350", LETTERS[1:10], "Q"))
  fish_columns <-      c(paste0("DRD370", LETTERS[1:21], "Q"))
  aquatic_columns <-   c(shellfish_columns, fish_columns)

  shellfish_names <- c("Clams", "Crabs", "Crayfish", "Lobsters", "Mussels", "Oysters", "Scallops", "Shrimp", "Other", "Unknown")
  fish_names <-      c("Breaded", "Tuna", "Bass", "Catfish", "Cod", "Flatfish", "Haddock", "Mackerel", "Perch", "Pike", "Pollock",
                       "Porgy", "Salmon", "Sardines", "Sea bass", "Shark", "Swordfish", "Trout", "Walleye", "Other", "Unknown")

  nhanes_combined_nutrition_data <- nhanes_nutrition_data %>%
    bind_rows() %>%
    .[, c("SEQN", "DRD340", "DRD360", aquatic_columns)] %>%
    mutate(shellfish_sum = rowSums(.[, shellfish_columns], na.rm = TRUE),
           # DRD340 is a 1=Yes 2=No question asking if the participant ate any shellfish in the past 30 days.
           # If they say no, set their shellfish sum to 0. If DRD340 is NA, set the shellfish sum to NA.
           shellfish_sum = ifelse(!is.na(DRD340) & DRD340 == 1, shellfish_sum, 0),
           shellfish_sum = ifelse(is.na(DRD340), NA, shellfish_sum),

           # Same for fish, with DRD360
           fish_sum = rowSums(.[, fish_columns], na.rm = TRUE),
           fish_sum = ifelse(!is.na(DRD360) & DRD360 == 1, fish_sum, 0),
           fish_sum = ifelse(is.na(DRD360), NA, fish_sum),

           aquatic_sum = fish_sum + shellfish_sum)

  ###### Clean BMI data #####
  #_#_# AHz: add in height (cm) and weight (kg)

  nhanes_combined_bmi_data <- nhanes_bmi_data %>%
    bind_rows() %>%
    select(SEQN, BMXBMI, BMXWT, BMXHT)


  ###### Clean FFQ data #####

  ffq_c <- nhanes_ffq_data$FFQDC_C %>%
    left_join(select(nhanes_ffq_data$FOODLK_C, FFQ_FOOD, VALUE), by = "FFQ_FOOD")

  ffq_d <- nhanes_ffq_data$FFQDC_D %>%
    left_join(select(nhanes_ffq_data$FOODLK_D, FFQ_FOOD, VALUE), by = "FFQ_FOOD")

  ffq_c %>% filter(str_detect(str_to_lower(VALUE), "fish")) %>% select(VALUE) %>% unique

  nhanes_combined_ffq_data <- bind_rows(ffq_c, ffq_d) %>%
    mutate(VALUE = ifelse(VALUE %in% c("Fish fried", "Fish/ not fried", "Fish/ smoked", "Sushi/ raw fish", "Oysters"), "Seafood", VALUE)) %>%
    filter(VALUE %in% c("Seafood", "Popcorn")) %>%
    group_by(SEQN, VALUE) %>%
    summarize(FFQ_FREQ = sum(FFQ_FREQ)) %>%
    select(SEQN, VALUE, FFQ_FREQ) %>%
    spread(VALUE, FFQ_FREQ) %>%
    rename(ffq_popcorn = Popcorn,
           ffq_seafood = Seafood) %>%
    mutate(ate_popcorn_one_year = ffq_popcorn > 0)

  ##### Clean OH data #####

  nhanes_combined_oh_data <- bind_rows(nhanes_oh_data) %>%
    select(SEQN, OHQ870) %>%
    rename(days_dental_floss = OHQ870)

  ###### Clean BP data #####

  nhanes_combined_bp_data <- nhanes_bp_data %>%
    bind_rows() %>%
    select(SEQN, BPXSY1, BPXSY2, BPXSY3) %>%
    pivot_longer(names_to = "measurement_num", values_to = "BP", c(BPXSY1, BPXSY2, BPXSY3)) %>%
    group_by(SEQN) %>%
    summarize(mean_BP = mean(BP, na.rm = TRUE),
              n_readings = length(which(!is.na(BP))))


  ##### Create Master Dataset #####

  nhanes_data <- reduce(list(nhanes_combined_pfas_data,
                             nhanes_combined_questionnaire_data,
                             nhanes_combined_bmi_data,
                             nhanes_combined_diet_data,
                             nhanes_combined_nutrition_data,
                             nhanes_combined_ffq_data,
                             nhanes_combined_oh_data,
                             nhanes_combined_bp_data),
                        left_join,
                        by = "SEQN")

  ## Identify qualifying participants

  count_qualifying = function(x) nrow(filter(x, qualifying == TRUE))

  ## Requirement 1: Participant must have PFAS concentration data
  nhanes_data1 <- nhanes_data %>% mutate(qualifying = !is.na(LBXPFDE) & !is.na(LBXPFHS) & !is.na(LBXPFNA) & !is.na(LBXPFOA) & !is.na(LBXPFOS))
  cat(paste("Requirement 1:", (nrow(nhanes_data) - count_qualifying(nhanes_data1)), "participants excluded for not having PFAS concentration data\n"))

  ## Requirement 2: Participant must identify as a particular race/ethnicity
  nhanes_data2 <- nhanes_data1 %>% mutate(qualifying = qualifying & !is.na(RIDRETH1) & RIDRETH1 != 5)
  cat(paste("Requirement 2:", (count_qualifying(nhanes_data1) - count_qualifying(nhanes_data2)),
            "more participants excluded for not identifying as a particular race/ethnicicy\n"))


  ## Has household poverty ratio data
  nhanes_data3 <- nhanes_data2 %>% mutate(qualifying = qualifying & !is.na(INDFMPIR))
  cat(paste("Requirement 3:", (count_qualifying(nhanes_data2) - count_qualifying(nhanes_data3)),
            "more participants excluded for not having poverty/income ratio data\n"))


  ## Has BMI data
  nhanes_data4 <- nhanes_data3 %>% mutate(qualifying = qualifying & !is.na(BMXBMI))
  cat(paste("Requirement 4:", (count_qualifying(nhanes_data3) - count_qualifying(nhanes_data4)),
            "more participants excluded for not having BMI data\n"))

  ## Has height/weight data
  nhanes_data5 <- nhanes_data4 %>% mutate(qualifying = qualifying & !is.na(BMXHT) & !is.na(BMXWT))
  cat(paste("Requirement 5:", (count_qualifying(nhanes_data4) - count_qualifying(nhanes_data5)),
            "more participants excluded for not having height/weight data\n"))

  ## Has age data
  nhanes_data6 <- nhanes_data5 %>% mutate(qualifying = qualifying & !is.na(RIDAGEYR))
  cat(paste("Requirement 6:", (count_qualifying(nhanes_data5) - count_qualifying(nhanes_data6)),
            "more participants excluded for not having age data\n"))

  ## Has blood pressure data
  nhanes_data7 <- nhanes_data6 %>% mutate(qualifying = qualifying & !is.na(mean_BP))
  cat(paste("Requirement 7:", (count_qualifying(nhanes_data5) - count_qualifying(nhanes_data6)),
            "more participants excluded for not having blood pressure data\n"))

  # filter for just 2013-2014
  nhanes_data4_13_14 <- nhanes_data4 %>% filter(cycle == '2013-2014')

  # select variables for inclusion in dataset
  df <- nhanes_data4_13_14 %>%
    select(
      SEQN,
      race_cat,
      sex_cat,
      RIDAGEYR,
      INDFMPIR,
      days_dental_floss,
      LBXSUMPFAS,
      LBXPFOS,
      LBXPFOA,
      LBXPFNA,
      LBXPFHS,
      LBXPFDE,
      total_energy,
      fast_food_energy_no_popcorn_no_seafood,
      restaurant_energy_no_popcorn_no_seafood,
      non_fast_food_or_restaurant_energy_no_popcorn_no_seafood,
      popcorn_energy,
      shellfish_energy,
      fish_energy,
      mean_BP,
      BMXWT,
      BMXHT

    )

  # rename some variables with more friendly names
  df <- df %>%
    rename(
      id = SEQN,
      race_ethnicity = race_cat,
      sex_gender = sex_cat,
      age = RIDAGEYR,
      weight = BMXWT,
      height = BMXHT,
      poverty_ratio = INDFMPIR,
      PFAS_total = LBXSUMPFAS,
      PFOS = LBXPFOS,
      PFOA = LBXPFOA,
      PFNA = LBXPFNA,
      PFHS = LBXPFHS,
      PFDE = LBXPFDE
    )

  df$id <- df$id %>%  as.character() # convert ID to a character so it doesn't act like a numeric
  df$days_dental_floss[df$days_dental_floss == 99] <- NA # code missing values

  # add labels for the columns
  var_label(df$id) <- "Unique identifier for individuals in NHANES"
  var_label(df$race_ethnicity) <- "Race/Ethnicity"
  var_label(df$sex_gender) <- "Sex/Gender [as binary]"
  var_label(df$age) <- "Age [in years] at screening"
  var_label(df$poverty_ratio) <- "Ratio of Household Income to US Federal Poverty Line. The value was not computed if the respondent only reported income as < $20,000 or ≥ $20,000. If family income was reported as a more detailed category, the midpoint of the range was used to compute the ratio. Values at or above 5.00 were coded as 5.00 or more because of disclosure concerns."
  var_label(df$days_dental_floss) <- "Days [Reported] Respondents Floss per Week [days/week]"
  var_label(df$PFAS_total) <- "Perfluoroalkyl and Polyfluoroalkyl Substances [ng/mL]"
  var_label(df$PFOS) <- "Perfluorooctane Sulfonate [ng/mL]"
  var_label(df$PFOA) <- "Perfluorooctanoic Acid [ng/mL]"
  var_label(df$PFNA) <- "Perfluorononanoic Acid [ng/mL]"
  var_label(df$PFHS) <- "Perfluorohexane Sulfonate [ng/mL]"
  var_label(df$PFDE) <- "Perfluorodecanoic Acid [ng/mL]"
  var_label(df$total_energy) <- "Calories in Daily Dietary Intake [reported] [kCal]"
  var_label(df$fast_food_energy_no_popcorn_no_seafood) <- "Calories from fast food excluding popcorn and seafood in daily dietary recall [kCal]"
  var_label(df$restaurant_energy_no_popcorn_no_seafood) <- "Calories from food at restaurants excluding popcorn and seafood in daily dietary recall [kCal]"
  var_label(df$non_fast_food_or_restaurant_energy_no_popcorn_no_seafood) <- "Calories from food that is not from fast food or restaurants excluding popcorn and seafood in dietary recall [kCal]"
  var_label(df$popcorn_energy) <- "Calories from popcorn in dietary recall [kCal]"
  var_label(df$shellfish_energy) <- "Calories from shellfish in dietary recall [kCal]"
  var_label(df$fish_energy) <- "Calories from fish in dietary recall [kCal]"
  var_label(df$weight) <- "Weight [kg]"
  var_label(df$height) <- "Height [cm]"
  var_label(df$mean_BP) <- "Mean Systolic Blood Pressure [mm Hg]"

  nhanes <- df # rename the object to 'nhanes' before storing it inside the ID529data package
  rm(df)

  usethis::use_data(nhanes) # write into the package
}
