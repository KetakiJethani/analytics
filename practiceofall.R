#create a row DF with following variables
#gender, spl, age, experience, grade, placement

?vector
(gender = sample(c('M', 'F'), size=100, replace= T, prob = c(0.6, 0.4)))
(spl = sample(c('MArketing', 'Finance', 'HR'), size=100, replace=T, prob = c(0.4, 0.3, 0.3)))
(experience = floor(rnorm(100,4,1)))
(age = ceiling(runif(100, min = 21, max = 30)))
(grade2 = sample(c('A', 'B', 'C', 'D'), size=100, replace=T, prob=c(0.4, 0.3, 0.1, 0.2)))  #had to skip grade and grade1 because 
(grade201 = factor(grade2, ordered=T, levels=c('D', 'C', 'B', 'A')))
(placement = sample(c('Yes', 'No'), size=100, replace=T))
length(gender)
length(spl)
length(experience)
length(age)
length(grade2)
(student = data.frame(gender, spl, experience, age, grade201, placement))
summary(student)



#write a data frame as a csv file
#write.csv(student, '/data/ximb.csv')



#summarise the data in various ways using dplyr
library(dplyr)
names(student)    #displays names of all the columns
student %>% group_by(gender) %>% summarise(mean(experience), max(experience), mean(age))
student %>% group_by(gender) %>% summarise(max(experience))
student %>% filter(spl=='Marketing') %>% group_by(spl) %>% summarise(mean(experience))
summary(experience)
pairs(student[, c('age', 'experience')])
par(mfrow=c(1,1))
hist(student$age)    #can only be done for continuous data
t1=table(student$placement)
barplot(t1, col=1:2)
par(mfrow=c(2,2))      #plotting region is divided in block of 2 is to 2. therefore, here there can be 4 plots/graphs plotted at once.. on one page
pie(table(student$gender), radius = 7)
pie(table(student$age), radius = 7)
pie(table(student$experience), radius = 7)
pie(table(student$spl), radius = 7)
par(mfrow=c(1,1))    #to restore it back to a 1 by 1 screen


#find students having largest experience in each spl for each gender
student %>% group_by(spl,gender) %>% arrange(spl, gender, experience) %>% top_n(1, experience)

head(student)

#clustering
km3 = kmeans(student[,c('age', 'experience')], centers = 3)
km3
km3$cluster
plot(student[,c('age', 'experience')], col=km3$cluster)


#decision tree
library(rpart)
library(rpart.plot)

fit3 <- rpart(placement ~ . , data=student)   #placement should be a factor because you are predicting yes or not... not a numeric data(for decision trees)
fit3
rpart.plot(fit3, nn=T, cex=.8)
printcp(fit3)
prunefit3 = prune(fit3, cp=0.01)
rpart.plot(prunefit3, cex = .8, nn=T)
ndata = sample_n(student, 3)    #picking out n sample data and deciding what is the likelyhood of them getting selected
ndata
predict(fit3, newdata = ndata, type='class')   #class means in this case predicting yes or no
predict(fit3, newdata = ndata, type='prob')   #prob means predicting the probabailties of the previously obtained yes or no


#logistic Regression

logitmodel3 = glm(placement ~ ., data = student, family = 'binomial')
summary(logitmodel3)
logitmodel4 = glm(placement ~ age + gender, data = student, family='binomial')
summary(logitmodel4)


#linear regression
linear3 = lm(age ~ . , data = student)
summary(linear3)



?rpart.plot
?filter
?runif
?rnorm
