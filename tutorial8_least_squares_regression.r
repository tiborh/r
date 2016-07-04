year <- c(2000, 2001, 2002, 2003, 2004)
rate <- c(9.34, 8.50, 7.62, 6.93, 6.60)
plot(year,rate,
     main="Commercial Banks Interest Rate for 4 Year Car Loan",
     sub="http://www.federalreserve.gov/releases/g19/20050805/")
## rate=(slope)year+(intercept)
## rate == response
## year == explanatory
fit <- lm(rate ~ year)
fit
## Call:
## lm(formula = rate ~ year)

## Coefficients:
## (Intercept)         year  
##    1419.208       -0.705  

attributes(fit)
## $names
##  [1] "coefficients"  "residuals"     "effects"       "rank"         
##  [5] "fitted.values" "assign"        "qr"            "df.residual"  
##  [9] "xlevels"       "call"          "terms"         "model"        

## $class
## [1] "lm"

fit$coefficients[1]
## (Intercept) 
##    1419.208

fit$coefficients[[1]]                   #  [1] 1419.208, so it is a list

fit$coefficients[2]
##  year 
## -0.705

## estimate for 2015:
fit$coefficients[[2]]*2015+fit$coefficients[[1]] # -1.367: irreal

## calculate the residual:
res <- rate - (fit$coefficients[[2]]*year+fit$coefficients[[1]])
res
plot(year,res,main="Residuals")

## an easier way:
residuals(fit)
## or
fit$residuals
plot(year,fit$residuals,main="Residuals")

## adding the regression line to the previous:
plot(year,rate,
     main="Commercial Banks Interest Rate for 4 Year Car Loan",
     sub="http://www.federalreserve.gov/releases/g19/20050805/")
abline(fit)

## same for 2011..2015:
year = c(2011:2015)
rate = c(5.73, 4.91, 4.43, 4.24, 4.19)
plot(year,rate,
     main="Commercial Banks Interest Rate for 4 Year Car Loan",
     sub="http://www.federalreserve.gov/releases/g19/current/")
fit <- lm(rate ~ year)
abline(fit)

summary(fit)

## Call:
## lm(formula = rate ~ year)

## Residuals:
##      1      2      3      4      5 
##  0.280 -0.165 -0.270 -0.085  0.240 

## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)  
## (Intercept) 759.57500  181.30047   4.190   0.0248 *
## year         -0.37500    0.09006  -4.164   0.0252 *
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.2848 on 3 degrees of freedom
## Multiple R-squared:  0.8525,	Adjusted R-squared:  0.8033 
## F-statistic: 17.34 on 1 and 3 DF,  p-value: 0.0252


