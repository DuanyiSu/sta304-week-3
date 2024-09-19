#### Preamble ####
# Purpose: Cleans the raw plane data about Marriage Licence Statistics.
# Author: Duanyi Su
# Date: 19 Sept. 2024

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("~/Downloads/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") |> 
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
  )

#### Save data ####
write_csv(cleaned_data, "~/Downloads/analysis_data.csv")

