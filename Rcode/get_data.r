function (fname, nitems=90, nu=25, nt=21) 
{
#Function to read simulation data output by LENS
#fname: file name
#nitems: Number of items
#nu: number of units
#nt: Number of time points
    tmp <- read.table(fname, header = F) #Read file into temporary object
    row.names(tmp) <- paste(tmp[, 2], tmp[, 3], sep = "_") #construct row names from fields 2 and 3
    tmp <- tmp[1:(nitems*nt), 4:(nu+3)] #Remove fields 1-3
    out <- array(0, dim = c(nitems, nu, nt)) #Create zero array to hold output
    for (i1 in c(1:nt)) out[, , i1] <- as.matrix(tmp[(((0:(nitems-1)) * 
        nt) + i1), ])
    out
}
