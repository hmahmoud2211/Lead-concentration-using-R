# Load required packages
library(nortest)
library(car)

# Normality tests
normality_results <- lapply(list(MAXFWT = lead$MAXFWT, Ld72 = lead$Ld72, Ld73 = lead$Ld73, Age = lead$Age), function(x) {
  shapiro <- shapiro.test(x[!is.na(x)])$p.value
  ad <- ad.test(x[!is.na(x)])$p.value
  c(Shapiro_Wilk = shapiro, Anderson_Darling = ad)
})
print("Normality Test Results (p-values):")
print(normality_results)

# Homoscedasticity tests for MAXFWT by Sex
levene_test <- leveneTest(MAXFWT ~ Sex, data = lead)$`Pr(>F)`[1]
bartlett_test <- bartlett.test(MAXFWT ~ Sex, data = lead)$p.value
cat("Homoscedasticity Test Results (p-values):\n")
cat("Levene's Test for MAXFWT by Sex:", levene_test, "\n")
cat("Bartlett's Test for MAXFWT by Sex:", bartlett_test, "\n")

# Thoughts
cat("Thoughts: For normality, p-values < 0.05 suggest non-normal data, which may require transformations or non-parametric tests. For homoscedasticity, p-values < 0.05 indicate unequal variances, suggesting tests that account for heteroscedasticity.\n")
