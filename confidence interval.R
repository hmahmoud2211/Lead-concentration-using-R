# Confidence intervals for MAXFWT by Sex
ci_levels <- c(0.90, 0.95, 0.99)
ci_results <- lapply(ci_levels, function(conf) {
  lead %>%
    group_by(Sex) %>%
    summarise(
      Mean = mean(MAXFWT, na.rm = TRUE),
      SE = sd(MAXFWT, na.rm = TRUE) / sqrt(sum(!is.na(MAXFWT))),
      Lower = Mean - qt((1 - conf) / 2, df = sum(!is.na(MAXFWT)) - 1, lower.tail = FALSE) * SE,
      Upper = Mean + qt((1 - conf) / 2, df = sum(!is.na(MAXFWT)) - 1, lower.tail = FALSE) * SE
    ) %>%
    mutate(Confidence = conf)
})
ci_results <- do.call(rbind, ci_results)
print("Confidence Intervals for MAXFWT by Sex:")
print(ci_results)

# Interpretation
cat("Interpretation: The CIs estimate the range of the true mean MAXFWT for each gender. Higher confidence levels (e.g., 99%) produce wider intervals because we need more certainty. Narrower intervals at 90% suggest less certainty but more precision.\n")

