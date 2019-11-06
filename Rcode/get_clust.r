function(mdat, k = 3, dmeth = "euc", cmeth = "hc"){
#Taking a matrix mdat where rows are items and columns are features
#Cluster the rows into k categories.
#mdat: Matrix of data
#k = number of clusters)
#dmeth = method for computing distance
#cmeth = clustering method

dmat <- switch(dmeth,
euc = as.matrix(dist(mdat)),
cor = -1 * cor(t(mdat)),
cos = -1 * cosine(t(mdat)))

dmat[is.na(dmat)] <- 0

dclust <- switch(cmeth,
hc = cutree(hclust(as.dist(dmat)), k),
km = kmeans(as.dist(dmat),k)$cluster)

dclust
}