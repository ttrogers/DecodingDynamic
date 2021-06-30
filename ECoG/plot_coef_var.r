function (d = mncoeff, lag = 1, coor = mni$Y, v = T, omit = 0, ntl = 10, pflag = T) 
{
	#Computes variance of coefficient change at each electrode and plots mean for each ntile
	#d: Matrix containing the mean decoder coefficient for each electrode (row) at each time point(column)
	#lag: Lag at which to estimate coefficient change
	#coor: matrix containing mni coordinates of electrodes in d (must be in same order as d)
	#v: Flag, compute variance if true, standard deviation if false
	#omit: Values to ignore; by default ignores timepoints with zero change as these involve coefficients of zero
	#ntl: What ntile to use for binning results
	#pflag: Should the plot be generated?
	###########
	
	library(BurStMisc) #Contains ntile function
	
    nt <- dim(d)[2] #Number of timepoints
    d <- d[, (lag + 1):nt] - d[, 1:(nt - lag)] #Difference of coefficients across lag
    dec <- ntile(coor, ntl, result = "numeric") #Compute ntile to which each electrode belongs
    vr <- rep(0, times = dim(d)[1]) #Initialize vector to hold variance of coeff change
    for (i in c(1:dim(d)[1])) if (sum(d[i, ] != 0) > 2)  #For each electrode, if there are more than 2 non-zero coefficients
        vr[i] <- var(d[i, d[i, ] != omit]) #Variance of non-zero value
    if (!v) #Convert to standard deviation if v flag is false
        vr <- sqrt(vr)
		
	#Compute mean coordinate and variance for each decile:
    o <- cbind(aggregate(coor ~ as.factor(dec), FUN = "mean")[, 
        2], aggregate(vr ~ as.factor(dec), FUN = "mean")[, 2])
		
    o <- as.data.frame(o) #Convert to data frame
    names(o) <- c("Coor", "ChVar") #Name columns
	
	#Plot if pflag is true
	if(pflag){
		plot(o, pch = 16, xlab = "Mean MNI y-coordinate (by decile)", 
			ylab = "Variance of change")
		abline(lm(ChVar ~ Coor, data = o)$coefficients)
		rsq <- round(cor(o[, 1], o[, 2])^2, 2)
		text(min(o[, 1]), max(o[, 2]), label = paste("r-sq =", rsq), 
			adj = 0)
		}
    invisible(o) #Return data invisibly
}
