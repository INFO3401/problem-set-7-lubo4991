#Lucas Bouchard, Problem Set 7(Friday R Tutorial)

#6. Store the contents of the titanic.csv data in a variable in R. Then print the variable. Finally, print a summary table of that variable.
getwd()
setwd("/Users/Lucas/Desktop/Lucas/GitHub/problem-set-7-lubo4991")
data <- read.csv(file='titanic.csv', head=TRUE, sep=",") 
data
summary(data)

#reference the different values in each column
#data$<column name>

#Get the fullset of column names
#names(data)

#Create a table summarizing the count of values for each possible column setting
#table(data$column name)

#7. 
#Print out the names of the columns in the titanic.csv file.
names(data)

#print out the values for the first two columns in the dataset.
data[,c(1,2)]
data$PassengerId
data$Survived

#Finally, create a table that outlines the distribution of genders in the dataset. 
gender_table <- table(data$Sex)

#look at proportion
prop_gender_table<- prop.table(gender_table)

#Use this data combined with the "Survived" column data to determine what proportion of survivors fell into each gender. 
survived_table <- table(data[,c(2)])
prop_survived_table <- prop.table(survived_table)

Survived_Sex_Table <- table(data[,c(2,5)])
Surv_Sx_Table_Prop <- prop.table(Survived_Sex_Table)
Surv_Sx_Table_Prop

#8. 

Compute the proportion of men and women who survived. Then, compute the probability that if someone was a women, they would survive the crash and the probability that if someone was a man, they would survive the crash. 

#This is showing probability of gender based on survival. 
gender_prob <- prop.table(table(data[,c(2,5)]), 1)

gender_prob

#This is showing probability of survival based on gender. 
Surv_prob <- prop.table(table(data[,c(2,5)]), 2)

Surv_prob


#We can define a new column in R that is computed from the available data. One way to do this is to create a new variable that contains only zeros: 

data$test_Column <-0


9. We want to test whether the old naval cliche of "women and children first" impacted survival. Assume that a child is anyone under the age of 18. Use the titanic dataset to answer this question by computing the average number of survivors for men and women and for children and adults. As a hint, you will need to create a new column using Age to define a child (1 for a child, 0 for not a child).

#age = 6
#children = 14
#1 for child 0 for not a child
names(data)



# I wasn't able to figure out how to remove Nulls as these are counted as a child

data$Children <-0
data$Children[data$Age < 18] <- 1

aggregate(Survived ~Sex, data=data, FUN="mean")
aggregate(Survived ~Children, data=data, FUN="mean")

#Based off of this data, the old naval cliche of "women and children first" is true to the impact of those who survived the titanic.







