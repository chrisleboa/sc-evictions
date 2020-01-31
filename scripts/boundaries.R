# The import script for cities boundaries in South Carolina

# Author: Chris LeBoa
# Version: 2020-01-30

# Libraries
library(tidyverse)

# Parameters

file_path_input <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"
file_path_raw_output <- here::here("data-raw/sc_boundaries_raw.geojson")
file_path_output <- here::here("data/sc_boundaries.rds")




#===============================================================================

#Original data to raw data folder
# sf::read_sf(file_path_input) %>%
#   sf::write_sf(file_path_raw_output)


#To data folder

sf::read_sf(file_path_input) %>%
  select(city_id = GEOID, city_name = n, geometry) %>%
  mutate(city_id = as.integer(city_id)) %>%
  write_rds(file_path_output)
