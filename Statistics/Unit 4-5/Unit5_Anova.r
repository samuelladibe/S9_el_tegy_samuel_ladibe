# Unit5. ANOVA
#Exercise about price and resources
# Load the data in Unit5_Resources.csv
#two options: write the name of the file, or choose the file
#data_resources<-read.csv2(file.choose(), header=T)
data_resources <- read.csv2("Unit5_Resources.csv", header=T)

Resource <- data_resources$Resource
Price <- data_resources$Price
#Treat Resource as a factor
Resource_Factor <- as.factor(Resource)
#Table of means
aggregate(Price~Resource_Factor, FUN="mean")
#get the ANOVA table
anova_resources <- aov(lm(Price~Resource_Factor))
summary(anova_resources)
#p-value = 2.33e-7
#Factor "Resource" significantly affects "Price"

#Which levels of the factor have different means?
#The TukeyHSD intervals gives CI for the differences 
#of means of different levels of factor
require(graphics)
plot(TukeyHSD(anova_resources,
              "Resource_Factor",
              ordered = TRUE))
#If the CI for the difference does not include 0, these two means 
#are significantly different.







#Exercise about CO2
# Load the data in Unit5_Resources.csv
data_CO2 <- read.csv2("Unit5_CO2.csv", header=T)
Machine <- data_CO2$Machine
CO2<- data_CO2$CO2
Machine_Factor <- as.factor(Machine)
summary(aov(lm(CO2~Machine_Factor)))
require(graphics)
plot(TukeyHSD(aov(lm(CO2~Machine_Factor)),
              "Machine_Factor",
              ordered=TRUE))


#Exercise about Computers
data_computers <- read.csv2("Unit5_Computers.csv", header=T)

CARD <- data_computers$CARD
SPEED<-data_computers$SPEED
Performance <- data_computers$Performance

CARD_FACTOR <- as.factor(CARD)
SPEED_FACTOR <- as.factor(SPEED)

anova_two_factors <- aov(lm(Performance~CARD_FACTOR*SPEED_FACTOR))
summary(anova_two_factors)


#The two factors and the interaction are significant
#Now let's try to show the means plot
#Table of means
aggregate(Performance~CARD_FACTOR+SPEED_FACTOR, FUN="mean")

#Interaction plot: performance as a function of speed, for each value of card

interaction.plot(SPEED_FACTOR, CARD_FACTOR,  Performance,
   xlab="Speed_Factor", 
   ylab="Performance",
   trace.label = "Card_Factor", 
   main="Interaction Plot",
	col = c("blue","red","green"), bg=c("blue","red","green"), 
	pch=c(18,24,22), type="b"
 )

help("interaction.plot")

#The TukeyHSD intervals are useless because you cannot see anything there
plot(TukeyHSD(anova_two_factors,ordered=TRUE))
#If you find these intervals with only one factor the graph will be more clear
plot(TukeyHSD(anova_two_factors,"CARD_FACTOR",ordered=TRUE))
plot(TukeyHSD(anova_two_factors,"SPEED_FACTOR",ordered=TRUE))
#Thanks to these intervals you can see which levels of each factor are different


#Exercise about resistance
data_resistance <-read.csv2("C:/Users/37718890/Downloads/Unit5_Resistance.csv", header=T)

A <- data_resistance$A

B <- data_resistance$B

Resistance <- data_resistance$Resistance

A_FACTOR <- as.factor(A)

B_FACTOR <- as.factor(B)

anova_two_factors <- aov(lm(Resistance~A_FACTOR*B_FACTOR))

summary(anova_two_factors)

#Factor A is significan. Let's show the TukeyHSD intervals
plot(TukeyHSD(anova_two_factors,"A_FACTOR",ordered=TRUE))


#Factor B is significan. Let's show the TukeyHSD intervals
plot(TukeyHSD(anova_two_factors,"B_FACTOR",ordered=TRUE))

#Thanks to these intervals you can see which levels of each factor are different. In this case, all!
#Apparently there is no significant interaction.
#Now let's try to show the means plot. We'll see that lines are more or less parallel
#Table of means

interaction.plot(A_FACTOR, B_FACTOR,  Resistance,
   xlab="Factor A", 
   ylab="Resistance",
   trace.label = "Factor B", 
   main="Interaction Plot",
	col = c("blue","red","green"), bg=c("blue","red","green"), pch=c(18,24,22), type="b"
 )

