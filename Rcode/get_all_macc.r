function(d, u=3, nsamp=10, noise=0.01){
#Function to compute model prediction accuracy for a randomly-sampled subset of units
#at every point of time.
#
#d: array of data where d1 = item, d2 = unit, and d3 = time
#u: number of units to sample each time.
#nsamp: number of samples to assess at each time point
#noise: range for noise sampled from uniform distribution and added into each unit activation
#RETURNS a matrix in which each row corresponds to a model training time and each column to a model testing time
#The entries then indicate the mean hold-out accuracy for a model trained at time R and tested at time C (where R is row and C is column)
#from a subset of u units.

	nt <- dim(d)[3] #Number of time points
	out <- matrix(0,nt,nt)   #Output matrix

	for(i1 in c(1:nt)){
		ab <- sample.macc(t=i1, d=d, u=u, nsamp=nsamp, noise=noise, items=c(1:60), y=c(rep(1, times = 30), rep(0, times=60)))
		ac <- sample.macc(t=i1, d=d, u=u, nsamp=nsamp, noise=noise, items=c(1:30, 61:90), y=c(rep(1, times = 30), rep(0, times=60)))
		bc <- sample.macc(t=i1, d=d, u=u, nsamp=nsamp, noise=noise, items=c(31:90), y=c(rep(0, times = 30), rep(1, times = 30), rep(0, times=30)))
		out[i1,] <- (ab + ac + bc)/3
		}
	out
}	
