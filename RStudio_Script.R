#Project 1 - Data Syndicate Assignment / Jessie Alwerdt

#Data is from https://www.kaggle.com/paultimothymooney/phd-stipends/data# belonging to Paul Mooney





getwd()



setwd("C:/Users/alwer/Documents/Data Syndicate Projects DSS - FB group/Data")


#Import dataset


library("readxl")
csv <- read_excel("C:/Users/alwer/Documents/Data Syndicate Projects DSS - FB group/Data/CSV_Excel.xlsx")




#Check to see what data type each variable is


str(csv)




csv1 <- csv




csv1$Academic_Year <- as.factor(csv1$Academic_Year)
is.factor(csv$Academic_Year)
levels(csv1$Academic_Year)



csv1$Program_Year <- as.factor(csv1$Program_Year)
is.factor(csv$Program_Year)
levels(csv1$Program_Year)


#8707 Cases

#Missing
#Overall Pay: 21 missing / Min. -900000 / Max. 994000 / Mean 25124
#LW_Ratio: 911 Missing / Min. -34.01 / Max. 40.97 / Mean 1.076
#Academic Year: 4 missing
#Program Year: 1020 missing
#12 M Gross Pay: 2498 missing / Min. 1 / Max. 100000 / Mean = 28240
#9 M Gross Pay: 6233 missing / Min. 5 / Max. 189600 / Mean = 19596
#3 M Gross Pay: 7909 missing / Min. 3 / Max 55816 / Mean = 5043
#Fees: 5355 / Min. 1 / Max. 1000000 / Mean = 2870


summary(csv1)



library(naniar)
vis_miss(csv1)




#Detect outliers


csv2 <- as.matrix(csv1)



library(devtools)
#install_github("mdelacre/Routliers")


#Outliers for overall pay
#Total of 178 outliers


library(Routliers)
res1 <- outliers_mad(x = csv1$Overall_Pay)
res1

plot_outliers_mad(res1, x = csv1$Overall_Pay) 


#Outliers for 12_M_Gross_Pay
#Total of 386 Outliers



library(Routliers)
res1 <- outliers_mad(x = csv1$Twelve_M_Gross_Pay)
res1
plot_outliers_mad(res1, x = csv1$Twelve_M_Gross_Pay)


#Outliers for 9_M_Gross_Pay
#Total of 143 Outliers


library(Routliers)
res1 <- outliers_mad(x = csv1$Nine_M_Gross_Pay)
res1
plot_outliers_mad(res1, x = csv1$Nine_M_Gross_Pay)


#Had to rename variable due to not be able to reference it beginning with a number


library(plyr)
csv1 <- rename(csv1, c("3_M_Gross_Pay" = "Three_M_Gross_Pay"))



#Outliers for 3_M_Gross_Pay
#Total of 27 Outliers


library(Routliers)
res1 <- outliers_mad(x = csv1$Three_M_Gross_Pay)
res1
plot_outliers_mad(res1, x = csv1$Three_M_Gross_Pay)





library(dplyr)
table(csv1$Academic_Year, csv1$Program_Year)



#Highest year was 2016-2017 (2016 - 2020)


library(ggplot2)
table2 <- table(csv1$Academic_Year)
prop.table(table2)
ggplot(csv1, aes(x = csv1$Academic_Year)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#Drop of cases with each program year


table2 <- table(csv1$Program_Year)
prop.table(table2)
ggplot(csv1, aes(x = csv1$Program_Year)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



#Look into the character values


library("wordcloud")
library("tm")
wordcloud(words = csv1$University, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))



wordcloud(words = csv1$Department, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))




#Wanted to do so much more
#Would like to replicate in SAS and Python environment
#Would like to look at cleaning this better
#Would like to look into the missing cases more
#Outliers need to be examined closer. Some are most likely errors. 

