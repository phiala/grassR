\name{testFUN}
\alias{testFUN}
\title{
Example for use with tileProcess()
}
\description{
Example function for use with tileProcess(); not run on its own. 
}
\usage{
testFUN(x, tempname)
}
\arguments{
  \item{x}{
SpatialGridDataFrame of a tile within a larger GRASS raster.
}
  \item{tempname}{
Temporary filename used for GRASS output.
}
}
\details{
This file processes a GRASS tile and writes out the processed SGDF to GRASS.
}
\value{
\item{tempname }{Filename in GRASS (if multiple files were written, would be a vector of filenames).}
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{processTiles}}, \code{\link{testFUNR}}, \code{\link{gparse}}
}
\examples{
\dontrun{

## The function is currently defined as
function (x, tempname) 
{
    x <- readRAST6("gssurgo")
    x@data[!is.na(x@data[, 1]), 1] <- 1
    writeRAST6(x, tempname)
    tempname
  }

	# how to run
    tileindex <- createTiles("dem30", tilesize=tilesize) 
    tileindex <- processTiles(tileindex, baserast="dem30", FUN=testFUN)
    mergeTiles(tileindex, blocksize=blocksize, outname=outname)
    removeTiles(tileindex)
}
}
