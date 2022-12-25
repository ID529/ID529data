#' Raw Data for Heart Disease Deaths by Month, 1999-2020, US Divisions
#'
#' Read the CDC WONDER data on monthly counts of deaths by Census division with
#' underlying cause of death determined to be related to heart disease according
#' to the following ICD-10 codes:
#'
#' ICD-10 Codes:
#'   - I00-I02 (Acute rheumatic fever);
#'   - I05-I09 (Chronic rheumatic heart diseases);
#'   - I11.0 (Hypertensive heart disease with (congestive) heart failure);
#'   - I11.9 (Hypertensive heart disease without (congestive) heart failure);
#'   - I13.0 (Hypertensive heart and renal disease with (congestive) heart failure);
#'   - I13.1 (Hypertensive heart and renal disease with renal failure);
#'   - I13.2 (Hypertensive heart and renal disease with both (congestive) heart failure and renal failure);
#'   - I13.9 (Hypertensive heart and renal disease, unspecified);
#'   - I20-I25 (Ischaemic heart diseases);
#'   - I26-I28 (Pulmonary heart disease and diseases of pulmonary circulation);
#'   - I30-I51 (Other forms of heart disease)
#'
#'
load_cdc_wonder_raw <- function() {
  readr::read_delim(
    system.file(
      'raw-data/CDC_WONDER_heart disease deaths by census division.txt',
      package = 'ID529data'
    )
  )
}

#' Clean CDC WONDER Heart Disease Deaths Data
#'
clean_cdc_wonder_data <- function(df) {

  # remove rows where the notes are non-empty; this is because the rows where
  # notes are present are those rows at the bottom that describe the data, not
  # the data themselves.  you can view them by looking at the original .txt file
  # and scrolling to the bottom.
  df %<>% filter(is.na(notes))
}
