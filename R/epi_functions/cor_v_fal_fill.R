# function that takes sensitivity and specificity
# as well as total true negatives and true positives
# and returns a vector with correct and false neg/pos
cor_v_fal_fill=function(neg,pos,sens,spec){
  cor_pos=round(pos*sens) # correct positives
  fal_pos=round(pos*(1-sens)) # false positives
  cor_neg=round(neg*spec) # correct negatives
  fal_neg=round(neg*(1-spec)) # false negatives
  # the rounding isnt a perfect science
  # but i couldnt really fix it to be perfect
  # so just beware
  output=c(cor_pos,fal_pos,cor_neg,fal_neg)
}
