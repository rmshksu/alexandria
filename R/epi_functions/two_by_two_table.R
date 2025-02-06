# function that builds a 2x2 table
# for disease testing results
# using correct positive, correct negative
# false positive, and false negative
two_by_two_table=function(cor_pos,fal_pos,cor_neg,fal_neg){
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
  return(cont_table) # output the table
}
