\name{vplot}
\alias{vplot}
\title{
GRASS vector plot.
}
\description{
Plots a GRASS vector in an open GRASS device.
}
\usage{
vplot(vect, mapset, add = FALSE)
}
\arguments{
  \item{vect}{
The name of an existing vector file.
}
  \item{mapset}{
GRASS mapset to use. If missing, uses the current mapset.
}
  \item{add}{
If add=TRUE, vector is overlain on an existing plot (-o option in GRASS).
}
}
\value{
Plots a GRASS vector on an open device. 
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\seealso{
\code{\link{rplot}}
}
\examples{
\dontrun{
# if no device is open, start one
system("d.mon start=x0")
vplot("dem30")
}}

