\name{rls}
\alias{rls}
\title{
List GRASS rasters.
}
\description{
List GRASS raster files in current location.
}
\usage{
rls(patt, mapset)
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
\code{\link{vls}}}

\examples{
\dontrun{
rls("gssurgo.*")
}}

