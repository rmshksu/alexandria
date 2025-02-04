# function for checking model callibration
# in reference to out of sample prediction

# requires a model type object that can be used with `predict()`
# to obtain prediction intervals (gam() doesn't inherently work)

# a test set is needed
# y -> response vector
# interval level is the size of the prediction intervals
# typically just set to 0.95 

model_calib=function(model,test_set,y,interval_level){
  # checking predictive accuracy with 50% of our data
  E_y_hat=predict(model,newdata=test_set)
  # mean squared error
  MSE=mean((y-E_y_hat)^2)
  # root mean squared error
  RMSE=mean((y-E_y_hat)^2)^0.5 
  # check calibration with test data
  li=predict(model,newdata=test_set,interval="prediction",level=interval_level)[,2]
  ui=predict(model,newdata=test_set,interval="prediction",level=interval_level)[,3]
  # how much of our prediction interval covers our data
  cover=ifelse(y>li,1,0)*ifelse(y<ui,1,0)
  mean_cover=mean(cover)
  # print statements
  cat("\n" ,"Mean Squared Error:", MSE, "\n",
      "Root Mean Squared Error:", RMSE, "\n",
      "Mean Cover:", mean_cover)
}
