vplot <- function(vect, mapset, add=FALSE, type="boundary") {
    # plots in grass
    if(!missing(mapset))
        vect <- paste(vect, mapset, sep="@")
    if(add) {
        system(paste0("d.vect ", vect, " type=", type))
    } else {
        system("d.erase")
        system(paste0("g.region vect=", vect))
        system(paste0("d.vect ", vect, " type=", type))
    }
    invisible()
}
