library(GGally)

dim(d<-read.csv('./testing.csv'))

# Score is outcome variable
ggpairs(d, columns=c('R','F','RS','Tenure','Score'), axisLabels='none', upper=list(continuous='density'))

library(rms)

# proportional odds ordinal logistic regression
orm(Score ~ RS + Tenure, data=d, family=probit)

orm(Score ~ R + F + RS + Tenure, data=d, family=probit)

#as RS increases so does Score
plot(exp(d$RS), exp(d$Score))

d1 <- na.omit(d[,c('R','F','RS','Tenure','Score')])
d1 <- exp(na.omit(d[,c('R','F','RS','Tenure','Score')]))
cor(d1)

# higher correlation comes from RS

d1 <- na.omit(d[,c('R','F','RS','Tenure','Score')])
d1$clustering <- factor(kmeans(d1, centers=2)$cluster)

ggpairs(d1, columns=c('R','F','RS','Tenure','Score'), colour='clustering', axisLabels='none', upper=list(continuous='density'))


