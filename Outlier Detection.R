# Function to detect outliers
detect_outliers <- function(x) {
  q <- quantile(x, c(0.25, 0.75), na.rm = TRUE)
  iqr <- q[2] - q[1]
  lower <- q[1] - 1.5 * iqr
  upper <- q[2] + 1.5 * iqr
  outliers <- which(x < lower | x > upper)
  return(outliers)
}
boxplot(lead$MAXFWT,
        main = "Boxplot of Age",
        ylab = "Age",
        col = "lightblue")
outliers_maxfwt <- detect_outliers(lead$MAXFWT)
cat("Outliers in MAXFWT:", outliers_maxfwt, "\n")
boxplot(lead$Ld73,
        main = "Boxplot of Age",
        ylab = "Age",
        col = "orange")
outliers_ld73 <- detect_outliers(lead$Ld73)
cat("Outliers in Ld73:", outliers_ld73, "\n")
boxplot(lead$Ld72,
        main = "Boxplot of Age",
        ylab = "Age",
        col = "blue")
outliers_ld72 <- detect_outliers(lead$Ld72)
cat("Outliers in Ld72:", outliers_ld72, "\n")

boxplot(lead$Age,
        main = "Boxplot of Age",
        ylab = "Age",
        col = "red")
outliers_age <- detect_outliers(lead$Age)
cat("Outliers in Age:", outliers_age, "\n")

# Thoughts
cat("Thoughts: Outliers may indicate extreme lead exposure or measurement errors. They could skew statistical analyses like means or regression models. Consider their context (e.g., are they biologically plausible?) before proceeding.\n")
