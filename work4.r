library(tree)
library(maptree)

my_data <- read.table("Lenses.txt", colClasses=c("NULL", rep("integer", 4), "factor"))
colnames(my_data) <- c("age", "myopia", "astigmatism", "tears", "type")

tree <- tree(type ~ ., data = my_data)
draw.tree(tree, cex = 0.7)