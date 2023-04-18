# description -------------------------------------------------------------

# R script to process uploaded raw data into a tidy dataframe

# R packages --------------------------------------------------------------

library(dplyr)
library(here)
library(dplyr)
library(tidyselect)
library(readxl)
library(tidyr)

# read data ---------------------------------------------------------------

file_path <- "data-raw/FSMGLOBAL_The role of emptying services in provision of safely managed sanitation_A classification and quantification of the needs of LMICs.xlsx"

# dataframe that joins the country names to the remaining datas

# get the country names

join_country_df <- read_excel(path = file_path,
                              range = "A2:B184") |>
  mutate(id = seq(1:n())) |>
  rename(population_2017 = `2017 Population`) |>
  mutate(Country = case_when(
    Country == "RÃ©union" ~ "Réunion",
    Country == "CuraÃ§ao" ~ "Curaçao",
    TRUE ~ Country
  )) |>
  mutate(iso3c = countrycode::countrycode(Country, origin = 'country.name', destination = 'iso3c'))

# function to read and tidy data from excel file

read_data_fsmglobal <- function(range, emptying_method) {

  read_excel(path = file_path,
             range = range) |>
    mutate(id = seq(1:n())) |>
    left_join(join_country_df) |>
    filter(!is.na(Population)) |>
    mutate(emptying_method = emptying_method) |>
    select(-id) |>
    #pivot_longer(cols = Population:`Rural proportion of demand`,
    #             names_to = "variable",
    #             values_to = "value") |>
    rename(country = Country) |>

    relocate(c(iso3c, country, emptying_method, population_2017)) |>
    rename(population_emptying_method = Population,
           count_pits_septics = `No. pits/septics`,
           emptying_demand = `Sanitation density/total country market density`,
           urban_demand = `Urban proportion of demand`,
           rural_demand = `Rural proportion of demand`
    ) |>
    mutate(emptying_demand = population_emptying_method / population_2017)

}

# read_data_fsmglobal(range = "BA2:BE184", emptying_method = "mechanized")
# read_data_fsmglobal(range = "BG2:BK184", emptying_method = "non-mechanized")
# read_data_fsmglobal(range = "BM2:BQ184", emptying_method = "unemptiable")
# read_data_fsmglobal(range = "BS2:BW184", emptying_method = "no facility")

# the following code achieves the same as the code above, but using the map2
# function instead of repeating a single function four times.

ranges <- c("BA2:BE184", "BG2:BK184", "BM2:BQ184", "BS2:BW184")

emptying_methods <- c("mechanized", "non-mechanized", "unemptiable", "no facility")

fsmglobal <- purrr::map2(ranges, emptying_methods, read_data_fsmglobal) |>
  bind_rows()


# tidy data ---------------------------------------------------------------

usethis::use_data(fsmglobal, overwrite = TRUE)

fs::dir_create(here::here("inst", "extdata"))

readr::write_csv(fsmglobal, here::here("inst", "extdata", "fsmglobal.csv"))

openxlsx::write.xlsx(fsmglobal, here::here("inst", "extdata", "fsmglobal.xlsx"))

