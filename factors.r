#!/usr/bin/env Rscript

get.data <- function() {
    source("script_env.r")

    bdims.df <- get.raw.df("https://www.openintro.org/data/csv/","bdims.csv")
    out.df <- data.frame(height=bdims.df$hgt,weight=bdims.df$wgt,gender=bdims.df$sex)
    out.df$gender[out.df$gender==0] = "female"
    out.df$gender[out.df$gender=="1"] = "male"
    out.df$gender  <- factor(out.df$gender)
    return(out.df)
}

cardinal.directions = c("north","south","east","west")
cat("cardinal.directions:\n")
print(cardinal.directions)

data <- sample(cardinal.directions,12,T)
cat("the data:\n")
print(data)
cat("is it factor?",is.factor(data),"\n")
data <- factor(data) 
cat("what about now?",is.factor(data),"\n")
print(data)
cat("sorted:\n")
print(sort(data))
cat("reordered:\n")
data <- factor(data, levels=cardinal.directions)
print(data)

cat("Factor generation with gl(4,3,labels=cardinal.directions)\n")
print(gl(4,3,labels=cardinal.directions))

input.data <- get.data()
cat("Input.data:\n")
print(str(input.data))

fn <- file.path(IMG.DIR,"factors_dot_plot.png")
if (!file.exists(fn)) {
    require(ggplot2)
    input.plot <- ggplot(input.data,aes(weight,height)) + geom_point(aes(colour=gender,shape=gender))
    print(input.plot)
    ggsave(fn,input.plot,device="png")
}
cat("Plot has been written to:",fn,"\n")

## data variables:
## bia.di - A numerical vector, respondent's biacromial diameter in centimeters.
## bii.di - A numerical vector, respondent's biiliac diameter (pelvic breadth) in centimeters.
## bit.di - A numerical vector, respondent's bitrochanteric diameter in centimeters.
## che.de - A numerical vector, respondent's chest depth in centimeters, measured between spine and sternum at nipple level, mid-expiration.
## che_di - A numerical vector, respondent's chest diameter in centimeters, measured at nipple level, mid-expiration.
## elb_di - A numerical vector, respondent's elbow diameter in centimeters, measured as sum of two elbows.
## wri_di - A numerical vector, respondent's wrist diameter in centimeters, measured as sum of two wrists.
## kne_di - A numerical vector, respondent's knee diameter in centimeters, measured as sum of two knees.
## ank_di - A numerical vector, respondent's ankle diameter in centimeters, measured as sum of two ankles.
## sho_gi - A numerical vector, respondent's shoulder girth in centimeters, measured over deltoid muscles.
## che_gi - A numerical vector, respondent's chest girth in centimeters, measured at nipple line in males and just above breast tissue in females, mid-expiration.
## wai_gi - A numerical vector, respondent's waist girth in centimeters, measured at the narrowest part of torso below the rib cage as average of contracted and relaxed position.
## nav_gi - A numerical vector, respondent's navel (abdominal) girth in centimeters, measured at umbilicus and iliac crest using iliac crest as a landmark.
## hip_gi - A numerical vector, respondent's hip girth in centimeters, measured at at level of bitrochanteric diameter.
## thi_gi - A numerical vector, respondent's thigh girth in centimeters, measured below gluteal fold as the average of right and left girths.
## bic_gi - A numerical vector, respondent's bicep girth in centimeters, measured when flexed as the average of right and left girths.
## for_gi - A numerical vector, respondent's forearm girth in centimeters, measured when extended, palm up as the average of right and left girths.
## kne_gi - A numerical vector, respondent's knee diameter in centimeters, measured as sum of two knees.
## cal_gi - A numerical vector, respondent's calf maximum girth in centimeters, measured as average of right and left girths.
## ank_gi - A numerical vector, respondent's ankle minimum girth in centimeters, measured as average of right and left girths.
## wri_gi - A numerical vector, respondent's wrist minimum girth in centimeters, measured as average of right and left girths.
## age - A numerical vector, respondent's age in years.
## wgt - A numerical vector, respondent's weight in kilograms.
## hgt - A numerical vector, respondent's height in centimeters.
## sex - A categorical vector, 1 if the respondent is male, 0 if female.
