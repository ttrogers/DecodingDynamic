function (mdat, k = 3, dmeth = "euc", cmeth = "hc") 
{
    dmat <- switch(dmeth, euc = as.matrix(dist(mdat)), cor = -1 * 
        cor(t(mdat)), cos = -1 * cosine(t(mdat)))
    dmat[is.na(dmat)] <- 0
    dclust <- switch(cmeth, hc = cutree(hclust(as.dist(dmat)), 
        k), km = kmeans(as.dist(dmat), k)$cluster)
    dclust
}
