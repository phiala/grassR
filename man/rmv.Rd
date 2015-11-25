\name{rmv}
\alias{rmv}
\title{
Move a GRASS raster.
}
\description{
Move a GRASS raster from a specified mapset to a new mapset.
}
\usage{
rmv(rast, oldmapset, newmapset)
}
\arguments{
  \item{rast}{
Raster to move.
}
  \item{oldmapset}{
GRASS mapset to move the raster from.
}
  \item{newmapset}{
Destination mapset.
}
}

\value{
None
}
\details{
Note that this function can only move rasters from elsewhere into the current mapset. The user must have permission to write to both the source and the destination mapsets. This function changes mapsets, and thus resets any GRASS graphics devices.
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{vmv}}}

\examples{
\dontrun{
rls("soilmap", mapset="PERMANENT")
}}

