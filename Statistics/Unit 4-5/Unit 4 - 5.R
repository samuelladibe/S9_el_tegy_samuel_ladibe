

pbinom(4, size=188,prob=0.05,lower.tail=TRUE)

income = c(125, 135, 145, 130, 120, 145, 125, 130, 150, 145)

install.packages("TeachingDemos")
library(TeachingDemos)

# Unit 4 & 5

#function to determine confidence interval of a vector knowning the conf.level
t.test(income, conf.level = 0.95)


#function to determine confidenc interval about the proportion
prop.test(120, 200, conf.level = 0.95)


# Tests exercises

speed <- c(69, 60, 80, 85, 68, 74, 60, 86, 92)

#just to see not mandatory
mean(speed)

t.test(speed, mu= 70, alternative = "two.sided")

# production units page 8
prop.test(2, 20, p = 0.05, alternative = "two.sided")

prop.test(20, 200,0.05, alternative = "two.sided")

prop.test(20, 200,0.05, alternative = "greather")


# Two means
county_A <- c(200, 230, 205, 185, 190, 300, 250, 245, 208)

county_B <- c(190, 220, 200, 180, 190, 260, 240, 241, 200)

var.test(county_A, county_B)

t.test(county_A, county_B, var.equal = TRUE)


# Unit 5
data_resource = read.csv2("C:/Users/37718890/Downloads/Unit5_Resources.csv")

resources <- data_resource$Resource

Price <- data_resource$Price

resource_factor <- as.factor(resources)

aggregate(Price~resource_factor, FUN="mean")

anova_resources <- aov(lm(Price~resource_factor))

summary(anova_resources)


require(graphics)

plot(TukeyHSD(anova_resources, "resource_factor", ordered = TRUE))


# Two factors

data_computer = read.csv2("C:/Users/37718890/Downloads/Unit5_Computers.csv")

Performance <- data_computer$Performance

CARD  <- data_computer$CARD
SPED <- data_computer$SPEED

card_factor <- as.factor(CARD)

sped_factor <- as.factor(SPED)

anova_two_factors <- aov(lm(Performance~card_factor*sped_factor))

summary(anova_two_factors)


require(graphics)
plot(TukeyHSD(anova_two_factors, "card_factor","sped_factor", main ="test",
ordered = TRUE))

