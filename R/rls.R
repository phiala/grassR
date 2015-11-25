rls <- function(patt, mapset) {
    if(missing(patt)) {
        if(missing(mapset)) {
            result <- system("g.mlist  type=rast patt=* separator=newline", intern=TRUE)
        } else {
            result <- system(paste0("g.mlist  type=rast patt=* separator=newline mapset=", mapset), intern=TRUE)
        }
    } else {
        if(missing(mapset)) {
            result <- system(paste0("g.mlist type=rast separator=newline patt=", patt), intern=TRUE)
        } else {
            result <- system(paste0("g.mlist type=rast separator=newline patt=", patt, " mapset=", mapset), intern=TRUE)
        }
    }
    result
}
