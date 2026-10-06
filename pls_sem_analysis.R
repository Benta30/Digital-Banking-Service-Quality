# ============================================================
# PROJECT 1: DIGITAL BANKING SERVICE QUALITY & CUSTOMER LOYALTY
# PLS-SEM analysis using seminr
# Dataset: 300 simulated respondents
# ============================================================

# Install once if needed:
# install.packages(c("seminr", "readr", "dplyr", "psych", "ggplot2"))

library(seminr)
library(readr)
library(dplyr)
library(psych)
library(ggplot2)

# ------------------------------------------------------------
# 1. Import data
# ------------------------------------------------------------
data <- read_csv("data/digital_banking_pls_sem_300.csv")

# Inspect
str(data)
summary(data)

# ------------------------------------------------------------
# 2. Basic data checks
# ------------------------------------------------------------
# Missing values
colSums(is.na(data))

# Duplicate respondent IDs
sum(duplicated(data$Respondent_ID))

# Descriptive statistics for measurement items
item_data <- data %>%
  select(starts_with("DSQ"), starts_with("SAT"),
         starts_with("TRU"), starts_with("LOY"))

describe(item_data)

# ------------------------------------------------------------
# 3. Measurement model
# ------------------------------------------------------------
# All constructs are modelled as reflective composites.
measurement_model <- constructs(
  composite("DSQ", multi_items("DSQ", 1:4)),
  composite("SAT", multi_items("SAT", 1:4)),
  composite("TRU", multi_items("TRU", 1:4)),
  composite("LOY", multi_items("LOY", 1:4))
)

# ------------------------------------------------------------
# 4. Structural model
# ------------------------------------------------------------
# Direct effects:
# DSQ -> SAT
# DSQ -> LOY
# SAT -> LOY
# TRU -> LOY
#
# Mediation:
# DSQ -> SAT -> LOY
#
# This model allows the indirect effect of DSQ on LOY
# through SAT to be assessed using bootstrapping.

structural_model <- relationships(
  paths(from = "DSQ", to = c("SAT", "LOY")),
  paths(from = "SAT", to = "LOY"),
  paths(from = "TRU", to = "LOY")
)

# ------------------------------------------------------------
# 5. Estimate PLS-SEM model
# ------------------------------------------------------------
pls_model <- estimate_pls(
  data = data,
  measurement_model = measurement_model,
  structural_model = structural_model
)

# ------------------------------------------------------------
# 6. Inspect model results
# ------------------------------------------------------------
summary_pls <- summary(pls_model)

# Measurement model
summary_pls$loadings
summary_pls$reliability
summary_pls$validity

# Structural model
summary_pls$paths
summary_pls$path_coef
summary_pls$rSquared
summary_pls$HTMT

# ------------------------------------------------------------
# 7. Bootstrapping
# ------------------------------------------------------------
# 5,000 bootstrap resamples
boot_model <- bootstrap_model(
  seminr_model = pls_model,
  nboot = 5000,
  cores = 2,
  seed = 42
)

boot_summary <- summary(boot_model)

# Bootstrap path estimates and confidence intervals
boot_summary$bootstrapped_paths

# ------------------------------------------------------------
# 8. Indirect / mediation effect
# ------------------------------------------------------------
# DSQ -> SAT -> LOY
#
# The indirect effect is evaluated from the bootstrapped
# path estimates. Inspect the bootstrap results and report
# the indirect effect with its confidence interval.

boot_summary$total_indirect_effects

# ------------------------------------------------------------
# 9. Model quality checks
# ------------------------------------------------------------
# R-squared
boot_summary$rSquared

# Reliability / validity
summary_pls$reliability
summary_pls$validity
summary_pls$HTMT

# ------------------------------------------------------------
# 10. Simple descriptive visualisation
# ------------------------------------------------------------
# Composite scores are useful for descriptive reporting.
data <- data %>%
  mutate(
    DSQ_score = rowMeans(select(., DSQ1:DSQ4)),
    SAT_score = rowMeans(select(., SAT1:SAT4)),
    TRU_score = rowMeans(select(., TRU1:TRU4)),
    LOY_score = rowMeans(select(., LOY1:LOY4))
  )

ggplot(data, aes(x = DSQ_score, y = LOY_score)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Digital Service Quality and Customer Loyalty",
    x = "Digital Service Quality Score",
    y = "Customer Loyalty Score"
  ) +
  theme_minimal()

# ------------------------------------------------------------
# 11. Export key results
# ------------------------------------------------------------
write.csv(summary_pls$paths,
          "outputs/path_coefficients.csv",
          row.names = TRUE)

write.csv(summary_pls$reliability,
          "outputs/reliability.csv",
          row.names = TRUE)

write.csv(summary_pls$validity,
          "outputs/validity.csv",
          row.names = TRUE)

write.csv(summary_pls$HTMT,
          "outputs/HTMT.csv",
          row.names = TRUE)

cat("Analysis complete. Review the outputs and interpret each hypothesis.\n")
