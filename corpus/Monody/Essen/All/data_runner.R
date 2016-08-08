setwd("Dropbox/Teaching/2015-2016/mus7921/corpus/Monody/Essen/All/")
data <- system("./country_interval.sh")



data1 <- c(1,2,3,5,6)
data2 <- c(1,2,3,4,6)
data3 <- c(1,2,3,4,6)
data4 <- c(1,16,4,2,1)
data5 <- c(2,1,2,1,2)

my_data <- as.matrix(data1, data2, data3, data4, data5)

my_cor <- cor(data1, data2, data3, data4, data5)
corrplot(my_cor)

