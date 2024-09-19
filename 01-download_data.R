#### Preamble ####
# Purpose: Downloads and saves the data about Marriage Licence Statistics.
# Author: Duanyi Su
# Date: 19 Sept. 2024


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####

library(dplyr)

#### Download data ####
# get package
package <- show_package("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")

# get all resources for this package
resources <- list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
marriage_data <- filter(datastore_resources, row_number()==1) %>% 
  get_resource()

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write.csv(marriage_data, "marriage_licenses_toronto.csv", row.names = FALSE)

