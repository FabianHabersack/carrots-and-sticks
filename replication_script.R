# ============================================================================================================
# Carrots and sticks: How voter loyalty and electoral opportunities shape parties' policy priorities in Europe
# Author: Fabian Habersack
# ============================================================================================================



# ---- PART 1: Setup ----

# Load necessary libraries
library(tidyverse)
library(broom)
library(sandwich)
library(stargazer)
library(estimatr)
library(ggthemr)

# Set plot theme
ggthemr('fresh')



# ---- PART 2: Import (a) CSES/MARPOR and (b) EES/MARPOR ----

# Import data (a)
CSES_MARPOR <- readRDS("CSES_MARPOR.RDS")

# Import data (b)
EES_MARPOR <- readRDS("EES_MARPOR.RDS")



# ---- PART 3: Main CSES-based regression models ----

# Model 1.) Baseline: Core salience (no interaction effects)
cses.1 <- lm(core ~ opportunity + loyalty +
               core_lag1 +
               pervote_change_lag1 +
               gov_vdem_dummy +
               total_qs_log_01 +
               party_age_01 +
               temp_distance_days_01 +
               n_parties_01 +
               parfamname +
               decade + 
               country, 
             na.action = na.exclude,
             data = CSES_MARPOR)

# Model 2.) Full: Core salience (with interaction)
cses.2 <- lm(core ~ opportunity * loyalty +
               core_lag1 +
               pervote_change_lag1 +
               gov_vdem_dummy +
               total_qs_log_01 +
               party_age_01 +
               temp_distance_days_01 +
               n_parties_01 +
               parfamname +
               decade + 
               country, 
             na.action = na.exclude,
             data = CSES_MARPOR)

# Model 3.) Baseline: Core salience change (no interaction effects)
cses.3 <- lm(core_change ~ opportunity + loyalty +
               pervote_change_lag1 +
               gov_vdem_dummy +
               total_qs_log_01 +
               party_age_01 +
               temp_distance_days_01 +
               n_parties_01 +
               parfamname +
               decade + 
               country, 
             na.action = na.exclude,
             data = CSES_MARPOR)

# Model 4.) Full: Core salience change (with interaction)
cses.4 <- lm(core_change ~ opportunity * loyalty +
               pervote_change_lag1 +
               gov_vdem_dummy +
               total_qs_log_01 +
               party_age_01 +
               temp_distance_days_01 +
               n_parties_01 +
               parfamname +
               decade + 
               country, 
             na.action = na.exclude,
             data = CSES_MARPOR)

# Calculate robust standard errors
cses.1.robust <- vcovHC(cses.1, type = "HC1")
cses.2.robust <- vcovHC(cses.2, type = "HC1")
cses.3.robust <- vcovHC(cses.3, type = "HC1")
cses.4.robust <- vcovHC(cses.4, type = "HC1")

# Table 2.) Regression table
stargazer(list(cses.1, cses.2, cses.3, cses.4), 
          se = starprep(cses.1, cses.2, cses.3, cses.4),
          align = TRUE, 
          no.space = TRUE, 
          type = "text", 
          omit.stat=c("f"), 
          notes = "Data: CSES/MARPOR; Robust SE in parantheses",
          star.cutoffs = c(.05, .01, .001))



# ---- PART 4: Appendix regression models using EES ----



# Model 1.) Baseline: Core salience (no interaction effects)
ees.1 <- lm(core ~ opportunity + loyalty +
              core_lag1 +
              pervote_change_lag1 +
              gov_vdem_dummy +
              total_qs_log_01 +
              party_age_01 +
              temp_distance_days_01 +
              n_parties_01 +
              parfamname +
              decade + 
              country, 
            na.action = na.exclude,
            data = EES_MARPOR)

# Model 2.) Full: Core salience (with interaction)
ees.2 <- lm(core ~ opportunity * loyalty +
              core_lag1 +
              pervote_change_lag1 +
              gov_vdem_dummy +
              total_qs_log_01 +
              party_age_01 +
              temp_distance_days_01 +
              n_parties_01 +
              parfamname +
              decade + 
              country, 
            na.action = na.exclude,
            data = EES_MARPOR)

# Model 3.) Baseline: Core salience change (no interaction effects)
ees.3 <- lm(core_change ~ opportunity + loyalty +
              pervote_change_lag1 +
              gov_vdem_dummy +
              total_qs_log_01 +
              party_age_01 +
              temp_distance_days_01 +
              n_parties_01 +
              parfamname +
              decade + 
              country, 
            na.action = na.exclude,
            data = EES_MARPOR)

# Model 4.) Full: Core salience change (with interaction)
ees.4 <- lm(core_change ~ opportunity * loyalty +
              pervote_change_lag1 +
              gov_vdem_dummy +
              total_qs_log_01 +
              party_age_01 +
              temp_distance_days_01 +
              n_parties_01 +
              parfamname +
              decade + 
              country, 
            na.action = na.exclude,
            data = EES_MARPOR)

# Calculate robust standard errors
ees.1.robust <- vcovHC(ees.1, type = "HC1")
ees.2.robust <- vcovHC(ees.2, type = "HC1")
ees.3.robust <- vcovHC(ees.3, type = "HC1")
ees.4.robust <- vcovHC(ees.4, type = "HC1")

# Table 2.) Regression table
stargazer(list(ees.1, ees.2, ees.3, ees.4), 
          se = starprep(ees.1, ees.2, ees.3, ees.4),
          align = TRUE, 
          no.space = TRUE, 
          type = "text", 
          omit.stat=c("f"), 
          notes = "Data: EES/MARPOR; Robust SE in parantheses",
          star.cutoffs = c(.05, .01, .001))
