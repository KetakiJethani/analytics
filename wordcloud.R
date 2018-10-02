
install.packages('wordcloud2')
install.packages('wordcloud')


library(wordcloud2)
head(demoFreq)

?demoFreq

wordcloud2(demoFreq, size=1.6)

# Gives a proposed palette
wordcloud2(demoFreq, size=1.6, color='random-dark')

# or a vector of colors. vector must be same length than input data
wordcloud2(demoFreq, size=1.6, color=rep_len( c("green","blue"), nrow(demoFreq) ) )

# Change the background color
wordcloud2(demoFreq, size=1.6, color='random-light', backgroundColor="black")

