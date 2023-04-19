library(rpart)
library(rpart.plot)
set.seed(123)

train_data <- read.csv('train.csv', head = TRUE)
train_data <- train_data[, -1]
train_data <- train_data[, -3]
train_data <- train_data[, -7]
train_data <- train_data[, -8]
train_data <- train_data[, -4]
train_data <- train_data[-62, ]
train_data$Sex <- ifelse(train_data$Sex == "male", 1, 2)
train_data$Embarked <- as.numeric(factor(train_data$Embarked, levels = c("S", "C", "Q")))

test_data <- read.csv('test.csv', head = TRUE)
test_data <- test_data[, -1]
test_data <- test_data[, -2]
test_data <- test_data[, -3]
test_data <- test_data[, -5]
test_data <- test_data[, -6]
test_data$Sex <- ifelse(test_data$Sex == "male", 1, 2)
test_data$Embarked <- as.numeric(factor(test_data$Embarked, levels = c("S", "C", "Q")))

tree <- rpart(Survived ~ ., data = train_data, method = 'class')
rpart.plot(tree, cex = 0.7)

test_results = data.frame(rpart.predict(tree, newdata = test_data, type = "class"))
colnames(test_results) <- c("Survived")
write.csv(test_results, "./Titanic_prediction_from_test.csv")