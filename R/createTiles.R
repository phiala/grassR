createTiles <-
function(baserast, tilesize=2000) {

    ## in progress 2015-03-03
    ## rewrite to return a dataframe and a list of names
    ## this will allow creating multiple SGDF in later steps

    # create tiles of a given size for specified GRASS raster
    system(paste0("g.region rast=", baserast))
    currregion <- system("g.region -p", intern=TRUE)

    curr1 <- sapply(currregion, function(x)strsplit(x, ":")[[1]][1])
    curr2 <- sapply(currregion, function(x)sub("^ +", "", strsplit(x, ":")[[1]][2]))

    currregion <- as.list(curr2)
    names(currregion) <- curr1
    rm(curr1, curr2)
    currregion[5:13] <- as.numeric(currregion[5:13])

    # divide current region into tiles
    tilewe <- seq(currregion$west, currregion$east+tilesize*currregion$ewres, by=tilesize*currregion$ewres)
    tilesn <- seq(currregion$south, currregion$north+tilesize*currregion$nsres, by=tilesize*currregion$nsres)

    nrow <- (length(tilewe) - 1) * (length(tilesn)-1)
    tileindex <- data.frame(we=numeric(nrow), sn=numeric(nrow),
            w=numeric(nrow), s=numeric(nrow), e=numeric(nrow), n=numeric(nrow),
            tilecoord=character(nrow),  stringsAsFactors=FALSE) 

    nr <- 1
    for(i in 1:(length(tilewe) - 1)) {
        for(j in 1:(length(tilesn) - 1)) {
            tilecoord <- paste0(
                "w=", tilewe[i],
                " s=", tilesn[j], 
                " e=", tilewe[i+1],
                " n=", tilesn[j+1],
                " cols=", tilesize,
                " rows=", tilesize)
            tileindex[nr, ] <- data.frame(i, j, tilewe[i], tilesn[j], tilewe[i+1], tilesn[j+1], tilecoord,  stringsAsFactors=FALSE)
            nr <- nr + 1
        }
    }
    tileindex$id <- seq_len(nrow(tileindex))
    tileindex$hasdata <- FALSE

    list(index=tileindex, name=vector(mode="list", length=nrow(tileindex)))
}
