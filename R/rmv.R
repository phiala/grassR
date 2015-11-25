rmv <- function(rast, oldmapset, newmapset) {
    # moves raster from oldmapset to newmapset
    currmapset <- system("g.gisenv MAPSET", intern=TRUE)
    mapset(newmapset)
    system(paste0("g.copy rast=", rast, "@", oldmapset, ",", rast))
    mapset(oldmapset)
    rrm(rast)
    mapset(currmapset)
    invisible()
}
