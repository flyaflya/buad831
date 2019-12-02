# use CTRL + ENTER to run each line
####################################################################
# R for Arithmetic:  think of R as a fancy calculator
1+2*3^2       # power first, then multiplication, then addition
(1+2)*3^2     # parentheses force addition before multiplication
((1+2)*3)^2   # nested parentheses

####################################################################
# Assignment versus tests of equality
x <- 2  # assigns the value 2 to variable named x
x = 2   # assigns the value 2 to variable named x
x       # shows the contents of x

x == 2  # checks whether the value of x is equal to 2
x != 3  # checks whether the value of x is NOT equal to 3
x < 3   # checks whether the value of x is less than 3
x > 3   # checks whether the value of x is greater than 3


####################################################################
# Vectors and element-by-element vector operations:
c(1,2,3)  ### Combine Values into a Vector
c(1,2,3) * c(7,6,5)
2 * c(1,2,3)
2 + c(1,2,3)
c(1,2,3) + c(1,2,3,4,5,6,7)  # weird behavior called vector recycling

## using functions
mean(x = 1:6) # argument explicitly named
mean(1:6)   # argument implied by position

## write your own function
## take two numbers and return the secondNumber's value
getSecond = function(firstNumber, secondNumber) {
  return(secondNumber)
}

## see autocomplete in action
## navigate cursor to end of below word & press tab
getSe

## predict these outcomes
getSecond(2,1)
getSecond(1,2)
getSecond(firstNumber = 17, secondNumber = 24)
getSecond(secondNumber = 7, 14)
getSecond(26, firstNumber = 22)

###Reading Data Using tidyverse####
# install.packages("tidyverse")  # see https://www.tidyverse.org/
library("tidyverse")
superbowl = read_csv("./data/dowjones_super.csv")

###extract elements of a dataframe
superbowl$Winner  # best way for extracting columns
superbowl$DowJonesSimpleReturn
superbowl[1,1] # indexing starts at 1, not 0 like some other languages
superbowl[1:2,"Winner"]
superbowl[ , "Winner"]
superbowl$Winner[1:2]

###opening a webpage
shell.exec("http://en.wikipedia.org/wiki/Super_Bowl_indicator")

###looking at first 31 superbowls
ggplot(superbowl[1:31,],aes(x = DowJonesSimpleReturn, fill = Winner)) + 
  geom_dotplot(binwidth=0.05) + 
  facet_grid(rows = vars(Winner)) + 
  ylim(0, 6)

###looking at all points
ggplot(superbowl,aes(x = DowJonesSimpleReturn, fill = Winner)) + 
  geom_dotplot(binwidth=0.05) + 
  facet_grid(rows = vars(Winner)) + 
  ylim(0, 6)

### character strings versus objects

# superbowl is an object
superbowl

# "superbowl" is a character
"superbowl"

# when referring to something in the Environment
# it is an object.  Otherwise, use quotes for text.

# here is a character vector
starWarsCharacterVector = c("Yoda","Luke","Leah")

starWarsCharacterVector

# we can create loops over each element of a vector
# using following outline
# for (tempObjectName in Vector) { 
#                   do stuff inside brackets 
#                               }

count=1
for (starName in starWarsCharacterVector) {
  print("Character #")
  print(count)
  print(starName)
  print("------------")
  count = count + 1
}

## one way to make a single text string is to 
## use paste0() function.
paste0("Character #",count," is the amazing ",starName)


