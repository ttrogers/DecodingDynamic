function(d, thresh=0.21){
#For each of 25 units at every time-point during processing, plot the correlation between
#the unit's activation for different items and the item's category label. 
#d: matrix of data where rows are units and columns are different points in time
#   entries are correlation between the unit's activation and category labels at eacch timepoint
	par(mfrow = c(5,5), oma = c(2,2,2,2), mar = c(1,1,0,0))
	for(i1 in c(1:25)){
	plot(1:33, d[i1,], type="l", ylim = c(-1,1), xaxt="n", yaxt="n", xlab="", ylab="")
	abline(h=c(-thresh,0,thresh), lty = c(2,1,2), lwd=1.5)
	#Switch:
	if(max(d[i1,])>thresh & min(d[i1,]) < -thresh) rect(0,-1.1,35,1.1,col = rgb(1,0,0,.2))
	
	#Tonic:
	if(max(d[i1,])>thresh & min(d[i1,]) >= -thresh & d[i1,33] > thresh) rect(0,-1.1,35,1.1,col = rgb(0,1,0,.2))
	if(max(d[i1,])<=thresh & min(d[i1,]) < -thresh & d[i1,33] < -thresh) rect(0,-1.1,35,1.1,col = rgb(0,1,0,.2))
	
	#Transient:
	if(max(d[i1,])>thresh & min(d[i1,]) >= -thresh & d[i1,33] <= thresh) rect(0,-1.1,35,1.1,col = rgb(0,0.2,.8,.2))
	if(max(d[i1,])<=thresh & min(d[i1,]) < -thresh & d[i1,33] >= -thresh) rect(0,-1.1,35,1.1,col = rgb(0,0.2,.8,.2))
	
	if(max(d[i1,])<=thresh & min(d[i1,]) >= -thresh) rect(0,-1.1,35,1.1,col = rgb(0.5,.5,.5,.2))
	}
}