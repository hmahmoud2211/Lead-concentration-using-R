# Load required package
library(ggplot2)

# Bar chart of Sex
ggplot(lead, aes(x = Sex)) +
  geom_bar() +
  labs(title = "Bar Chart of Gender", x = "Sex", y = "Count") +
  theme_minimal()

# Bar chart of mean MAXFWT by Sex
mean_maxfwt <- lead %>%
  group_by(Sex) %>%
  summarise(Mean_MAXFWT = mean(MAXFWT, na.rm = TRUE))
ggplot(mean_maxfwt, aes(x = Sex, y = Mean_MAXFWT)) +
  geom_bar(stat = "identity") +
  labs(title = "Mean MAXFWT by Gender", x = "Sex", y = "Mean MAXFWT") +
  theme_minimal()

# Histogram of Age
ggplot(lead, aes(x = Age)) +
  geom_histogram(bins = 30, fill = "blue", alpha = 0.5) +
  labs(title = "Histogram of Age", x = "Age", y = "Count") +
  theme_minimal()

# Histogram of MAXFWT
ggplot(lead, aes(x = MAXFWT)) +
  geom_histogram(bins = 30, fill = "green", alpha = 0.5) +
  labs(title = "Histogram of MAXFWT", x = "MAXFWT", y = "Count") +
  theme_minimal()

# Scatterplot of Ld72 vs MAXFWT with regression lines by Sex
ggplot(lead, aes(x = Ld72, y = MAXFWT, color = Sex)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatterplot of Ld72 vs MAXFWT by Gender", x = "Ld72", y = "MAXFWT") +
  theme_minimal()

# Boxplot of Age
ggplot(lead, aes(y = Age)) +
  geom_boxplot() +
  labs(title = "Boxplot of Age", y = "Age") +
  theme_minimal()

# Boxplot of MAXFWT by Ld72 (as factor)
lead$Ld72_factor <- as.factor(cut(lead$Ld72, breaks = quantile(lead$Ld72, na.rm = TRUE)))
ggplot(lead, aes(x = Ld72_factor, y = MAXFWT)) +
  geom_boxplot() +
  labs(title = "Boxplot of MAXFWT by Ld72 Levels", x = "Ld72 (Quantiles)", y = "MAXFWT") +
  theme_minimal()

# Boxplot of MAXFWT by Ld73 (as factor)
lead$Ld73_factor <- as.factor(cut(lead$Ld73, breaks = quantile(lead$Ld73, na.rm = TRUE)))
ggplot(lead, aes(x = Ld73_factor, y = MAXFWT)) +
  geom_boxplot() +
  labs(title = "Boxplot of MAXFWT by Ld73 Levels", x = "Ld73 (Quantiles)", y = "MAXFWT") +
  theme_minimal()

