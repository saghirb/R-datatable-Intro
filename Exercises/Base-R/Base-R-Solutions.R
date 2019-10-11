## ----purlOnly, echo=FALSE, eval=FALSE------------------------------------
## # Title: Exercise Sheet: Base R Concepts
## #  Name: Saghir Bashir
## #  Date: DD MMM YYYY






## ----numObjects ec-------------------------------------------------------
year <- 1995
cases <- 523
year
cases


## ----charObjects ec------------------------------------------------------
country <- "Portugal"
country


## ----caseSens1-----------------------------------------------------------
city <- "Coimbra"
CITY <- "Porto"
city
CITY


## ----calcBasic-----------------------------------------------------------
72 + (34*51 - 4982)/(18*45) 
sqrt(81)
9**2


## ----calcTrig------------------------------------------------------------
# pi is a stored value
pi
sin(pi/3)
tan(pi/3)
log10(1000)
log(5.2)
exp(1)


## ----calcFn--------------------------------------------------------------
signif(1512337, 2)
round(16.15643, 2)
round(exp(sqrt(log(514))), 2)


## ----assignBasic---------------------------------------------------------
price <- 412.65
tax <- 94.91
total <- price + tax
total


## ----cVector-------------------------------------------------------------
vYear <- c(1995, 2000, 2005, 2010, 2015)
vCases <- c(523, 489, 511, 472, 439)
vCountry <- rep("Portugal", 5)
vYear
vCases
vCountry


## ----operationsVecs------------------------------------------------------
# Calculate the total by adding the tax to net
net <- c(108.99, 291.42, 16.28, 62.29, 31.77)
tax <- c(22.89, 17.49, 0.98, 13.08, 6.67)
total <- net + tax
total
# Convert from degrees centrigrade to fahrenheit
tempC <- seq(-40, 40, 10)
tempF <- (9*tempC)/5 + 32
tempC
tempF


## ----MissingValues-------------------------------------------------------
height <- c(NA, 1.73, 1.53, 1.67, 1.66, 1.81) 
weight <- c(63, 70, 95, 63, NA, 77)
bmi <- weight/(height**2)
height
weight
round(bmi, 1)


## ----comments------------------------------------------------------------
# This comment line will be ignored when run.
weight # Weight in kg
height # Height in metres
# bmi - Body Mass Index
signif(bmi, 3)


## ----lsrm----------------------------------------------------------------
ls()
rm(cases, city, CITY, country, year, tempF, tempC)
ls()


## ----functionUsage-------------------------------------------------------
myNums <- c(454, 939, 740, 701, 394, 79, 30)
sort(myNums)
sort(myNums, decreasing = TRUE)
rank(myNums)
rev(myNums)


## ----sumstatFunctions----------------------------------------------------
# With missing values
naNums <- c(105, 81, 17, NA, 52, 394)
mean(naNums)
mean(naNums, na.rm = TRUE)
sd(naNums, na.rm = TRUE)


## ----summaryFn-----------------------------------------------------------
summary(naNums)


## ----funExamples---------------------------------------------------------
Names <- c("Leo", "Iris")
Age <- c(4, 5)
Text <- paste0(Names, " is ", Age, " years old,")
Text
toupper(Text)
tolower(Text)


## ----selectElements------------------------------------------------------
colour <- c("red", "blue", "pink", "cyan", "gray")
colour[4]
colour[3:5]
colour[c(5, 1, 3)]


## ----logicalexp----------------------------------------------------------
xscale <- c(7, 10, 9, 6, 1, 8, 2)
xscale > 8
xscale[xscale > 8 | xscale <=2]

