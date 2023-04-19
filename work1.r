library(mlbench)
library(rpart)
library(rpart.plot)

data("Glass")
train_index <- sample(1:nrow(Glass), round(nrow(Glass) * 0.8))
train_data <- Glass[train_index, ]
test_data <- Glass[-train_index, ]

tree <- rpart(Type ~ ., data = train_data, method = "class")

png(filename = "glass_tree.png")
rpart.plot(tree, extra = 1, cex = 0.7)
dev.off()