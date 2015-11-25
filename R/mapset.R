mapset <- function(newmapset) {
    # change GRASS mapset
    system(paste0("g.mapset ", newmapset))
    invisible()
}


