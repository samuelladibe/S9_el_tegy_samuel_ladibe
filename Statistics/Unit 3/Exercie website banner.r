---
title: "R Notebook"
output: html_notebook
---

Exercise : Certain banner of a website shows, on average, one out of 10 times you visit
such website. What is the probability that the banner appears within the next five visits to
this site? If you know that the banner did appear last time you visited this site, what is the
value of the previous probability? 

```{r}
1 - pbinom(0, size = 5, prob = 0.1, lower.tail = TRUE)

```

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).

The preview shows you a rendered HTML copy of the contents of the editor. Consequently, unlike *Knit*, *Preview* does not run any R code chunks. Instead, the output of the chunk when it was last run in the editor is displayed.
