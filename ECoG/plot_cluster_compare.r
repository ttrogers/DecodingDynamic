function (tmp = clustacc.by.sj, thresh = 0.005, aa = allaccs) 
{
#Given array coding the mean decoding accuracy of each cluster
#at every time point for each subject, generates a heat plot
#indicating where the best-performing cluster is reliably better than
#other clusters.
#tmp: Array containing mean accuracy data for each subject
#thresh: Only compare clusters for time-points where mean accuracy exceeds this threshold
#allaccs: Array containing decoder hold-out accuracies for each subject at each timepoint

    o <- matrix(0, 10, 163) #output matrix containing significance level
	p <- matrix(0, 10, 163) #Output matrix containing actual probabilities
	
	#Find best-performing cluster at each timepoint
	bestclust <- apply(apply(tmp, c(1,2), mean), 2, which.max)
	
	#First compute contrast of all clusters with best-performing cluster at all timepoints
    for (i in c(1:163)) {
		#Don't do contrast if overall classification accuracy is not reliably above threshold
        if (t.test(aa[i, i, ] - 0.5)$p.value > thresh) {
 			p[, i] <- NA
        }
        else { #Otherwise compute uncorrected p-value for contrast with best-performing cluster for each cluster
            best <- bestclust[i]
            for (j in c(1:10)) { #For each cluster
                if (j != best) { #If not the best
                  p[j,i]<- t.test(tmp[best, i, ], tmp[j, i, ], paired = T, 
                    alternative = "greater")$p.value
                } else{ #If it is the best
				p[j,i] <- 1.0
				}
            }
        }
    }
		
	#Correct for false-discovery rate
	p <- matrix(p.adjust(p, method="fdr"), 10, 163)

	#Bin corrected p-values by significance band in o
	for(i in c(1:163)){
		for (j in c(1:10)) {
			if(is.na(p[j,i])){
					o[j,i] <- 0
				} else { #Contrast with best
			  if (p[j,i] > 0.005) 
				o[j, i] <- 2
			  if (p[j,i] > 0.01) 
				o[j, i] <- 3
			  if (p[j,i] > 0.05) 
				o[j, i] <- 4
			  if (p[j,i] <= 0.005) 
				o[j, i] <- 1
				}
			}
		}
	
	pcols <- viridis(4)
	pcols <- c('#000000FF', pcols)
	
    image(t(o), xaxt = "n", yaxt = "n", col = pcols)
    box()
    mtext(side = 2, las = 2, line = 0.5, cex = 0.6, at = c(0:9)/9, 
        text = c(1:10))
    invisible(list(o, p))
}
