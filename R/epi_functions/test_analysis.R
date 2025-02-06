# merge of cor_v_fal_fill.R / two_by_two_table.R / two_by_two_derivs.R
# accepts the negative count, positive count, sensitivity, and specificity
# returns a list with first element being the 2x2 table
# and second element is an 8x1 matrix of the derived quantities

test_analysis=function(neg,pos,sens,spec){
  # get the vector needed to generate the 2x2 table
  cor_pos=round(pos*sens) # correct positives
  fal_pos=round(pos*(1-sens)) # false positives
  cor_neg=round(neg*spec) # correct negatives
  fal_neg=round(neg*(1-spec)) # false negatives
  # the rounding isnt a perfect science
  # but i couldnt really fix it to be perfect
  # so just beware

  # 2x2 contingency table
  cont_table=matrix(NA,3,3) # empty matrix 3x3
  colnames(cont_table)=c("D+","D-","Totals") # disease status
  rownames(cont_table)=c("T+","T-","Totals") # test results
  cont_table[1,1]=cor_pos # correctly identified positive
  cont_table[1,2]=fal_neg # falsely identified negative
  cont_table[2,1]=fal_pos # falsely identified positive
  cont_table[2,2]=cor_neg # correctly identified negative
  cont_table[1,3]=cor_pos+fal_neg # total positive tests
  cont_table[2,3]=fal_pos+cor_neg # total negative tests
  cont_table[3,1]=cor_pos+fal_pos # total true positives
  cont_table[3,2]=cor_neg+fal_neg # total true negatives
  cont_table[3,3]=fal_pos+cor_neg+cor_pos+fal_neg # total population

  # dervied quantities for test/population inference
  tru_prev=cont_table[3,1]/cont_table[3,3] # true prevalence
  app_prev=cont_table[1,3]/cont_table[3,3] # apparent prevalence
  sens=cont_table[1,1]/cont_table[3,1] # sensitivity
  spec=cont_table[2,2]/cont_table[3,2] # specificity
  ppv=cont_table[1,1]/cont_table[1,3] # positive predictive value
  npv=cont_table[2,2]/cont_table[2,3] # negative predictive value
  lrp=sens/(1-spec) # likelihood ratio positive
  lrn=(1-sens)/spec # likelihood ratio negative
  # im making it a matrix for this one
  # you can't stop me
  mat=matrix(c(tru_prev,app_prev,sens,spec,
               ppv,npv,lrp,lrn),8,1)
  rownames(mat)=c("True Prevalence","Apparent Prevalence",
                  "Sensitivity","Specificity","PPV","NPV",
                  "Likelihood Ratio Positive","Likelihood Ratio Negative")
  output=list(Table=cont_table,Derived_Quant=mat)
  return(output)
}
