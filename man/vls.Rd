\name{vls}
\alias{vls}
\title{
List GRASS vectors.
}
\description{
List GRASS vector files in current location.
}
\usage{
vls(patt, mapset)
}
\arguments{
  \item{patt}{
Pattern to search for (shell glob), with * and ? as wildcards. If missing, lists all rasters.
}
  \item{mapset}{
GRASS mapset to search within. If missing, uses the current mapset.
}
}
\value{
A character vector of filenames.
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}
\seealso{
\code{\link{rls}}
}
\examples{
\dontrun{
vls("state*")
}}


