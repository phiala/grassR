\name{createTiles}
\alias{createTiles}
\title{
Divide a raster into tiles.
}
\description{
Divides a GRASS raster into tiles and prepare for subsequent processing.
}
\usage{
createTiles(baserast, tilesize = 2000)
}
\arguments{
  \item{baserast}{
The name of a GRASS raster to use as the basis for creating a set of tiles.
}
  \item{tilesize}{
The size in pixels of the tiles to create. The default is usually the best option.
}
}
\details{
A common task is to import a raster into R, do some processing, and either write out a new raster, save some results in R, or both. This series of functions makes it possible to do so for a raster that is too large to fit in available memory in R.
}
\value{
\item{tileindex }{A data structure containing information about the created tileset. Should not be modified directly.}
}

\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{processTiles}}, \code{\link{mergeTiles}}, \code{\link{removeTiles}}, \code{\link{testFUN}}, \code{\link{gparse}}
}
\examples{
\dontrun{
	# how to run
    tileindex <- createTiles("dem30", tilesize=tilesize) 
    tileindex <- processTiles(tileindex, baserast="dem30", FUN=testFUN)
    mergeTiles(tileindex, blocksize=blocksize, outname=outname)
    removeTiles(tileindex)
}}

