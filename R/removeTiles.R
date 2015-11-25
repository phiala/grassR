removeTiles <-
function(tileindex) {
    for(i in seq_along(tileindex$name)) {
        thisname <- paste(tileindex$name[[i]], collapse=",")
        if(thisname != "") {
            system(paste0("g.mremove -f rast=", thisname))
       }
    }
    invisible()
}
