# Linear regression
lm_model <- lm(MAXFWT ~ Ld73, data = lead)
cat("Linear Model Summary:\n")
print(summary(lm_model))

# 95% CI for slope
ci_slope <- confint(lm_model, "Ld73", level = 0.95)
cat("95% CI for Ld73 Slope:\n")
print(ci_slope)

# Estimate MAXFWT reduction at Ld73 = 100
intercept <- coef(lm_model)[1]
slope <- coef(lm_model)[2]
maxfwt_at_100 <- intercept + slope * 100
maxfwt_at_0 <- intercept
reduction <- maxfwt_at_0 - maxfwt_at_100
cat("Estimated MAXFWT Reduction at Ld73 = 100 μg/100 ml:", reduction, "\n")

# Interpretation
cat("Interpretation: The slope represents the change in MAXFWT per unit increase in Ld73. A negative slope suggests higher lead levels reduce MAXFWT. The 95% CI indicates the range of plausible slope values. The reduction at Ld73 = 100 estimates the expected decrease in MAXFWT compared to Ld73 = 0.\n")
