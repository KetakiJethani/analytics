df <- data.frame(age = c(18, 21, 22, 24, 26, 26, 27, 30, 31, 35, 39, 40, 41, 42, 44, 46, 47, 48, 49, 54), spend = c(10, 11, 22, 15, 12, 13, 14, 33, 39, 37, 44, 27, 29, 20, 28, 21, 30, 31, 23, 24))
df
head(df)
km1 = kmeans(df, centers=3)
km1



######sir's clustering######

#Clustering
#sample data, iris, no of clusters


#sample Data
marks = data.frame(sub1=c(0,1,2,4,5,4,6,7),sub2=c(0,1,2,3,3,4,5,5))
km1 = kmeans(marks, center=2)
km1
plot(marks,col=km1$cluster,cex=1.5)
points(km1$center,col=1:2,pch=8,cex=2)      #km1$center plots the centroid
km1$betweenss
km1$tot.withinss
km1$withinss
km1$totss


#iris dataset

#Plot1----
install.packages('cluster')
install.packages('fpc')
library(cluster)
library(fpc)

data(iris)
data = iris[, -5] # without known classification 
# Kmeans cluster analysis
iriskm1 =  kmeans(data, centers=3)
plotcluster(data, iriskm1$cluster)

# More complex : PCA method: 2 dim
clusplot(data, iriskm1$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

# another method
with(iris, pairs(data, col=c(1:3)[iriskm1$cluster])) 


#Finding optimal No of Clusters
iris
table(iris$Species)
data = iris[-5]  #remove target column
head(data)

km1= kmeans(data,centers=1)
km1$tot.withinss; km1$withinss

km2= kmeans(data,centers=2)
km2$tot.withinss; km2$withinss

km3= kmeans(data,centers=3)
km3$tot.withinss ; km3$withinss


km4= kmeans(data,centers=4)
km4$tot.withinss; km4$withinss

km5= kmeans(data,centers=5)
km5$tot.withinss;km5$withinss


km1$tot.withinss; km2$tot.withinss ; km3$tot.withinss ; km4$tot.withinss ; km5$tot.withinss
data[km5$cluster == 4,]

#Selecting the number of clusters

install.packages('NbClust')
library(NbClust)
nc = NbClust(data, distance="euclidean",min.nc=2, max.nc=15, method="average")  
#avg -  distance Dij between two clusters Ci and Cj is the mean of the distances between the pair of points x and y

kiris = kmeans(data, centers=3)
kiris$centers
irisclusters = cbind(iris$Species, data, kiris$cluster)
head(irisclusters)

library(dplyr)
iris %>% group_by(Species) %>% summarise_all(mean)
kiris$centers
#setsoa - Cluster1, etc
#grouping may not be perfect, but close to orginal classification
#this way we can do Customer, Product Segmentation
#Other Clustering Techniques - Hierarchical etc





#Scaling in Clusters: marks of different max
set.seed(1234); marks50 = ceiling(runif(100, 1,50)) 
set.seed(1234); marks500 = ceiling(runif(100, 250,500)) 

students1= data.frame(marks50, marks500)
head(students1)

skm1 = kmeans(students1, centers=3)
skm1$centers
skm1$withinss

#scaling gives equal importance to all variables
#avoid obtaining clusters that are dominated by variables having the largest amount of variation

students2 = scale(students1)
head(students2)
skm2 = kmeans(students2, centers=3)
skm2$centers
skm2$withinss

par(mfrow=c(1,2))
plot(students1$marks50, students1$marks500, col=skm1$cluster)
plot(students1$marks50, students1$marks500, col=skm2$cluster)
#better cluster in 2nd case
par(mfrow=c(1,1))