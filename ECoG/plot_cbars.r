function(mdat, nclust=10, dmeth = "cos", cmeth = "hc", thresh=0.68, n=T, xt="s", yt="s"){
#Plots the amount of time each classifier shows performance above a specified threshold
#as a bar plot
#mdat: Matrix of classifier accuracy data
#nclust: Number of clusters
#dmeth: Distance metric for clustering; options are cos for cosine, euc for euclidean
#cmeth: Method for clustering; the default is hierarchical
#thresh: Accuracy threshold
#n: If true, data will be normalized so that bar height indicates proportion of the time window
#   during which the classifier is above threshold

	p <- matrix(0, nclust,dim(mdat)[2])
	cls <- get.clust(mdat, nclust, dmeth, cmeth)

	for (i1 in c(1:nclust)) {
      if (sum(cls == i1) > 1) p[i1,] <- colMeans(mdat[cls == i1,]) else p[i1,] <- mdat[cls == i1,]
    }
	pvec <- rowSums(p > thresh)
	if(n) {
		pvec <- pvec/dim(mdat)[2] #Normalize to proportion of time window if n is true
		barplot(pvec, beside = T, col = rainbow(nclust), xlab="", ylab="Time above threshold",
			ylim = c(0,1), xaxt=xt, yaxt=yt)} else{
			barplot(pvec, beside = T, col = rainbow(nclust), 
			xlab="", ylab="Time above threshold",
			xaxt=xt, yaxt=yt)}
	box()
	mtext(side = 1, line = .5, text="Cluster")
	

}