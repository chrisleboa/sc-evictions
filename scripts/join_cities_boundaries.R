# This script joins the data for 2016 city evictions and city boundary data
# for south carolina

# Author: Chris LeBoa
# Version: 2020-01-30

# Libraries
library(tidyverse)

# Parameters
file_path_input_cities <- here::here("data/sc_cities_2016.rds")
file_path_input_boundaries <- here::here("data/sc_boundaries.rds")

file_path_output <-
  here::here("data/sc_joined_cities_2016_boundaries.rds")


#===============================================================================

Code

cities <- read_rds(file_path_input_cities)
boundaries <- read_rds(file_path_input_boundaries)

#I am not sure if doing this is duplicative coding and if would be better to
#just name them cities and boundaries above

cities %>%
  left_join(boundaries, by = "city_id") %>%
  write_rds(file_path_output)
