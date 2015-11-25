\name{rplot}
\alias{rplot}
\title{
GRASS raster plot.
}
\description{
Plots a GRASS raster in an open GRASS device.
}
\usage{
rplot(rast, mapset, add = FALSE)
}
\arguments{
  \item{rast}{
The name of an existing raster file.
}
  \item{mapset}{
GRASS mapset to use. If missing, uses the current mapset.
}
  \item{add}{
If add=TRUE, raster is overlain on an existing plot (-o option in GRASS).
}
}
\value{
Plots a GRASS raster on an open device. 
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{vplot}}
}
\examples{
\dontrun{
# if no device is open, start one
system("d.mon start=x0")
rplot("dem30")
}}

