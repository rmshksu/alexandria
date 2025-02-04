# simple function for splitting data into test and train sets
# returns results as a list

test_train_split=function(train_percent,data){
  # indexing % setting
  smp_size=floor(train_percent*nrow(data))
  # creating the train set index
  train_ind=sample(seq_len(nrow(data)), size = smp_size)
  # splitting data
  split=list(train=data[train_ind,],test=data[-train_ind,])
  return(split)
}
