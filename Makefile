# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
DATA = sc_cities_2016.rds sc_boundaries.rds sc_joined_cities_2016_boundaries.rds


# EDA studies
EDA = eda.md

# Reports
REPORTS =

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies
sc_cities_2016.rds : sc_cities_2016_raw.csv/
sc_boundaries.rds : sc_boundaries_raw.geojson/
sc_joined_cities_2016_boundaries.rds : sc_cities_2016.rds sc_boundaries.rds

# EDA study and report dependencies
eda.md : sc_cities_2016.rds

# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
