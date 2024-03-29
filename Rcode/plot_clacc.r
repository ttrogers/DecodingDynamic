function (mdat, nclust, dmeth = "euc", cmeth = "hc", xt = "s", yt = "s", thresh=0.72) 
{
#Clusters rows of mdat into nclust clusters, then plots the mean value for each cluster at every column as a colored line.
#mdat = matrix of data in the format output by get_all_macc.r
#nclust = number of clusters

    nitems <- dim(mdat)[1]
    nxpts <- dim(mdat)[2]
    cls <- get.clust(mdat, nclust, dmeth, cmeth)
    plot(1, 0.5, type = "n", ylim = c(0.4, 1), xlim = c(1, nxpts * 10), 
        xlab = "Test time", ylab = "Accuracy", xaxt=xt, yaxt=yt)
    abline(h = 0.5, lty = 2)
    for (i1 in c(1:nclust)) {
        if (sum(cls == i1) > 1) 
            pdat <- colMeans(mdat[cls == i1, 1:nxpts])
        else pdat <- mdat[cls == i1, 1:nxpts]
        lines(c(1:nxpts)*10, pdat, lwd = 2, col = rainbow(nclust)[i1])
    }
    points(c(1:nitems)*10, 0.9 + cls/(nclust * 10), pch = 16, col = rainbow(nclust)[cls])
    abline(h = thresh, lty = 3)
}
