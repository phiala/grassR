\name{vrm}
\alias{vrm}
\title{
Delete GRASS vectors.
}
\description{
Deletes GRASS vectors from current location and mapset
}
\usage{
vrm(patt, mapset)
}
\arguments{
  \item{patt}{
Pattern to search for (shell glob), with * and ? as wildcards. Cannot be missing.
}
  \item{mapset}{
GRASS mapset from which to remove the vector. If missing, the current mapset is used.
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
\code{\link{rrm}}, ~~~
}
\examples{
\dontrun{
vrm("tempvectors*")
}}

