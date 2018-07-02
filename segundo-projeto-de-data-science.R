knitr::opts_chunk$set(echo=TRUE, eval=TRUE, tidy=TRUE, tidy.opts=list(blank=FALSE, width.cutoff=60))
set.seed(1234)


url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data"

bc        <- read.csv(url, header=FALSE, na.strings="?")
names(bc) <- c("id", "espessura", "unif_tamanho", "unif_forma", "aderencia", "size", "nucleo", "cromatina", "nucleoli", "mitose", "classificacao")
bc <- bc[, -1]

bc$classificacao <- ifelse(bc$classificacao==2, "benigno", "maligno")

library(dplyr)
library(corrplot)

correlacao <- cor(bc[, -10], method="spearman", use="complete.obs")
corrplot.mixed(correlacao, upper = "ellipse")





