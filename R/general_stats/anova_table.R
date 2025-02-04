# takes the output of an R lm() function
# and plugs it into the ANOVA table
# i guess it's useful for teaching? kinda?

# Y -> response vector
# X -> predictor matrix/vector
anova_table=function(Y,X){
  temp_sum=summary(lm(Y~X)) # fit the model and grab the summary output
  dfr=temp_sum$fstatistic[2] # degrees of freedom of regression
  dfe=temp_sum$fstatistic[3] # degrees of freedom of residuals
  RSE=temp_sum$sigma # residual standard error
  RSS=sum(m$residuals^2) # residual sum of squares (sum of squares of residuals or sum of squared error)
  # i genuinely despise how many names some of this shit has
  # FITFO statisticians
  SSTO=(RSS/(1-temp_sum$r.squared)) # sum of squares total
  SSR=temp_sum$r.squared*SSTO # sum of squares regression
  MSR=SSR/dfr # mean squared regression
  MSE=RSS/dfe # mean squared error
  Fstar=as.numeric(temp_sum$fstatistic[1]) # f statistic
  pval=1-pf(Fstar,dfr,dfe) # pvalue for the f test

  # build the anova table
  anova.table=matrix(NA,nrow=3,ncol=5)
  colnames(anova.table)=c("Sum Square","df","Mean Square","F value","p-value")
  row.names(anova.table)=c("Regression","Error","Total")
  anova.table[1,1]=SSR
  anova.table[2,1]=RSS
  anova.table[3,1]=SSTO
  anova.table[1,2]=dfr
  anova.table[2,2]=dfe
  anova.table[3,2]=dfe+dfr
  anova.table[1,3]=MSR
  anova.table[2,3]=MSE
  anova.table[1,4]=Fstar
  anova.table[1,5]=pval
  anova.table # output the anova table
}
