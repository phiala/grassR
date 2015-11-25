\name{vmv}
\alias{vmv}
\title{
Move a GRASS vector.
}
\description{
Move a GRASS vector from a specified mapset to a new mapset.
}
\usage{
vmv(vect, oldmapset, newmapset)
}
\arguments{
  \item{vect}{
Raster to move.
}
  \item{oldmapset}{
GRASS mapset to move the vector from.
}
  \item{newmapset}{
Destination mapset.
}
}

\value{
None
}
\details{
Note that this function can only move vectors from elsewhere into the current mapset. The user must have permission to write to both the source and the destination mapsets. This function changes mapsets, and thus resets any GRASS graphics devices.
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{rmv}}}

\examples{
\dontrun{
rls("soilmap", mapset="PERMANENT")
}}

