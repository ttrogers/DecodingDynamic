function (thresh = 44/60) 
{
#This function plots the behaviors of four different models. It assumes the relevant data structures exist in the R environment.
    par(mfrow = c(3, 4), mar = c(4, 3, 2, 1), oma = c(2, 2, 2, 
        2))
    plot.3dtraj.nolabs(featmod8.ptype2.mds[[4]]) #Trajectory plot for one variant of feature model
    title("Features")
    plot.3dtraj.nolabs(linmod8.mds[[5]]) #Trajectory plot for one variant of linear model
    title("Linear")
    plot.3dtraj.nolabs(sall8.mds[[3]])
    title("Shallow")
    plot.3dtraj.nolabs(dall8.mds[[5]])  #Trajectory plot for one variant of deep model
    title("Deep")
    plot.clacc(toacc(mcfeatmod8macmean), 10, thresh = thresh)
    plot.clacc(toacc(mclinmod8macmean), 10, thresh = thresh, yt = "n")
    plot.clacc(toacc(mcu3sall8macmean), 10, thresh = thresh, yt = "n")
    plot.clacc(toacc(mcu3dall8macmean), 10, thresh = thresh, yt = "n")
    plot.cbars(toacc(mcfeatmod8macmean), 10, thresh = thresh)
    plot.cbars(toacc(mclinmod8macmean), 10, thresh = thresh, yt = "n")
    plot.cbars(toacc(mcu3sall8macmean), 10, thresh = thresh, yt = "n")
    plot.cbars(toacc(mcu3dall8macmean), 10, thresh = thresh, yt = "n")
}
