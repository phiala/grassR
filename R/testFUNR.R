testFUNR <-
function(x, tempname) {
    ## example function for processTiles()
    ## returns R output as well as names
    # the function to be used in processTiles
    # must accept a SGDF x and a base tempname,
    # and may accept other arguments
    # it must return the name or vector of names of the tempfiles created
    # although this can be the same as the tempname passed to it as an argument
    # may return a list of two items:
    # - 1. a name or vector of names for the file(s) created in GRASS
    # - 2. the results of the function, if something is calculated in R
    #
    # sets all data values to 1
    x <- readRAST6("gssurgo")
    x@data[!is.na(x@data[,1]),1] <- 1
    writeRAST6(x, tempname)
    list(tempname, sum(x@data[,1], na.rm=TRUE))
}
