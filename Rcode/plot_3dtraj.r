function (d, c = catcols, a = 45, nitems=90) 
{
#Plot 3d multidimensional scaling solutions as lines in a
#3D cube
#d: matrix containing 3D coordinates for each item and timepoint
#c: vector of colors for plotting each line
#a: angle of bottom left corner axis in cube
#nitems: Number of items in the dataset
#Requires R package scatterplot3d

	nt <- dim(d)[1]/nitems #Number of time points
	last <- c((nitems * (nt-1) + 1):(nitems*nt)) #Last time point

	#Generate the plot
   p <- scatterplot3d(x = d[last, 1], y = d[last, 2], z = d[last, 3], 
		pch = 16, color = c, angle = a, 
        xlab = "Component 1", ylab = "Component 2", zlab = "Component 3",
		xlim = range(d[,1]), ylim = range(d[,2]), zlim = range(d[,3]))

	#add the lines
	d <- p$xyz.convert(d)
    d <- cbind(d[[1]], d[[2]])
    for (i1 in c(1:nitems)) lines(d[(c(0:(nt-1)) * 90) + i1, ], col = c[i1])
}
