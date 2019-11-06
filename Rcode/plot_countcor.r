function(cc, n=T, yax=TRUE){
  #Barplot number/proportion of units in each correlation category
  #where categories are (1) feature-like, (2) switch or (3) unresponsive
  #cc: 3d array counting units in each category as returned by count.cor
  #n: flag indicating whether data are to be normalized
  
  nruns <- dim(cc)[1] #Number of runs to tabulate
  o <- c(0,0,0)
  for(i1 in c(1:5)) o <- o + rowSums(cc[i1,,]) #sum across runs and categories
  if(n){ 
    o <- o/sum(o) #Normalize to proportions
    y.lim = c(0,1)
  } else y.lim = c(0, max(o))
  barplot(o, beside = T, ylim = y.lim, 
          col = c("red", "green", "gray"), 
          legend=FALSE, names.arg = c("Feature","Switch","NonResp"),
          axes=yax)
  box()
}