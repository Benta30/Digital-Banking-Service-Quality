# Digital Banking Service Quality and Customer Loyalty — PLS-SEM

## Project Overview

This project demonstrates how Partial Least Squares Structural Equation Modelling (PLS-SEM) can be used to examine relationships among digital banking service quality, customer satisfaction, trust, and customer loyalty.

**Important:** The dataset in this repository is **simulated data created for portfolio and learning purposes**. It does not represent real customers, a real bank, or a real client assignment.

## Research Question

> How does digital banking service quality influence customer loyalty, and does customer satisfaction mediate this relationship?

## Research Objectives

1. Assess the effect of digital service quality on customer satisfaction.
2. Assess the effect of digital service quality on customer loyalty.
3. Assess the effect of customer satisfaction on customer loyalty.
4. Assess the effect of trust on customer loyalty.
5. Determine whether customer satisfaction mediates the relationship between digital service quality and customer loyalty.

## Conceptual Model

```text
                         H2
             ┌────────────────────────┐
             │                        ▼
Digital Service Quality ────────► Customer Loyalty
          │                         ▲
          │ H1                      │ H3
          ▼                         │
Customer Satisfaction ──────────────┘

Trust ─────────────────────────────► Customer Loyalty
                    H4

Mediation:
Digital Service Quality → Customer Satisfaction → Customer Loyalty
```

## Constructs

### 1. Digital Service Quality (DSQ)

Measured using:

- DSQ1 — Digital banking is easy to use.
- DSQ2 — Digital banking services are reliable.
- DSQ3 — Transactions are completed quickly.
- DSQ4 — Digital channels provide adequate security.

### 2. Customer Satisfaction (SAT)

Measured using:

- SAT1 — Satisfaction with digital banking services.
- SAT2 — Service meets expectations.
- SAT3 — Positive digital banking experience.
- SAT4 — Overall satisfaction.

### 3. Trust (TRU)

Measured using:

- TRU1 — Trust in protection of digital information.
- TRU2 — Trust in transaction processing.
- TRU3 — Confidence using digital channels.
- TRU4 — Trust in the bank's digital services.

### 4. Customer Loyalty (LOY)

Measured using:

- LOY1 — Intention to continue using digital services.
- LOY2 — Willingness to recommend.
- LOY3 — Preference for the bank.
- LOY4 — Intention to remain with the bank.

All questionnaire items use a 1–5 Likert scale:

1 = Strongly Disagree  
2 = Disagree  
3 = Neutral  
4 = Agree  
5 = Strongly Agree

## Hypotheses

**H1:** Digital Service Quality has a positive and significant effect on Customer Satisfaction.

**H2:** Digital Service Quality has a positive and significant effect on Customer Loyalty.

**H3:** Customer Satisfaction has a positive and significant effect on Customer Loyalty.

**H4:** Trust has a positive and significant effect on Customer Loyalty.

**H5:** Customer Satisfaction mediates the relationship between Digital Service Quality and Customer Loyalty.

## Dataset

- Observations: 300
- Latent constructs: 4
- Measurement items: 16
- Demographic variables: 3
- Data type: Simulated
- Scale: 5-point Likert

## Software

Primary:

- R
- RStudio
- `seminr`

Supporting R packages:

- `readr`
- `dplyr`
- `psych`
- `ggplot2`

## Analysis Workflow

```text
Data Import
    ↓
Data Quality Checks
    ↓
Descriptive Statistics
    ↓
Measurement Model
    ↓
Reliability
    ↓
Convergent Validity
    ↓
Discriminant Validity
    ↓
Structural Model
    ↓
Path Coefficients
    ↓
R²
    ↓
Bootstrapping (5,000 samples)
    ↓
Direct Effects
    ↓
Indirect Effect
    ↓
Mediation
    ↓
Hypothesis Conclusions
```

## Key PLS-SEM Concepts

### Outer Loadings

Show how strongly each indicator represents its construct.

### Cronbach's Alpha

Assesses internal consistency of indicators.

### Composite Reliability

Assesses construct reliability and is commonly reported alongside Cronbach's alpha.

### AVE

Average Variance Extracted is used to assess convergent validity.

### HTMT

Heterotrait-Monotrait ratio is used to assess discriminant validity.

### Path Coefficient (β)

Shows the direction and strength of a structural relationship.

### R²

Shows the proportion of variance in an endogenous construct explained by its predictors.

### Bootstrapping

5,000 resamples are used to obtain empirical estimates of standard errors, confidence intervals and significance.

### Mediation

The indirect pathway:

```text
DSQ → SAT → LOY
```

is tested to determine whether Customer Satisfaction explains part of the relationship between Digital Service Quality and Customer Loyalty.

## How to Run

Open RStudio at the project root and run:

```r
install.packages(c("seminr", "readr", "dplyr", "psych", "ggplot2"))
```

Then:

```r
source("R/pls_sem_analysis.R")
```

The script will:

1. Import the dataset.
2. Check data quality.
3. Define the measurement model.
4. Define the structural model.
5. Estimate the PLS-SEM model.
6. Assess reliability and validity.
7. Run 5,000 bootstrap samples.
8. Display path coefficients.
9. Examine indirect effects.
10. Export selected results.

## What to Report

For each hypothesis, report:

- Path coefficient (β)
- Bootstrap standard error
- t-statistic where available
- p-value where available
- Confidence interval
- Decision: Supported / Not Supported

For the measurement model report:

- Outer loadings
- Cronbach's alpha
- Composite reliability
- AVE
- HTMT

For the structural model report:

- R²
- Path coefficients
- Direct effects
- Indirect effect
- Mediation result

## Example Reporting Style

Do not invent final statistical results before running the model.

After running the R script, use a format such as:

> Digital Service Quality had a positive and statistically significant effect on Customer Satisfaction (β = X.XX, p < .05), supporting H1.

For mediation:

> The indirect effect of Digital Service Quality on Customer Loyalty through Customer Satisfaction was significant based on the bootstrap confidence interval, supporting H5.

Replace X.XX with the actual output generated by R.

## Portfolio Positioning

This project demonstrates practical ability in:

- Survey data preparation
- R statistical programming
- PLS-SEM
- Measurement model assessment
- Reliability analysis
- Convergent validity
- Discriminant validity
- Structural model analysis
- Bootstrapping
- Direct-effect testing
- Mediation analysis
- Statistical interpretation
- Research reporting

## Suggested Interview Explanation

> "I developed a PLS-SEM research project using 300 simulated survey observations to investigate whether digital banking service quality influences customer loyalty, with customer satisfaction specified as a mediator and trust included as an additional predictor. I implemented the measurement and structural models in R using seminr, assessed reliability and validity, and used 5,000 bootstrap resamples to evaluate the structural paths and indirect effect."

Again, describe the dataset as simulated unless you replace it with genuine survey data.
# Digital-Banking-Service-Quality
