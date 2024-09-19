#### Preamble ####
# Purpose: Models about Marriage Licence Statistics.
# Author: Duanyi Su
# Date: 19 Sept. 2024

install.packages("rstanarm")
library(rstanarm)

#### Workspace setup ####
library(tidyverse)

#### Read data ####
analysis_data <- read_csv("~/Downloads/analysis_data.csv")

### Model data ####
first_model <-
  stan_glm(
    formula = flying_time ~ length + width,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


