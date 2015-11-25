\name{mapset}
\alias{mapset}
\title{
Change GRASS mapset.
}
\description{
Changes to the specified GRASS mapset
}
\usage{
mapset(newmapset)
}
\arguments{
  \item{newmapset}{
Name of the GRASS mapset to change to.
}
}
\value{
Does not return an R result.
}
\details{
This function changes mapsets, and thus resets any GRASS graphics devices. The user must have permission to use the new mapset.
}
\author{
Sarah Goslee <sarah.goslee@ars.usda.gov>
}

\examples{
\dontrun{
mapset("soils")
}
}

