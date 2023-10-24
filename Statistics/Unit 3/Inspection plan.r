---
title: "R Notebook"
output: html_notebook
---
___________________________
    Inspection Plans
___________________________

unacceptable batch : p = 0.05

rejection : x > 2

Pr(X >= 2 | p = 0.05=  >= 0.05) > 0.9

To solve, let's assume ! X ~ Bi(n = ???, p = 0.05)
```{r}
# par tatonnement

1 - pbinom(1, size = 10, prob = 0.05, lower.tail = TRUE)
```
```{r}
1 - pbinom(1, size = 5, prob = 0.05, lower.tail = TRUE)
```


```{r}
1 - pbinom(1, size = 77, prob = 0.05, lower.tail = TRUE)
```
For n >= 77, we have Pr(X >= 2 | p = 0.05=  >= 0.05) > 0.9

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).

The preview shows you a rendered HTML copy of the contents of the editor. Consequently, unlike *Knit*, *Preview* does not run any R code chunks. Instead, the output of the chunk when it was last run in the editor is displayed.


