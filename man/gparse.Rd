\name{gparse}
\alias{gparse}
\title{
Example function for tileset processing.
}
\description{
Full example of using R to create state gSSURGO files via GRASS tilesets.
}
\usage{
gparse(tilesize = 2000, rc, outname, blocksize = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tilesize}{
Size of tiles to use. The default is usually best.
}
  \item{rc}{
A dataframe containing gSSURGO values.
}
  \item{outname}{
The name to use for the final output file.
}
  \item{blocksize}{
Block size for merging. The default is usually best.
}
}
\details{
This function uses the *Tiles() functions in the grassR package to process gSSURGO files in an efficient fashion. The 10m gSSURGO files are too large to import into R for an entire state, so they must be processed in chunks (tiles).
}
\value{
This function returns nothing in R.
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{createTiles}}, \code{\link{processTiles}}, \code{\link{mergeTiles}}, \code{\link{removeTiles}}
}

\examples{
\dontrun{
# start GRASS
# start R within grass
# load rc data file
rcall <- read.table("/data/gis/notes/gssurgo/gssurgo-valu.csv")
gparse(rc=rcall, outname="gssurgo")



## The function is currently defined as
function (tilesize = 2000, rc, outname, blocksize = 2) 
{
    gssurgoFUN <- function(x, basename, rc) {
        thisdata <- x@data
        colnames(thisdata)[1] <- "cell"
        thisdata <- data.frame(index = seq_len(nrow(thisdata)), 
            thisdata)
        thisdata <- merge(thisdata, rc, all.x = TRUE)
        thisdata <- thisdata[order(thisdata$index), ]
        outnames <- vector(mode = "character", length = 0)
        for (j in seq_len(ncol(rc))) {
            thisname <- colnames(rc)[j]
            x@data[, 1] <- thisdata[, thisname]
            thistempfile <- paste(basename, thisname, sep = ".")
            writeRAST6(x, thistempfile)
            outnames <- c(outnames, thistempfile)
        }
        outnames
    }
    tileindex <- createTiles("gssurgo", tilesize = tilesize)
    tileindex <- processTiles(tileindex, baserast = "gssurgo", 
        FUN = gssurgoFUN, rc = rc)
    mergeTiles(tileindex, blocksize = blocksize, outname = outname)
    removeTiles(tileindex)
    invisible()
  }
}
}
