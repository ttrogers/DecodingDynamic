function (tmp = pval.meanacc, thresh = 0.01, nbp = 1, rflag = F) 
{
	#Plots the width of the generalization window for each classifier against
	#classifier fit time, adding piecewise linear model fit to non-overlapping
	#time-windows. Width of window is defined as proportion of time where
	#classifier hold-out accuracy is higher than chance at the specified threshold
	#tmp: matrix containing binomial probability that classifier is performing at chance for each fit/test time point
	#thresh: probability threshold defining successful generalization
	#nbp: Number of breakpoints to use in piecewise linear model fit
	#rflag: Flag indicating whether r-squared of model should be plotted
	############
	
	library(segmented) #Functions for fitting piecewise linear regression models
	
    x <- c(0:163) * 10 #Beginning of each window in ms
    y <- rowSums(tmp < thresh)[1:164]/164 #Proportion of window above threshold for each classifier
    xno <- x[c(1:32) * 5 - 4] #Subset of non-overlapping windows beginning with the first
    yno <- y[c(1:32) * 5 - 4] #Same for y
	
    m <- segmented(lm(yno ~ xno), npsi = nbp) #Fit model with specified number of breakpoints
	
	#Plot model
    plot(m, ylim = c(0, 1), xlab = "Fit time", ylab = "Generalization envelope", 
        lwd = 2)
    points(x, y, pch = 16, col = hsv(0, 0, 0.6, 0.5)) #Add all data points in gray
    points(xno, yno, pch = 16, cex = 1.2) #Add those used to fit model in black
	
    rsq = summary(m)$adj.r.square #Model r-square
    if (rflag) #Add to plot if flag set
        text(0, 1, labels = bquote(r^2 == .(rsq)), adj = 0)
}
