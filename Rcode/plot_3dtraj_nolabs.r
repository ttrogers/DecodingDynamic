function (d, c = catcols, a = 45, m = c(1, 1, 2, 0)) 
{

	dnorm <- range(d[,1]) [2] - range(d[,1])[1]
	d <- d/dnorm
	r <- max(max(abs(range(d[,1]))), max(abs(range(d[,2]))), max(abs(range(d[,3]))))
    p <- scatterplot3d(x = d[1711:1800, 1], y = d[1711:1800, 
        2], z = d[1711:1800, 3], pch = 16, color = c, angle = a, 
        tick.marks = F, mar = m, xlab = "", ylab = "", zlab = "", 
        xlim = c(-r,r), ylim = c(-r,r), zlim=c(-r,r))
    d <- p$xyz.convert(d)
    d <- cbind(d[[1]], d[[2]])
    for (i1 in c(1:90)) lines(d[(c(0:19) * 90) + i1, ], col = c[i1])
}
