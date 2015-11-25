\name{processTiles}
\alias{processTiles}
\title{
Process a set of GRASS tiles in R.
}
\description{
Runs a function FUN for each tile in a GRASS raster and stores the output.
}
\usage{
processTiles(tileindex, baserast, FUN, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tileindex}{
The tileindex object provided by createTiles()
}
  \item{baserast}{
The name of a GRASS raster file to be used as the basis for tile processing.
}
  \item{FUN}{
The function to process each tile with. This function should return the names of any GRASS rasters created, and R output if any.
}
  \item{\dots}{
Named arguments to FUN.
}
}
\details{
A common task is to import a raster into R, do some processing, and either write out a new raster, save some results in R, or both. This series of functions makes it possible to do so for a raster that is too large to fit in available memory in R.
See gparse for an example wrapping this process within a function.
}
\value{
\item{tileindex }{A modified tileindex file.}
}

\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{createTiles}}, \code{\link{mergeTiles}}, \code{\link{removeTiles}}, \code{\link{testFUN}}, \code{\link{gparse}}
}
\examples{
\dontrun{
	# how to run
    tileindex <- createTiles("dem30", tilesize=tilesize) 
    tileindex <- processTiles(tileindex, baserast="dem30", FUN=testFUN)
    mergeTiles(tileindex, blocksize=blocksize, outname=outname)
    removeTiles(tileindex)
	}
}

