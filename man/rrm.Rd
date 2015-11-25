\name{rrm}
\alias{rrm}
\title{
Delete GRASS rasters.
}
\description{
Deletes GRASS rasters from current location and specified mapset
}
\usage{
rrm(patt, mapset)
}
\arguments{
  \item{patt}{
Pattern to search for (shell glob), with * and ? as wildcards. Cannot be missing.
}
  \item{mapset}{
GRASS mapset from which to remove the raster. If missing, the current mapset is used.
}
}
\value{
Does not return an R result.
}
\details{
To remove an item from a different mapset, the user must have permission to write to it. Removing an item from a different mapset changes mapsets, and thus resets any GRASS graphics devices.
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{vrm}}, ~~~
}
\examples{
\dontrun{
rrm("temprasters*")
}
}

