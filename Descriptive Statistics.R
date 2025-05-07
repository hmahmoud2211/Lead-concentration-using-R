# Load required packages
library(dplyr)
library(dplyr)

# Load the dataset
load("C:/Users/user/Downloads/STAT_project/Lead-concentration-using-R/lead.RData")
View(lead)
# Summary statistics for numeric variables
numeric_vars <- lead %>% select(MAXFWT, Iqf, Ld72, Ld73, Totyrs, Age)
summary_stats <- numeric_vars %>%
  summarise_all(list(
    Mean = ~mean(., na.rm = TRUE),
    Median = ~median(., na.rm = TRUE),
    Min = ~min(., na.rm = TRUE),
    Max = ~max(., na.rm = TRUE),
    Q1 = ~quantile(., 0.25, na.rm = TRUE),
    Q3 = ~quantile(., 0.75, na.rm = TRUE)
  ))
print("Summary Statistics:")
print(summary_stats)

lead$Sex<- factor (lead$Sex, labels=c('male','female'))

# Frequency table for Sex
sex_freq <- table(lead$Sex)
print("Frequency Table for Sex:")
print(sex_freq)

# Correlation coefficients
cor_ld72 <- cor(lead$MAXFWT, lead$Ld72, use = "complete.obs")
cor_ld73 <- cor(lead$MAXFWT, lead$Ld73, use = "complete.obs")
print("Correlation Coefficients:")
cat("MAXFWT vs Ld72:", cor_ld72, "\n")
cat("MAXFWT vs Ld73:", cor_ld73, "\n")

