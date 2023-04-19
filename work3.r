library(DAAG)
data(nsw74psid1)
library(e1071)

# 建立回归树
bc.tr <- tree(re78 ~ ., data = nsw74psid1)
plot(bc.tr)
text(bc.tr, cex = 0.7)

# 建立SVM回归模型
svm.mod <- svm(re78 ~ ., data = nsw74psid1, kernel = "radial")
summary(svm.mod)

# 比较模型的质量
pred.tree <- predict(bc.tr)
pred.svm <- predict(svm.mod)
actual <- nsw74psid1$re78

# 计算平均绝对误差（MAE）
mae.tree <- mean(abs(pred.tree - actual))
mae.svm <- mean(abs(pred.svm - actual))

# 计算均方误差（MSE）
mse.tree <- mean((pred.tree - actual)^2)
mse.svm <- mean((pred.svm - actual)^2)

# 输出结果
cat("Regression Tree:\n")
cat("MAE =", round(mae.tree, 2), "\n")

cat("SVM Regression:\n")
cat("MAE =", round(mae.svm, 2), "\n")