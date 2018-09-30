install.packages("dplyr")
library("dplyr")

dplyr::filter(mtcars, mpg > 25)        #filter is one of the functions in dplyr
dplyr::filter(mtcars, mpg > 25 & am == 1)  #package is mentioned only if you have fucntion with the same name in 2 different packages. else we can type in without package name as well.

filter(mtcars, mpg > 30)

mtcars %>% filter(mpg>25 & am==1) %>% arrange(wt)
#what this does is filters the data and applies the further functions on only the filtered data. this is called piping.
mtcars %>% filter(mpg>25 & am==1) %>% arrange(wt) %>% summarise(n())  #piping

mtcars %>% group_by(am)
mtcars %>% group_by(am) %>% summarise(mean(mpg))
mtcars %>% group_by(gear) %>% summarise(mean(mpg))   #finding mean milleage for each gear type. by using group_by i.e. grouping it by each gear type.
