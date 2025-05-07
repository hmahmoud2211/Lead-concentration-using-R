# Load required packages
library(stats)
library(dplyr)

# Test 1: MAXFWT differs between males and females
# Assumptions: Check normality and homoscedasticity from step 5
t_test_sex <- t.test(MAXFWT ~ Sex, data = lead, var.equal = TRUE)
cat("T-test for MAXFWT by Sex:\n")
print(t_test_sex)
cat("Assumption Check: Normality and homoscedasticity should be confirmed from step 5. If violated, consider Welch’s t-test.\n")

# Test 2: MAXFWT lower in Ld72 > 40 vs Ld72 <= 40
lead$Ld72_group <- ifelse(lead$Ld72 > 40, "High", "Low")
t_test_ld72 <- t.test(MAXFWT ~ Ld72_group, data = lead, alternative = "greater", var.equal = FALSE)
cat("Welch’s T-test for MAXFWT by Ld72 Group:\n")
print(t_test_ld72)
cat("Assumption Check: Heteroscedasticity assumed, normality should be checked for MAXFWT.\n")

# Test 3: MAXFWT differs across gender and lead type
# Assume lead type based on Ld72 quantiles for simplicity
lead$Lead_Type <- cut(lead$Ld72, breaks = quantile(lead$Ld72, na.rm = TRUE), labels = c("Type1", "Type2", "Type3", "Type4"))
lead$Group <- interaction(lead$Sex, lead$Lead_Type)
anova_model <- aov(MAXFWT ~ Group, data = lead)
cat("ANOVA for MAXFWT by Gender and Lead Type:\n")
print(summary(anova_model))
# Post-hoc test
post_hoc <- TukeyHSD(anova_model)
cat("Post-hoc Test Results:\n")
print(post_hoc)
cat("Assumption Check: Normality and homoscedasticity should be confirmed. If violated, consider non-parametric tests like Kruskal-Wallis.\n")
