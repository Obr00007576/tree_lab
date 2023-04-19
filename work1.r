library(mlbench)
data(Glass)
library(rpart)
library(rpart.plot)
set.seed(123)

tree <- rpart(Type ~ ., data = Glass)

#png(file = "glass_tree.png")
#rpart.plot(tree, extra = 101, cex = 0.7)
#dev.off()

cv <- rpart.control(cp = 0.01, xval = 10)
cv_tree <- prune(tree, cp = tree$cptable[which.min(tree$cptable[,"xerror"]),"CP"])

rpart.plot(cv_tree, extra = 101, cex = 0.7)

my_data = df <- data.frame(RI = 1.516, Na = 11.7, Mg = 1.01, Al = 1.19, Si = 72.59, K = 0.43, Ca = 11.44, Ba = 0.02, Fe = 0.1)
result <- rpart.predict(cv_tree, newdata = my_data, type = 'class')
print(result)