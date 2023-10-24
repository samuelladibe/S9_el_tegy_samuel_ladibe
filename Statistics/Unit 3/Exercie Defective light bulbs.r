Binomial distribution

Exercice : Due to a problem in its production line, a factory produces 2% of defective light
bulbs. These light bulbs are sold in 10-unit boxes. 40% of the boxes are red, the rest are
blue. If you randomly pick one box, what is the probability that such box has more than
two defective light bulbs? 

```{r}

# Pr( X > 2)

pbinom (2, size = 10, prob = 0.02, lower.tail = FALSE)

#or 1 - P(X <= 2)

1 - pbinom(2, size = 10, prob = 0.02, lower.tail = TRUE)
```
```{r}

#Another way to determine Pr(X<=2)
1 - (dbinom(0, size = 10, prob = 0.02) +
       dbinom(1, size = 10, prob = 0.02) +
       dbinom(2, size = 10, prob = 0.02) )

```

particular case : there's no function to determine directly Pr(X>=2)

so we are going to split it into two probabilites that we know computing

here we go

Pr(X >= 2) = Pr(X > 2) + Pr(X <= 2) = 1 - Pr(X < 2) = 1 - Pr(X <= 1)

```{r}
# Pr(X >= 2) = Pr(X > 2) + Pr(X = 2)

pbinom(2, size = 10, prob = 0.02, lower.tail = FALSE) + 
  dbinom(2, size = 10, prob = 0.02, lower.tail = TRUE)
```


```{r}
```

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).

The preview shows you a rendered HTML copy of the contents of the editor. Consequently, unlike *Knit*, *Preview* does not run any R code chunks. Instead, the output of the chunk when it was last run in the editor is displayed.
