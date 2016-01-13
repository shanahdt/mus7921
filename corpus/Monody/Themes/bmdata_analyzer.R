#####################################################################
######## Analyzes the barlow and morgenstern dataset, 
######## for meter, npvi, info, country, year, and composer
######## June, 2015 
#####################################################################


##### Set the working directory to the correct place
setwd("~/Dropbox/Scores/HumdrumScores/Monody/Themes")

#### load in my data
bm_data <- read.csv("bmdata.csv", header=T)

#### convert nationality, composer, and everything else to factors
composer <- as.numeric(factor(bm_data$composer))
composer_text <- bm_data$composer
nationality <- as.numeric(factor(bm_data$nationality))
nationality_text <- bm_data$nationality
meter <- as.numeric(factor(bm_data$meter))
meter_text <- bm_data$meter
info <- bm_data$info
keysignature <- as.numeric(factor(bm_data$key))
keysignature_text <- bm_data$key
npvi <- bm_data$npvi
year <- bm_data$year

bm_dataframe <- data.frame(composer, composer_text, nationality, nationality_text, meter, meter_text, info, keysignature, keysignature_text, npvi, year)

#### Is the nPVI/Info data normal? Run a qqplot and a k-s test.
# Kolmogorov-Smirnov Test, we DON'T want a significant result.
randomnormal <- rnorm(length(bm_dataframe$npvi))
ks.test(bm_dataframe$info, randomnormal)
ks.test(bm_dataframe$npvi, randomnormal)

###Shapiro-Wilk Test
shapiro.test(bm_data$npvi)
shapiro.test(bm_data$info)

####plotting normal distributions (or lack thereof)
qqplot(randomnormal, bm_data$npvi)
hist(bm_data$npvi)
hist(bm_data$info)

#### Let's do a multiple regression (but the data isn't parametric! Agggggh.)
#my_model <- lm(bm_dataframe$npvi ~ bm_dataframe$meter + bm_dataframe$nationality)

subsetted_data <- data.frame(meter, npvi, year, composer, nationality, info, keysignature)
my_cor <- cor(subsetted_data, method="kendall")


library(corrplot)
corrplot(my_cor, method = "square")

####with p value
library(Hmisc)
rcorr(my_cor, type="spearman") 

###subset data by country:
german <- bm_dataframe[ which(bm_dataframe$nationality_text=="German"), ]  
french <- bm_dataframe[ which(bm_dataframe$nationality_text=="French"), ]  
italian <- bm_dataframe[ which(bm_dataframe$nationality_text=="Italian"), ]  
english <- bm_dataframe[ which(bm_dataframe$nationality_text=="English"), ]  

boxplot(german$npvi, french$npvi, italian$npvi, english$npvi, names=c("german", "french", "italian", "english"))

my_regression <- lm(npvi ~ nationality +info + meter)
summary(my_regression)
