library(GGally)

data(iris)

#actual labeling according to Species
png('Plots/72827-1.png')
ggpairs(iris, columns=c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"), colour='Species', lower=list(continuous='points'), axisLabels='none', upper=list(continuous='blank'))
dev.off()

#labeling according to kmeans clustering
set.seed(1234)
iris$Cluster <- factor(kmeans(iris[,c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")], centers=length(levels(iris$Species)))$cluster)
png('Plots/72827-2.png')
ggpairs(iris, columns=c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"), colour='Cluster', lower=list(continuous='points'), axisLabels='none', upper=list(continuous='blank'))
dev.off()

