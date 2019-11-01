R version 3.6.1 (2019-07-05) -- "Action of the Toes"
Copyright (C) 2019 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin15.6.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from ~/.RData]

> library(readr)
> other_hist_complete_data <- read_csv("Desktop/Project-3_Do_not_upload/data/complete_data/other_hist_complete_data.csv")
Parsed with column specification:
cols(
  year = col_double(),
  zip_code = col_double(),
  pct_wht = col_double(),
  pct_25_34 = col_double(),
  pct_college_deg = col_double(),
  pct_chng_pct_25_34 = col_double(),
  pct_chng_pct_college_deg = col_double(),
  pct_chng_pct_wht = col_double(),
  num_coffee_shops = col_double(),
  pct_chng_housing_price = col_double(),
  current_year_housing_price = col_double(),
  next_year_housing_price = col_double()
)
> View(other_hist_complete_data)
> reg1 <- lm(num_coffee_shops ~ pct_wht + pct_college_deg + pct_wht)
Error in eval(predvars, data, env) : object 'num_coffee_shops' not found
> reg1 <- lm(num_coffee_shops ~ pct_wht + pct_college_deg + pct_wht, data = other_hist_complete_data)
> yhat =fitted(reg1)
> final_reg = lm(next_year_housing_price~yhat + pct_wht + pct_college_deg + pct_wht, data = other_hist_complete_data)
> print(final_reg)

Call:
lm(formula = next_year_housing_price ~ yhat + pct_wht + pct_college_deg +
    pct_wht, data = other_hist_complete_data)

Coefficients:
    (Intercept)             yhat          pct_wht  pct_college_deg
        -104374           124245             7620               NA

> final_reg.coefficientsa
Error: object 'final_reg.coefficientsa' not found
> final_reg.coefficients
Error: object 'final_reg.coefficients' not found
> final_reg$coefficients
    (Intercept)            yhat         pct_wht pct_college_deg
    -104373.616      124244.509        7620.188              NA
> str(final_reg$coefficients)
 Named num [1:4] -104374 124245 7620 NA
 - attr(*, "names")= chr [1:4] "(Intercept)" "yhat" "pct_wht" "pct_college_deg"
> final_reg$coefficients["(Intercept)"]
(Intercept)
  -104373.6
> i = final_reg$coefficients["(Intercept)"]
> i
(Intercept)
  -104373.6
> reg2 = lm(next_year_housing_price ~ num_coffee_shops + pct_wht + pct_college_deg +
+               pct_wht, data = other_hist_complete_data)
> reg2$coefficients
     (Intercept) num_coffee_shops          pct_wht  pct_college_deg
     208199.2971      -12169.3444        -407.9279       17071.5937