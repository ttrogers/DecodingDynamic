function (d, nc, dtype="hrfar") 
{
#Function to generate "overlapping waves" plot
#d: Matrix of data to plot; rows are models, columns are testing time-points, elements contain model accuracy at that timepoint
#nc: Number of clusters to compute

    nt <- dim(d)[2]        #Number of timepoints
    nitems <- dim(d)[1]    #Number of items
    clusts <- cutree(hclust(dist(d)), nc)   #Compute clusters
	
	#If you want to plot adjusted accuracy:
	if(dtype=="acc"){
		d <- d + 0.5 * (1 - d) #Convert HR-FAR to mean accuracy
    plot(0, 0, ylim = c(0.45, 1), xlim = c(1, nt), type = "n", 
        xlab = "time", ylab = "Mean accuracy") #Make appropriate plot frame
		} else{
		plot(0, 0, ylim = c(-0.2, 1), xlim = c(1, nt), type = "n", 
			xlab = "time", ylab = "HR-FAR")
			}

    for (i1 in c(1:nc)) {
        if (sum(clusts == i1) == 1) 
            plines <- d[clusts == i1, ]
        else plines <- colMeans(d[clusts == i1, ])
        lines(1:nt, plines, lwd = 2, col = hsv((i1 - 1)/nc))
    }
}
