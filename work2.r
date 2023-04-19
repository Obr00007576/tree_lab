library(DAAG)
library(rpart)
library(rpart.plot)
library(tree)
library(maptree)

data(spam7)
tree <- tree(yesno ~ ., data = spam7,)

pruned_tree1 <- prune.tree(tree, method = "misclass", k = 1)
pruned_tree5 <- prune.tree(tree, method = "misclass", k = 5)
pruned_tree10 <- prune.tree(tree, method = "misclass", k = 10)

draw.tree(tree)
draw.tree(pruned_tree1)
draw.tree(pruned_tree5)
draw.tree(pruned_tree10)