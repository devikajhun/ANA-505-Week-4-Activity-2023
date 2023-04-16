#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))
df<- as.data.frame(Titanic)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(df)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library(package="dplyr")

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
df %>% select (Survived, Sex)

#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
df2 <- df %>% select (Survived, Sex)
df2

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
df2 %>% select(-c(Sex))

#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
df2 %>% rename (Gender = Sex)

#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
df3 <- df2 %>% rename (Gender = Sex)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
df4<- df3 %>% filter(Gender == "Male")

#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
df3 %>% arrange(Gender)

#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here: 2201
df %>% summarise(bygender = sum(Freq), .groups = 'drop')
total=mutate(df, total = cumsum(Freq))
total
#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
df5 <- df3 %>% filter(Gender == "Female")

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
df6 <-bind_rows(df4, df5)
df6
#Optional Task: add any of the other functions 
#you learned about from the dplyr package

