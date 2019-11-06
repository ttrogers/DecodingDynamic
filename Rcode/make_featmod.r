function(s=5, p=featmod.ptype, nitems = 10, nt=21, nu=25){
#This function generates data for a static feature-based model
#s: slope of the sigmoid governing the speed with which features activate
#p: matrix containing prototypic features for each category
#nitems: number of items to generate per category
#nt: number of time points to simulate
#nu: number of units

ncat = dim(p)[1]
o <- array(0, dim = c(nitems*ncat,nu,nt)) #Create output array
srange <- c(-((nt-1)/2):((nt-1)/2))/((nt-1)/2)

for(icat in c(1:ncat)){ #for each category
	for(i in c(1:nitems)){ #for each item
		for(u in c(1:nu)){ #for each unit
			if(p[icat,u]==1) o[(((icat-1)*nitems)+i),u,] <- sigmoid(srange, s=s, i=(2 * (runif(1)-.5)))
			}
		}
	}
	o
}