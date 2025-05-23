# Bar chart of Sex
barplot(table(lead$Sex),
        main = "Bar Chart of Gender",
        xlab = "Sex",
        ylab = "Count",
        col = "lightblue")

# Bar chart of mean MAXFWT by Sex
mean_maxfwt <- tapply(lead$MAXFWT, lead$Sex, mean, na.rm = TRUE)
barplot(mean_maxfwt,
        main = "Mean MAXFWT by Gender",
        xlab = "Sex",
        ylab = "Mean MAXFWT",
        col = "lightgreen")

# Histogram of Age
hist(lead$Age,
     breaks = 30,
     main = "Histogram of Age",
     xlab = "Age",
     col = rgb(0,0,1,0.5))

# Histogram of MAXFWT
hist(lead$MAXFWT,
     breaks = 30,
     main = "Histogram of MAXFWT",
     xlab = "MAXFWT",
     col = rgb(0,1,0,0.5))

# Scatterplot of Ld72 vs MAXFWT with regression lines by Sex
plot(lead$Ld72, lead$MAXFWT,
     col = as.numeric(lead$Sex),
     pch = 19,
     main = "Scatterplot of Ld72 vs MAXFWT by Gender",
     xlab = "Ld72",
     ylab = "MAXFWT")
legend("topright", legend = levels(lead$Sex), col = 1:2, pch = 19)
# Add regression lines by Sex
for (s in levels(lead$Sex)) {
  idx <- lead$Sex == s
  abline(lm(MAXFWT ~ Ld72, data = lead[idx, ]), col = which(levels(lead$Sex) == s))
}


# Boxplot of Age
boxplot(lead$Age,
        main = "Boxplot of Age",
        ylab = "Age",
        col = "orange")

# Boxplot of MAXFWT by Ld72 (as factor)
lead$Ld72_factor <- as.factor(cut(lead$Ld72, breaks = quantile(lead$Ld72, na.rm = TRUE)))
boxplot(MAXFWT ~ Ld72_factor, data = lead,
        main = "Boxplot of MAXFWT by Ld72 Levels",
        xlab = "Ld72 (Quantiles)",
        ylab = "MAXFWT",
        col = "pink")

# Boxplot of MAXFWT by Ld73 (as factor)
lead$Ld73_factor <- as.factor(cut(lead$Ld73, breaks = quantile(lead$Ld73, na.rm = TRUE)))
boxplot(MAXFWT ~ Ld73_factor, data = lead,
        main = "Boxplot of MAXFWT by Ld73 Levels",
        xlab = "Ld73 (Quantiles)",
        ylab = "MAXFWT",
        col = "lightgray")

