## ------------------------------------------------------------------------
## Uncomment the install lines if the package has not
## been installed on your computer.
#install.packages("tidyverse")

library(tidyverse)

### this is a walkthrough of the powerpoint
df = starwars[1:10,] %>%
  select(name, height, species)

### show df
df %>%
  filter(species == "Droid")

### CLASS EXERCISE: CHANGE BELOW TWO LINES TO
### FILTER df TO RETURN ALL
### ROWS WHERE HEIGHT < 100
df %>%
  filter(species == "Droid")

### find all non-humans
df %>%
  filter(species != "Human")

### anonymize data
df %>%
  select(height,species)

### CLASS EXERCISE: CHANGE BELOW THREE LINES TO
### TO RETURN ALL
### ROWS WHERE HEIGHT > 100 
### AND THE NAME COLUMN IS EXCLUDED
df %>%
  select(name,height,species) %>%
  filter(species == "Human")

### arrange by descending height
df %>%
  arrange(desc(height))

### add a column using mutate()
df %>%
  mutate(inches = height / 2.54)

### CLASS EXERCISE: CHANGE BELOW THREE LINES TO
### TO RETURN ALL
### ROWS WHERE HEIGHT > 60 inches
df %>%
  filter(height > 60) %>%
  mutate(inches = height / 2.54)

### find average height
df %>% 
  summarize(avgHeight = mean(height))

### use group_by before summarize to collapse particular rows
df %>%
  group_by(species) %>%
  summarize(avgHeight = mean(height))

### CLASS EXERCISE:  add two additional lines to the
### below code using the chaining operator to find
### the average mass of each species 
starwars %>%
  select(name, height, mass, species)
            

