# Lead Concentration Analysis Project

This project analyzes lead concentration data using R, focusing on statistical analysis, hypothesis testing, and data visualization.

## Project Overview

This project performs a comprehensive statistical analysis of lead concentration data, including:
- Descriptive statistics
- Hypothesis testing
- Linear modeling
- Confidence interval analysis
- Normality and homoscedasticity testing
- Outlier detection
- Data visualization

## Files Description

- `lead.RData`: The main dataset containing lead concentration measurements and related variables
- `Descriptive Statistics.R`: Calculates summary statistics, frequency tables, and correlation coefficients
- `Linear model.R`: Performs linear regression analysis
- `Hypothesis Test.R`: Conducts statistical hypothesis tests
- `confidence interval.R`: Calculates confidence intervals for key parameters
- `Testing for Normality and Homoscedasticity.R`: Tests assumptions for statistical analysis
- `Graphics.R`: Creates visualizations of the data
- `Outlier Detection.R`: Identifies and analyzes outliers in the dataset
- `output.xlsx`: Contains the results of the analysis

## Variables in the Dataset

The dataset includes the following key variables:
- MAXFWT: Maximum weight
- Iqf: Intelligence quotient
- Ld72: Lead concentration measurement from 1972
- Ld73: Lead concentration measurement from 1973
- Totyrs: Total years
- Age: Age of subjects
- Sex: Gender (male/female)

## Requirements

To run this project, you need:
- R programming language
- Required R packages:
  - dplyr
  - ggplot2 (for graphics)
  - Additional packages as specified in each script

## Usage

1. Clone or download this repository
2. Open R or RStudio
3. Run the scripts in the following order:
   - First run `Descriptive Statistics.R` to understand the data
   - Then proceed with other analysis scripts based on your needs

## Results

The analysis results are saved in `output.xlsx`, which includes:
- Summary statistics
- Statistical test results
- Model outputs
- Visualizations