function(t, u=5, nsamp=10, d = hrarr, noise = 0.01,items = c(1:60), y=c(rep(1, times = 30), rep(0, times = 60))){
#t = time
#u = number of units to sample
#nsamp = number of samples to run
#d = hidden unit data with d1=item, d2=units, d3=time
#noise = amount of noise to add to unit activations
#items = items to use
#y = category labels
#RETURNS vector showing mean hold-out error across nsamp samples for models fit at time t to a random of u units

	nitems <- length(items) #number of items
	nu <- dim(d)[2]   #number of units
	nt <- dim(d)[3]   #number of time points
	out <- matrix(0, nsamp, nt)  #output matrix

	d = d[items,,] #remove items that won't be used to fit model
	y = y[items]   #remove labels that won't be used
	items <- c(1:nitems)  #reset item vector
	
	for (i1 in c(1:nsamp)){
		units <- c(1:nu)[order(runif(nu))[1:u]]			#Get sample of u units
		m <- get.mod(t, m=d, units=units, noise=noise, items=items, y=y)  #Fit model to sample of units at time t
		out[i1,] <- get.macc(m, dat=d, units=units, y=y, items=items)		#Store accuracy of model at all time points
		out[i1,t] <- test.mod(t, m=d, units=units,noise=noise, items=items,y=y)	#proper cross validation for training time point
		}
	colMeans(out)	#return mean across rows for each column (each time point)
}