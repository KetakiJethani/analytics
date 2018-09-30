#creating a vector, converting to factor, and giving an order

grades = sample(c('A','B','C','D'), size=30, replace=T, prob=c(0.4, 0.2, 0.3,  0.1))
grades
summary(grades)

(gradesF = factor(grades))
summary(gradesF)

(table(gradesF))

(gradesF0 = factor(grades, ordered=T))

(gradesF01 = factor(grades, ordered=T, levels=c('B','C','A','D')))
summary(gradesF01)

#application

(marks = ceiling(rnorm(30, mean=60, sd=5)))    #creating vector with random marks

(student1 = data.frame(marks, gradesF01))    #joining numerical value with an ordered categorical variable. to plot a boxplot for categorical variable.
(gender = factor(sample(c('M', 'F'), size=30, replace=T)))
boxplot( marks ~ gradesF01, data=student1)
boxplot( marks ~ gradesF01 + gender, data=student1)

summary(marks)
abline(h= summary(marks))    #horizontal lines to understand which exact values


