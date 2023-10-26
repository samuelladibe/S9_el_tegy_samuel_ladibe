# Steel tension exercise
data_tension <-read.csv2("C:/Users/37718890/Downloads/steel_tension.csv", header=T)

Bar <- data_tension$Bar

Material <- data_tension$Material

Process <- data_tension$Process

UTS <- data_tension$UTS

Material_factor <- as.factor(Material)

Process_factor <- as.factor(Process)

anova_two_factors_tension <- aov(lm(UTS~Material_factor*Process_factor))

summary(anova_two_factors_tension)

#Factor A is significan. Let's show the TukeyHSD intervals
plot(TukeyHSD(anova_two_factors_tension,"Material_factor",ordered=TRUE))


#Factor B is significan. Let's show the TukeyHSD intervals
plot(TukeyHSD(anova_two_factors_tension,"Process_factor",ordered=TRUE))

#Thanks to these intervals you can see which levels of each factor are different. In this case, all!
#Apparently there is no significant interaction.
#Now let's try to show the means plot. We'll see that lines are more or less parallel
#Table of means

interaction.plot(Material_factor, Process_factor,  UTS,
                 xlab="Matetial", 
                 ylab="Tension",
                 trace.label = "Manufacturing process", 
                 main="Interaction Plot",
                 col = c("blue","red","green"), bg=c("blue","red","green"), pch=c(18,24,22), type="b"
)

