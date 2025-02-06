# function that accepts the 2x2 table
# from the two_by_two_table.R function
# and returns relavant derived quantities
# for test/population inference
two_by_two_derivs=function(cont_table){
  tru_prev=cont_table[3,1]/cont_table[3,3] # true prevalence
  app_prev=cont_table[1,3]/cont_table[3,3] # apparent prevalence
  sens=cont_table[1,1]/cont_table[3,1] # sensitivity
  spec=cont_table[2,2]/cont_table[3,2] # specificity
  ppv=cont_table[1,1]/cont_table[1,3] # positive predictive value
  npv=cont_table[2,2]/cont_table[2,3] # negative predictive value
  lrp=sens/(1-spec) # likelihood ratio positive
  lrn=(1-sens)/spec # likelihood ratio negative
  # shove it all into a list and output it
  # it'd be cleaner as a matrix tbh
  # something something optimal data structures
  output=list(true_prevalence=tru_prev,
              apparent_prevalence=app_prev,
              sensitivity=sens,
              specificity=spec,
              PPV=ppv,
              NPV=npv,
              Likelihood_Ratio_Pos=lrp,
              Likelihood_Ratio_Neg=lrn)
  return(output)
}
