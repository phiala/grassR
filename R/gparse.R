gparse <-
function(tilesize=2000, rc, outname, blocksize=2) {
# MUCH more efficient recursive version
# even more efficient spatially-referenced version!
# takes any number of variables, replacing gparse() and gparseall()

gssurgoFUN <- function(x, basename, rc) {
	# returns character vector names
	# combine raster data with gSSURGO values
	thisdata <- x@data
	colnames(thisdata)[1] <- "cell"
	thisdata <- data.frame(index=seq_len(nrow(thisdata)), thisdata)
	thisdata <- merge(thisdata, rc, all.x=TRUE)
	thisdata <- thisdata[order(thisdata$index),]
	outnames <- vector(mode="character", length=0)

	for(j in seq_len(ncol(rc))) {
		thisname <- colnames(rc)[j]
		x@data[,1] <- thisdata[, thisname]
		thistempfile <- paste(basename, thisname, sep=".")
		writeRAST6(x, thistempfile)
		outnames <- c(outnames, thistempfile)
	}
	outnames
}
##

    tileindex <- createTiles("gssurgo", tilesize=tilesize) 

    ### 
    tileindex <- processTiles(tileindex, baserast="gssurgo", FUN=gssurgoFUN, rc=rc)

    mergeTiles(tileindex, blocksize=blocksize, outname=outname)

    removeTiles(tileindex)

    invisible()
}
