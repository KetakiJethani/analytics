# Data Structures in R

#Vectors----
x=1:10    #assigning values 1 to 10
x         #printing values of x
x1 <- 1:20   #Another way of assigning values
x1
(x1=1:15)   #Assigning and printing at the same time. also x1 values from earlier got replaced
(x2=c(1,2,4,5))  #creating a vector with customised values. c stands for concatenating

(x3=letters[1:10])   #way of creating a vector of alphabets
LETTERS[1:26]       #built in function

(x3b = c("a", "4"))
class(x3b)      #displays data type of the values of variable

class(x)
(x4=c(T, FALSE, TRUE, T, F))
class(x4)
(x5b = c(1, 'a',T, 4L))

class(x5b)


#access elements
(x6 = seq(0,100,by=3))

?seq          #information about the function/ help for it.

x6[20]
x6[3]

methods(class='numeric')   #lists all the in built methods that can be used for a particular data type

ls()      #lists the variables in my environment

length(x6)   #number of elements in vector x6

x6[c(2, 4)]   #extracting elements at particularr positions together
x6[-1]  #all  #access but 1st element
x6[-c(1:10)]   #truncate 1st 10 numbers

x6[-(length(x6)-1)]  #truncated second last element

(x7 = c(x6, x2))

#modify
sort(x7)

rev(x7)

#deleting



#Normal ditribut   #small size, 
#(x = rnorm
plot(density(x1))
abline(v=mean(x1), h=0.04)



#Matrices----

100:111
(m1 = matrix(1:12, nrow=4))    
(m2 = matrix(1:12, ncol=3, byrow=TRUE))   #byrow tells R that values be printed row wise
class(m1)
attributes(m1)
dim(m1)

#access elements of a matrix

m1[1,2:3]    #displaying 2nd and 3rd columns in the 1st row
m1[c(1,3),]   #the extra comma at the end is to display all columns

paste("C", "D", sep="-")
paste("C", 1:100, sep="-")


#vector to matrix
(m3 = 1:24)
dim(m3) = c(6,4)    

m3[1:2, 1:2]

m2
rbind(m2, c(50, 60, 70))
cbind(m2, c(55, 65, 75, 85))

#matrix summary
m1
colSums(m1)
colMeans(m1)

t(m1)   #transpose. temporary. If we want to make it permanent, we say m1 = t(m1)

#sweep
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN="+") #rowise
# margin = 1 means do the operation on rows, done on respective rows, and function = "+" means , add to values of respective rows
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN="*") #colwise
# "*" means multiply the values specified to the respective columns

addmargins(m1, 2, mean)
addmargins(m1, c(1,2), mean)

addmargins(m1, c(1,2), list(list(mean, sum, max), list(var, sd)))

#Arrays----


#Data Frame----

#creating vectors
(rollno = 1:30)
(sname = paste('student', 1:30, sep=''))
(gender = sample(c('M', 'F'), size =30, replace=T, prob=c(0.7, 0.3)))
(marks = floor(rnorm(30, mean=50, sd=10))) #floor and ceiling used to eliminate decimal part
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA', 'MBA'), size=30, replace=T, prob=c(.5,.5)))
rollno; sname; gender
marks; marks2; course

#creating data frame
df1 = data.frame(rollno, sname, gender, marks, marks2, course, stringsAsFactors = F)   #do not want names to become a factor, factor is a category. therefore stringsAsFactors is made False
str(df1)    #will tell the structure of the data frame
head(df1)    
?head.data.frame
head(df1, n=3)  #top 3 rows
summary(df1)

df1$gender = factor(df1$gender)


#List----


#Factor----