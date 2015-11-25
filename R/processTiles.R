processTiles <-
function(tileindex, baserast, FUN, ...) {

## create temporary GRASS raster(s) for each tile
    # FUN is a function that accepts a string temporary name and optional arguments
    # and returns the name(s) of the temporary file(s) it created
    # and optional extra results

    # 2015-03-03 - in progress
    # rewriting it to move all the heavy lifting to FUN
    # if FUN makes more than one tempfile, need to be able to
    # deal with that
    # fun MAY return additional output; save that in a list

    # get rid of option to specify tempfile name; use system tempfile
    tempname <- tempfile()
    tempname <- sub("^.*file", "tile", tempname)

    FUNresult <- vector("list", length(tileindex$name))
    
    options(warn=-1)
    for(i in seq_along(tileindex$index$tilecoord)) {
        cat(i, " of ", length(tileindex$index$tilecoord), ": ")
        system(paste("g.region", tileindex$index$tilecoord[i]))

        thisrast <- readRAST6(baserast)
        if(!all(is.na(thisrast@data[,1]))) {
            cat("has data\n")
                tileindex$index$hasdata[i] <- TRUE
                thistempname <- paste(tempname, i, sep=".")
                FUNoutput <- FUN(thisrast, thistempname, ...)
                if(!is.list(FUNoutput)) {
                    tileindex$name[[i]] <- FUNoutput
                } else {
                    tileindex$name[[i]] <- FUNoutput[[1]]
                    FUNresult[[i]] <- FUNoutput[[-1]]
                }
        }
        cat("\n")
    }
    # restore warnings
    options(warn=0)
    list(index=tileindex$index, name=tileindex$name, FUNresult=FUNresult)
}
