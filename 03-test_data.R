#### Preamble ####
# Purpose: Text the data about Marriage Licence Statistics.
# Author: Duanyi Su
# Date: 19 Sept. 2024


#### Workspace setup ####
library(tidyverse)
library(testthat)


#### Test data ####

# Load simulated data
simulated_data <- read.csv("simulated_marriage_data.csv")

# Test 1: Check if the count is non-negative
test_that("Count is non-negative", {
  expect_true(all(simulated_data$Count >= 0))
})

# Test 2: Check if the data contains the expected number of rows
test_that("Correct number of rows", {
  expect_equal(nrow(simulated_data),
               length(seq.Date(from = as.Date("2020-01-01"),
                               to = as.Date("2023-12-31"), by = "day")))
})