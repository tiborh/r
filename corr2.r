## https://www.statmethods.net/stats/correlations.html

## Correlations/covariances among numeric variables in
## data frame mtcars. Use listwise deletion of missing data.
cor(mtcars, use="complete.obs", method="kendall")
## same as: cov(mtcars, use="complete.obs")

# Correlations with significance levels
require(Hmisc)
## rcorr(x, type="pearson") # type can be pearson or spearman

#mtcars is a data frame
rcorr(as.matrix(mtcars))

# Correlation matrix from mtcars
# with mpg, cyl, and disp as rows
# and hp, drat, and wt as columns
x <- mtcars[1:3]
y <- mtcars[4:6]
cor(x, y)

# polychoric correlation
# x is a contingency table of counts
require(polycor)
polychor(x)

# heterogeneous correlations in one matrix
# pearson (numeric-numeric),
# polyserial (numeric-ordinal),
# and polychoric (ordinal-ordinal)
# x is a data frame with ordered factors
# and numeric variables
## require(polycor)
hetcor(x)

# partial correlations
## require(ggm)
## ERROR: dependency ‘graph’ is not available for package ‘ggm’
## resolution:
## install.packages("BiocManager")
## BiocManager::install("graph")
## then:
## install.packages("ggm")
require(ggm)
data(mtcars)
myvars <- c("mpg","cyl","disp","hp","drat")
pcor(myvars, var(mtcars[myvars]))
## partial corr between a and b controlling for x, y, z


## https://www.statmethods.net/advgraphs/correlograms.html
# First Correlogram Example
require(corrgram)
corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
  upper.panel=panel.pie, text.panel=panel.txt,
  main="Car Milage Data in PC2/PC1 Order")


# Second Correlogram Example
## library(corrgram)
corrgram(mtcars, order=TRUE, lower.panel=panel.ellipse,
  upper.panel=panel.pts, text.panel=panel.txt,
  diag.panel=panel.minmax,
  main="Car Mileage Data in PC2/PC1 Order")


# Third Correlogram Example
## library(corrgram)
corrgram(mtcars, order=NULL, lower.panel=panel.shade,
  upper.panel=NULL, text.panel=panel.txt,
  main="Car Milage Data (unsorted)")


# Changing Colors in a Correlogram
## library(corrgram)
## col.corrgram <- function(ncol){   
##   colorRampPalette(c("darkgoldenrod4", "burlywood1",
##   "darkkhaki", "darkgreen"))(ncol)}
corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         col.regions = colorRampPalette(c("darkgoldenrod4", "burlywood1",
  "darkkhaki", "darkgreen")),
       main="Correlogram of Car Mileage Data (PC2/PC1 Order)")
