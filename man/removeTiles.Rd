\name{removeTiles}
\alias{removeTiles}
\title{
Remove intermediate rasters.
}
\description{
Deletes the temporary GRASS rasters created by processTiles().
}
\usage{
removeTiles(tileindex)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tileindex}{
The tileindex object created by createTiles() and modified by processTiles().
}
}
\details{
A common task is to import a raster into R, do some processing, and either write out a new raster, save some result s in R, or both. This series of functions makes it possible to do so for a raster that is too large to fit in available memory in R.
See gparse for an example wrapping this process within a function.
}
\value{
This function returns nothing within R.
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{createTiles}}, \code{\link{processTiles}}, \code{\link{mergeTiles}}, \code{\link{testFUN}}, \code{\link{gparse}}
}
\examples{
\dontrun{
	# how to run
    tileindex <- createTiles("dem30", tilesize=tilesize) 
    tileindex <- processTiles(tileindex, baserast="dem30", FUN=testFUN)
    mergeTiles(tileindex, blocksize=blocksize, outname=outname)
    removeTiles(tileindex)
}}

