#combined plots
#plot, histogram, pie, etc

women
plot(women)
plot(women, type='p', pch=15, col='red')
plot(women, type='l')
plot(women, type='b', pch=18, lty=2, col=2)

title(main='Maint Title', sub='Sub Title')


#leaf and stem
stem(women$height)

#histogram
hist(women$height)
hist(women$height, breaks=10)
hist(women$height, breaks=5, col=1:5)

#histogram2
(x = rnorm(100, 50, 10))
hist(x)

hist(x, freq=F, col=1:5)
lines(density(x))


#density plot : shape of data
plot(density(x), col='red')

#pie

gender
table(gender)
pie(table(gender))
x=c(10, 20, 40, 50)
pie(x)
xlabels = c('A', 'B', 'C', 'D')
x/sum(x)
(labels2 = paste(xlabels, round(x/sum(x),2)*100, sep='-'))



#barplot

#correlation plot
pairs(women)
cov(women$height,women$height)
cor(women$height,women$height)
cor(women$height,women$weight)
cov(women$height,women$weight)
pairs(mtcars)
pairs(mtcars[1:4])
?pairs
pairs(mtcars[c('mpg', 'wt', 'hp')])
