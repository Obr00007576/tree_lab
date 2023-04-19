library(mlbench)
data(Glass)
library(rpart)
library(rpart.plot)
set.seed(123)

tree <- rpart(Type ~ ., data = Glass)

rpart.plot(tree, extra = 101, cex = 0.7)

cv <- rpart.control(cp = 0.01, xval = 10)
cv_tree <- prune(tree, cp = tree$cptable[which.min(tree$cptable[,"xerror"]),"CP"])

rpart.plot(cv_tree, extra = 101, cex = 0.7)

print(cv)