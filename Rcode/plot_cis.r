function(d, y.lim=NA){
#Compute mean and 95% confidence interval for each column of d
#and plot as a ribbon plot

	nitems <- dim(d)[2]
	o <- matrix(0,3,nitems)
	for(i1 in c(1:nitems)){
		t <- t.test(d[,i1])
		o[1,i1] <- t$estimate
		o[2:3,i1] <- t$conf.int[1:2]
		}
	if(is.na(y.lim[1])) y.lim <- range(o)
	plot(1:nitems, o[1,], type = "o", pch=16, lwd=2, ylim=y.lim, ylab="Accuracy", xlab="Time")
	polygon(c(1:nitems, nitems:1), c(o[2,], o[3,nitems:1]), col=rgb(0,0,1,.2), border=NA)
	invisible(o)
}