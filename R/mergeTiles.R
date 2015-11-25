mergeTiles <-
function(tileindex, blocksize=2, outname) {
    ## revised to use new tileindex format
    ## works for a list of names, or a single name

    # recursive function that does the work
    mergelist <- function(maplist, newname, nameindex) {
        # merge a list of files and return the new name
        if(!missing(nameindex)) newname <- paste(newname, nameindex, sep=".")
        if(length(maplist) > 1) {
            maplist <- paste(maplist, collapse=",")
            system(paste0("g.region rast=", maplist))
            system(paste0("r.patch in=", maplist, " out=", newname))
        } else {
            system(paste0("g.region rast=", maplist))
            system(paste0("g.copy rast=", maplist, ",", newname))
        }
        invisible(newname)
    }

    # spatial function for patching GRASS tiles
    # get variable names
    varnames <- lapply(head(tileindex$name[sapply(tileindex$name, length) > 0], 1)[[1]], function(x)strsplit(x, "\\.")[[1]][3])
    #    # if there are multiple variables but they don't have names, name them
    #    if(length(varnames) > 1) {
    #        warning("Variables do not have names.\n")
    #        varnames <- lapply(seq_along(varnames), function(x)paste("var", x, sep="."))
    #    }

    for(thisblock in seq_along(varnames)) {
        blockindex <- tileindex$index
        blockname <- lapply(tileindex$name, function(x)x[thisblock])
        nwhile <- 1
        tempfilename <- tempfile()
        tempfilename <- sub("^.*file", "tempmerge", tempfilename)

        while(nrow(blockindex) > 1) {
            # combine into blocksize groups
            blockindex$we <- (blockindex$we + blocksize - 1) %/% blocksize
            if(sum(blockindex$we == max(blockindex$we)) == 1 & max(blockindex$we) > 1) blockindex$we[blockindex$we == max(blockindex$we)] <- max(blockindex$we) - 1
            blockindex$sn <- (blockindex$sn + blocksize - 1) %/% blocksize
            if(sum(blockindex$sn == max(blockindex$sn)) == 1 & max(blockindex$sn) > 1) blockindex$sn[blockindex$sn == max(blockindex$sn)] <- max(blockindex$sn) - 1

            nr <- 1
            newblockindex <- seq_len(nrow(unique(blockindex[, c("we", "sn")])))
            newblockindex <- data.frame(id = newblockindex, we = NA, sn = NA, hasdata = FALSE, name = "", stringsAsFactors = FALSE)
            newblockname <- vector(mode="list", length=nrow(newblockindex))

            for(i in sort(unique(blockindex$we))) {
                for(j in sort(unique(blockindex$sn))) {
                    maplist <- unlist(blockname[blockindex$we == i & blockindex$sn == j & blockindex$hasdata])
                    # cat(i, j, maplist, "\n")
                    newblockindex[nr, "we"] <- i
                    newblockindex[nr, "sn"] <- j
                    if(length(maplist) > 0) {
                        newblockindex[nr, "hasdata"] <- TRUE
                        newblockname[[nr]] <- mergelist(maplist, tempfilename, paste(nr, varnames[[thisblock]], nwhile, sep="."))
                        # system(paste0("g.mremove -f ", maplist)) 
                    }
                    nr <- nr + 1
                }
            }
            blockindex <- newblockindex
            blockname <- newblockname
            nwhile <- nwhile + 1
        }

        if(!is.na(varnames[[thisblock]])) {
            system(paste0("g.copy rast=", blockname, ",", paste(outname, varnames[[thisblock]], sep=".")))
        } else {
            system(paste0("g.copy rast=", blockname, ",", outname))
        }
        rrm(paste0(tempfilename, "*"))
    }

    invisible()
}
