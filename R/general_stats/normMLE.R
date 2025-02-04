# maximum likelihood estimation
# assuming normality
# using the optim() function

# y -> response vector
# X -> design matrix (cbind() data with a column of 1s in column 1)
normMLE=function(y,X){
  # log likelihood function for normal dist
  nloglik=function(theta,y,X){
    n=nrow(X) # number of observations
    k=ncol(X) # variable total
    beta=theta[1:k] # regression parameters
    sigma=theta[k+1] # variance
    E=y-X%*%beta # xform of OLS to estimate residuals
    logl=-.5*n*log(2*pi)-.5*n*log(sigma)-((t(E)%*%E)/(2*sigma))
    return(-logl) # return the negative log lik to use in optim() function
  }
  # save the optim output
  # it uses Nelder-Mead by default
  # and dynamically adjusts the parameter counts 
  # according to the design matrix
  output=optim(rep(1,ncol(X)+1),nloglik,hessian=T,method="Nelder-Mead",y=y,X=X)
  return(output)
}
