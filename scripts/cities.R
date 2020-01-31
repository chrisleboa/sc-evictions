# The import script for cities data on evictions in South Carolina

# Author: Chris LeBoa
# Version: 2020-01-30

# Libraries
library(tidyverse)

# Parameters

file_path_input <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"
file_path_raw_output <- here::here("data-raw/sc_cities_2016_raw.csv")
file_path_output <- here::here("data/sc_cities_2016.rds")

var_types <- cols_only(
  "GEOID" = col_integer(),
  "year" = col_integer(),
  "name" = col_character(),
  "evictions" = col_double()
)


#===============================================================================

#Code

#Original data to raw data folder
read_csv(file_path_input) %>%
  write_csv(file_path_raw_output)

#Clean data to data folder
read_csv(file_path_input, col_types = var_types) %>%
  filter(year == 2016) %>%
  rename("city_id" = GEOID) %>%
  write_rds(file_path_output)
