# description -------------------------------------------------------------

# R script to process uploaded raw data into a tidy dataframe

# R packages --------------------------------------------------------------

library(dyplr)
library(here)
library(dplyr)
library(tidyselect)
library(readxl)
library(tidyr)

# read data ---------------------------------------------------------------

file_path <- "data-raw/FSMGLOBAL_The role of emptying services in provision of safely managed sanitation_A classification and quantification of the needs of LMICs.xlsx"

# dataframe that joins the country names to the remaining datas

join_country_df <- read_excel(file_path,
           range = "A2:A184") |>
  mutate(id = seq(1:n()))

# function to read and tidy data from excel file

read_data_fsmglobal <- function(range, emptying_method) {

  read_excel(file_path,
             range = range) |>
    mutate(id = seq(1:n())) |>
    left_join(join_country_df) |>
    filter(!is.na(Population)) |>
    mutate(emptying_method = emptying_method) |>
    select(-id) |>
    pivot_longer(cols = Population:`Rural proportion of demand`,
                 names_to = "variable",
                 values_to = "value") |>
    rename(country = Country)

}

# read_data_fsmglobal(range = "BA2:BE184", emptying_method = "mechanized")
# read_data_fsmglobal(range = "BG2:BK184", emptying_method = "non-mechanized")
# read_data_fsmglobal(range = "BM2:BQ184", emptying_method = "unemptiable")
# read_data_fsmglobal(range = "BS2:BW184", emptying_method = "no facility")

# the followinf code achieves the same as the code above, but using the map2
# function instead of repeating a single function four times.

ranges <- c("BA2:BE184", "BG2:BK184", "BM2:BQ184", "BS2:BW184")

emptying_methods <- c("mechanized", "non-mechanized", "unemptiable", "no facility")

purrr::map2(ranges, emptying_methods, read_data_fsmglobal) |>
  bind_rows()


# tidy data ---------------------------------------------------------------

usethis::use_data(DATASET, overwrite = TRUE)

fs::dir_create(here::here("inst", "extdata"))

write_csv(DATASET, here::here("inst", "extdata", "DATASET.csv"))

openxlsx::write.xlsx(DATASET, here::here("inst", "extdata", "DATASET.xlsx"))
