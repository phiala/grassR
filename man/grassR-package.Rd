\name{grassR-package}
\alias{grassR-package}
\alias{grassR}
\docType{package}
\title{
Utility and tileset functions for GRASS.
}
\description{
Utility functions (ls, rm, plot) to work with GRASS rasters and vectors from within R. A series of functions to process large rasters in smaller chunks (tiles).
}
\details{
\tabular{ll}{
Package: \tab grassR\cr
Type: \tab Package\cr
Version: \tab 0.9\cr
Date: \tab 2015-04-09\cr
License: \tab GPL >= 2\cr
}
The utility functions are rls, rrm, rplot; vls, vrm, vplot.
The tile functions are createTiles, processTiles, mergeTiles, removeTiles.
Trivial examples of using these functions are in testFUN and testFUNR, and gparse is a full useful example for processing gSSURGO data.
}
\author{
Sarah Goslee
Maintainer: Sarah Goslee <sarah.goslee@ars.usda.gov>
}
\keyword{ package }

\examples{
\dontrun{
	# how to run
    tileindex <- createTiles("dem30", tilesize=tilesize) 
    tileindex <- processTiles(tileindex, baserast="dem30", FUN=testFUN)
    mergeTiles(tileindex, blocksize=blocksize, outname=outname)
    removeTiles(tileindex)
}

}
