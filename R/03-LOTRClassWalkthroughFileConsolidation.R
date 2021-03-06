# install.packages("tidyverse")
library(tidyverse)

# find folders in working directory
dir()

# create path to data folder
dataPath = file.path("data")

# list files in the data folder
list.files(path = dataPath)

# create object with foldernames
lotrFolders = list.files(path = dataPath)

# take first three folder names
lotrFolders = lotrFolders[1:3]

# get folder name of first movie
folderName = lotrFolders[1]

# for folder 1, get chapter names
chapFilesPath = file.path("data",folderName)

# list files in the lotrFolders[1] folder
list.files(path = chapFilesPath)

# store file names in an object
fileChapNames = list.files(path = chapFilesPath)

# view contents of first file name
fileName = file.path("data",folderName,fileChapNames[1])
read_csv(fileName)

# store contents in object
lotrDF = read_csv(fileName)
lotrDF

# now scale the above to do all files
# contained in the first movie

# demo how we use a for loop to go through all files
for (chapName in fileChapNames) {
  print(chapName)
}

# create an empty data frame to hold the data
lotrDF = lotrDF[0,]  ## the zeroeth row

# now get all contents and fill the empty data frame
for (chapName in fileChapNames) {
  fileName = file.path("data",folderName,chapName)
  newRowsDF = read_csv(fileName)
  lotrDF = bind_rows(lotrDF,newRowsDF)
}

# write the data frame to a CSV file
write.csv(lotrDF,file = "firstMovie.csv",row.names = FALSE)

# answer question, who spoke the most words 
# in the first movie uysing dplyr?
lotrDF %>%
  mutate(movie = folderName) %>%
  group_by(movie,Character,Race) %>%
  summarize(wordCount = sum(Words)) %>%
  arrange(desc(wordCount))


## CLASS EXERCISE: remove one word from the below
## code figure out which Race had the most words
## in the first movie
lotrDF %>%
  mutate(movie = folderName) %>%
  group_by(movie,Character,Race) %>%
  summarize(wordCount = sum(Words)) %>%
  arrange(desc(wordCount))


## Now, get information for all the movies
## recall that we have
lotrFolders

## set up skeleton outline of how to loop through 
## each folder and then each file
for (movieName in lotrFolders) {
  chapFilesPath = file.path("data", movieName)
  fileChapNames = list.files(path = chapFilesPath)
  for (chapName in fileChapNames) {
    print(paste0(movieName, ":::", chapName))
  }
}

## use above skeleton to create a data frame
## with all of the movies

# create an empty data frame to hold the data
lotrAllDF = lotrDF[0,]  ## the zeroeth row

# now get all contents and fill the empty data frame
for (movieName in lotrFolders) {
  
  chapFilesPath = file.path("data", movieName)
  fileChapNames = list.files(path = chapFilesPath)
  
  for (chapName in fileChapNames) {
    fileName = file.path("data", movieName, chapName)
    newRowsDF = read_csv(fileName) %>% mutate(movie = movieName)
    lotrAllDF = bind_rows(lotrAllDF, newRowsDF)
  }
}

## view info
lotrAllDF

## CLASS EXERCISE:  modify below code 
## to now see who spoke the most
## across all three of the movies
lotrAllDF %>%
  group_by(movie,Character,Race) %>%
  summarize(wordCount = sum(Words)) %>%
  arrange(desc(wordCount))

write.csv(lotrAllDF,file = "allMovies.csv",row.names = FALSE)

### write down how many words Gandalf 
### spoke across all three movies

## CLASS EXERCISE:  notice there is a file
## from the first movie that is misplaced
## Specifically, "30_The Deparutre Of The Fellowship.csv"
## is in the wrong folder.  Place it in the correct
## folder and rerun the entire script.
### Again, write down how many words Gandalf 
### spoke across all three movies.