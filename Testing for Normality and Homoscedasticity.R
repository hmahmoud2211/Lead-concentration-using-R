# Load required packages
library(nortest)
library(car)
library(ggplot2)

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

# Histogram for normality check
par(mfrow=c(2, 2))  # 2x2 grid for histograms

# MAXFWT histogram
hist(lead$MAXFWT, 
     main="Histogram of MAXFWT", 
     xlab="MAXFWT", 
     col="lightblue",
     probability=TRUE)
curve(dnorm(x, mean=mean(lead$MAXFWT, na.rm=TRUE), 
            sd=sd(lead$MAXFWT, na.rm=TRUE)), 
      add=TRUE, col="red", lwd=2)

# Ld72 histogram
hist(lead$Ld72, 
     main="Histogram of Ld72", 
     xlab="Ld72", 
     col="lightgreen",
     probability=TRUE)
curve(dnorm(x, mean=mean(lead$Ld72, na.rm=TRUE), 
            sd=sd(lead$Ld72, na.rm=TRUE)), 
      add=TRUE, col="red", lwd=2)

# Ld73 histogram
hist(lead$Ld73, 
     main="Histogram of Ld73", 
     xlab="Ld73", 
     col="lightyellow",
     probability=TRUE)
curve(dnorm(x, mean=mean(lead$Ld73, na.rm=TRUE), 
            sd=sd(lead$Ld73, na.rm=TRUE)), 
      add=TRUE, col="red", lwd=2)

# Age histogram
hist(lead$Age, 
     main="Histogram of Age", 
     xlab="Age", 
     col="lightpink",
     probability=TRUE)
curve(dnorm(x, mean=mean(lead$Age, na.rm=TRUE), 
            sd=sd(lead$Age, na.rm=TRUE)), 
      add=TRUE, col="red", lwd=2)

# Reset graphical parameters
par(mfrow=c(1, 1))

# Boxplot to check homoscedasticity by gender
boxplot(MAXFWT ~ Sex, data=lead, 
        main="MAXFWT by Gender",
        xlab="Gender", 
        ylab="MAXFWT",
        col=c("lightblue", "lightpink"))
title(sub="Boxplot for checking homoscedasticity")

# QQ plots for normality check
par(mfrow=c(2, 2))
qqnorm(lead$MAXFWT, main="Q-Q Plot for MAXFWT")
qqline(lead$MAXFWT, col="red")

qqnorm(lead$Ld72, main="Q-Q Plot for Ld72")
qqline(lead$Ld72, col="red")

qqnorm(lead$Ld73, main="Q-Q Plot for Ld73")
qqline(lead$Ld73, col="red")

qqnorm(lead$Age, main="Q-Q Plot for Age")
qqline(lead$Age, col="red")

# Reset graphical parameters
par(mfrow=c(1, 1))

# Boxplots for checking homoscedasticity across Ld72 groups
lead$Ld72_group <- ifelse(lead$Ld72 > 40, "High", "Low")
boxplot(MAXFWT ~ Ld72_group, data=lead, 
        main="MAXFWT by Ld72 Group",
        xlab="Ld72 Group", 
        ylab="MAXFWT",
        col=c("lightblue", "lightgreen"))
title(sub="Boxplot for checking homoscedasticity between Ld72 groups")

