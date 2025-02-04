# bootstrapping is a statistical algorithm
# used for frequntist framework uncertainty quantification 
# typically when delta-method is inconvenient or impossible
# but its just overall useful (and more plug & play tbh)

# below you'll see a general shell for how to do this
# i'm using the mtcars data set
# for a direct function see "bootstrap.R"
df_cars=mtcars

# linear model estimating miles per gallon
# from horsepower and weight
m_fit=lm(mpg~hp+wt,data=df_cars)

# number of bootstrap iterations
m_boot=1000

# matrices for saving results
cars_boot1=matrix(,m_boot,1)
cars_boot2=matrix(,m_boot,1)
cars_boot3=matrix(,m_boot,1)

for (m in 1:m_boot){
  # sample n times with replacement
  # where n = n_dataset
  df_sample=sample(1:nrow(df_cars),replace=TRUE)
  # saving samples
  df_boot=df_cars[df_sample,]
  # linear model fit to sampling data
  m1=m(mpg~hp+wt,data=df_boot)
  # saving parameter results
  cars_boot1[m,]=coef(m1)[1]
  cars_boot2[m,]=coef(m1)[2]
  cars_boot3[m,]=coef(m1)[3]
}

# as an example on how to make use of these results

# histograms of parameter uncertainty distributions
hist(cars_boot1,freq=FALSE)
hist(cars_boot2,freq=FALSE)
hist(cars_boot3,freq=FALSE)

# quantiles of results
quantile(cars_boot1,prob=c(0.025,0.975))
quantile(cars_boot2,prob=c(0.025,0.975))
quantile(cars_boot3,prob=c(0.025,0.975))
