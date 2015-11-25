rrm <-
function(patt, mapset)
{
    if(missing(mapset)) {
            system(paste0("g.mremove -f rast=", patt))
    } else {
        currmapset <- system("g.gisenv MAPSET", intern=TRUE)
        mapset(mapset)
        system(paste0("g.mremove -f rast=", patt))
        mapset(currmapset)
    }

    invisible()
}
