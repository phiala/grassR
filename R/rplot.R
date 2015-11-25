rplot <- function(rast, mapset, add=FALSE) {
    # plots in grass
    if(!missing(mapset))
        rast <- paste(rast, mapset, sep="@")
    if(add) {
        system(paste0("d.rast -o ", rast))
    } else {
        system("d.erase")
        system(paste0("g.region rast=", rast))
        system(paste0("d.rast ", rast))
    }
    invisible()
}
