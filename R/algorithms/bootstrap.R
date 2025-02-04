# simple bootstrapping function for lm()
# fit to handle dynamic predictor amounts

# Y -> vector of responses
# X -> matrix of predictors
# data -> data? this one seems intuitive tbh
# iter_boot -> number of iterations of the bootstrap
  # 1000 is an appropriate amount in most scenarios

bootstrap=function(Y,X,iter_boot){
  # save matrix for final outputs
  coefs=matrix(NA,iter_boot,ncol(X)+1)
  for (i in 1:iter_boot){
    # sample n times with replacement
    # where n = rows in the data
    # X or Y is viable, they should be the same size
    samp_int=sample(1:nrow(X,replace=TRUE)
    # saving samples
    X_boot=X[samp_int,]
    Y_boot=Y[samp_int]
    # linear model fit to sampled data
    m=lm(Y_boot~X_boot)
    # saving parameter results
    save[i,]=coef(m)
  }
}
