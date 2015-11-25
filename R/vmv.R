vmv <- function(vect, oldmapset, newmapset) {
    # moves vector from oldmapset to newmapset
    currmapset <- system("g.gisenv MAPSET", intern=TRUE)
    mapset(newmapset)
    system(paste0("g.copy vect=", vect, "@", oldmapset, ",", vect))
    mapset(oldmapset)
    vrm(vect)
    mapset(currmapset)
    invisible()
}
