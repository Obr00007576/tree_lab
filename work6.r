library(rpart)
library(rpart.plot)
set.seed(123)

train_data <- read.table("svmdata4.txt", colClasses=c("NULL", rep("double", 2), "factor"), skip = 1)
colnames(train_data) <- c("V1", "V2", "Color")

test_data <- read.table("svmdata4test.txt", colClasses=c("NULL", rep("double", 2), "factor"), skip = 1)
colnames(test_data) <- c("V1", "V2", "Color")

tree <- rpart(Color ~ ., data = train_data)
rpart.plot(tree, cex = 0.7)

test_results = data.frame(rpart.predict(tree, newdata = test_data, type = 'class'))
colnames(test_results) <- c("Color")

error_rate <- (nrow(test_data) - sum(test_data$Color == test_results$Color))/nrow(test_data)
