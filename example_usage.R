# generate some data _____________________________________________________________________________________________
n <- 50
p <- 10
true_betas <- runif(p,-10,10)
true_intercept <- runif(1,-10,10)
X <- matrix(rnorm(n*p,0,1),
            nrow = n,
            ncol = p)
Y <- X%*%true_betas
Y <- Y + true_intercept
Y <- Y + rnorm(n,0,sd(Y)*0.5)  # add random noise
data <- cbind(X,Y)
colnames(data)[ncol(data)] <- "Y"

# the procedure ________________________________________________________________________________________
source("mod.R") # path to the script where the function are defined

# train test split (for diagnostic purposes)
k <- floor(n*0.7)
data_train <- data[1:k,]
data_test <- data[(k+1):n,]
Y_train <- data_train$Y
X_train <- data_train
X_train$Y <- NULL
Y_test <- data_test$Y
X_test <- data_test
X_test$Y <- NULL

# the model
# n --> number of bootstrap iterations
# alpha --> hyperparameter (see readme)
coefs_boot <- Bootstrap_Model(as.matrix(X_train), as.matrix(Y_train), n=10000, alpha=0.1) # get beta estimates
y_hat_boot <- Predict(as.matrix(X_test), coefs_boot) # use beta estimates to predict on testing data
MSE_boot <- MSE(Y_test, y_hat_boot)  # calculate mean squared error