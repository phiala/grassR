\name{mergeTiles}
\alias{mergeTiles}
\title{
Combine tiles into a full raster.
}
\description{
Recursively combine tiles into a full GRASS raster.
}
\usage{
mergeTiles(tileindex, blocksize = 2, outname)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tileindex}{
The tileindex object created by createTiles() and modified by processTiles().
}
  \item{blocksize}{
The size of intermediate blocks to create. The default should not usually be changed.
}
  \item{outname}{
The name to use for the final GRASS raster.
}
}
\details{
A common task is to import a raster into R, do some processing, and either write out a new raster, save some results in R, or both. This series of functions makes it possible to do so for a raster that is too large to fit in available memory in R. mergeTiles() is considerably more efficient than using r.patch for many tiles. 
See gparse for an example wrapping this process within a function.
}
\value{
This function does not return any output to R.
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{createTiles}}, \code{\link{processTiles}}, \code{\link{removeTiles}}, \code{\link{testFUN}}, \code{\link{gparse}}
}
\examples{
\dontrun{
	# how to run
    tileindex <- createTiles("dem30", tilesize=tilesize) 
    tileindex <- processTiles(tileindex, baserast="dem30", FUN=testFUN)
    mergeTiles(tileindex, blocksize=blocksize, outname=outname)
    removeTiles(tileindex)
}}

