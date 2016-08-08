schubert <- data[ which(data$composer == 'Schubert'), ]
plot(schubert$date, schubert$average_nPVI)
sort(schubert$date)
schubert <- data[ which(data$composer == 'Schubert' & data$date < 1900), ]
plot(schubert$date, schubert$average_nPVI)
mymodel <- lm(schubert$average_nPVI ~ schubert$date)
summary(mymodel)
abline(mymodel)
mymodel <- lm(schubert$melodic_entropy ~ schubert$date)
abline(mymodel)
plot(schubert$date, schubert$melodic_entropy)
####creating data
theorists <- c("Schenker", "Rameau", "Riemann", "Schoenberg", "Kurth")
salary_thousands <- c(50, 20, 96, 123, 11)
theorist_data <- data.frame(theorists, salary_thousands)

####Loading in data
setwd("~/Dropbox/Teaching/2015-2016/mus7921/corpus/Monody/Themes/all/")
data <- read.csv("theme_data.csv", header=T)

##### Plot the data of Average NPVI Over time.
plot(data$date, data$average_nPVI)

####Whoah that's messy. Let's subset 100 pieces.
randomsubset <- data[sample(1:nrow(data), 1000, replace=FALSE),]

####Let's plot this new subset.
plot(randomsubset$date, randomsubset$average_nPVI)

#### Is there a correlation of time and npvi?
lm(randomsubset$average_nPVI ~ randomsubset$date + randomsubset$intervallic_entropy)
summary(lm(randomsubset$average_nPVI ~ randomsubset$date))
subsetted_data <- data.frame(randomsubset$intervallic_entropy, randomsubset$melodic_entropy, randomsubset$average_nPVI)
mycor <- cor(subsetted_data, method="pearson")
corrplot(mycor)
###Let's add a slope.
abline(lm(randomsubset$average_nPVI ~ randomsubset$date))

###And now with a cool color.
abline(lm(randomsubset$average_nPVI ~ randomsubset$date), col="red")

##There's got to be a better way! Let's write a function.
overtime <- function(myvariable, samplesize){
  lm(myvariable ~ randomsubset$date)
  summary(lm(myvariable ~ randomsubset$date))
  plot(randomsubset$date, myvariable)
  abline(lm(myvariable ~ randomsubset$date)) 
}

##There's got to be an even better way! Let's define more variables.
better_overtime <- function(myvariable, mycolor, samplesize){
  mysubset <- data[sample(1:nrow(data), samplesize, replace=FALSE),]
  my_model <- lm(myvariable ~ mysubset$date)
  summary(my_model)
  plot(mysubset$date, myvariable)
  abline(lm(my_model), col=mycolor) 
}

################### Schubert Hypothesis ##################

###Subset the data
schubert <- data[ which(data$composer == 'Schubert'), ]
####plot the data
plot(schubert$date, schubert$average_nPVI)
sort(schubert$date)

##resubset
schubert <- data[ which(data$composer == 'Schubert' & data$date < 1829), ]
control <- data[ which(data$composer != 'Schubert' & data$date < 1829 & data$date > 1821), ]


plot(schubert$date, schubert$average_nPVI)

###linear regression
mymodel <- lm(schubert$average_nPVI ~ schubert$date)
summary(mymodel)
abline(mymodel, col="red")
mymodel <- lm(schubert$melodic_entropy ~ schubert$date)
abline(mymodel)
plot(schubert$date, schubert$melodic_entropy)

controllm <- lm(control$average_nPVI ~ control$date)
lines(abline(controllm))
#####now a function

schubs <- function(schubert_plot){
  mymodel <- lm(control$intervallic_entropy ~ control$date)
  plot(control$date, control$intervallic_entropy, xlab= "Date (from 1821-1828)", ylab="Intervallic Entropy")
  abline(mymodel)
  points(schubert$date, schubert$intervallic_entropy, pch=schubert$intervallic_entropy, xlab= "Date (from 1821-1828)", ylab="Intervallic Entropy")
  abline(lm(schubert$intervallic_entropy ~ schubert$date), col="red")
  summary(mymodel) 
}
par
###correlation
subsetted_data <- data.frame(schubert$melodic_entropy, schubert$intervallic_entropy, schubert$average_nPVI)
mycor <- cor(subsetted_data, method="pearson")
corrplot(mycor, method = "square")

###################NEW DATA ###############


#####Chi-squared

#brahms test
hemiola <- rbind(c(5000,23), c(500, 9))
hemiola
chisq.test(hemiola)

#####National anthems vs. standard
triple <- rbind(c(22,218), c(1576, 7927))
chisq.test(triple)
results <- chisq.test(triple)
results$p.value
results$expected


#####t-test
wagner <- (data[ which(data$composer == 'Wagner'), ])
brahms <- (data[ which(data$composer == 'Brahms'), ])
hist(wagner$intervallic_entropy)
hist(brahms$intervallic_entropy)
t.test(brahms$intervallic_entropy, wagner$intervallic_entropy)




##################### Multiple Regressions

##get a random dataset
randomsubset <- data[sample(1:nrow(data), 1000, replace=FALSE),]

###this is how a multiple regression works
lm(randomsubset$average_nPVI ~ randomsubset$date + randomsubset$intervallic_entropy)
summary(lm(randomsubset$average_nPVI ~ randomsubset$date))

###lets try it a little differently
subsetted_data <- data.frame(randomsubset$intervallic_entropy, randomsubset$melodic_entropy, randomsubset$average_nPVI)
mycor <- cor(subsetted_data, method="pearson")


library("corrplot", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
mycor <- cor(subsetted_data, method="pearson")
corrplot(mycor)



###function for finding p=values and stuff
flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}

library(Hmisc)
res<-rcorr(as.matrix(subsetted_data))
flattenCorrMatrix(res$r, res$P)

####Standard Error
stderror <- function(x) {
  sd(x)/sqrt(length(x))
}

