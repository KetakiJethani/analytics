# xts  - create object and export data

install.packages('xts')
library(xts)

#create matrix : 1 col for 1 share
(stockprices = matrix(c(100,103, 105, 205, 210, 207, 530, 500, 535), ncol=3, byrow = F))
(cdtindex = c('25-09-2018', '27-09-2018', '28-09-2018')) #3 dates because there are 3 dates
#convert to date format
(dtindex = as.Date(cdtindex, format="%d-%m-%Y"))
#now we have index + matrix for xts object

(ts_xts = xts(x=stockprices, order.by=dtindex))
#this series is not continuous but has missing dates wherein 26th is missing

#-----
#matrix data extract
coredata(ts_xts)
#extract dates
index(ts_xts)

colMeans(ts_xts)
colnames(ts_xts) = c('SBI', 'ICICI', 'HDFC')
colnames(ts_xts)


#multivariate.. try this out later
multidate = c()



#write to csv file
write.zoo(ts_xts, "./data/zoodata.csv")
