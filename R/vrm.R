vrm <-
function(patt, mapset)
{
    if(missing(mapset)) {
        system(paste0("g.mremove -f vect=", patt))
    } else {
        currmapset <- system("g.gisenv MAPSET", intern=TRUE)
        mapset(mapset)
        system(paste0("g.mremove -f vect=", patt))
        mapset(currmapset)
    }

    invisible()
}
