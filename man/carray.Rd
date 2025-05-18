\name{carray}
\alias{carray}

\title{Overdispersion Array}

\description{

Computes overdispersion for array of parameter values.

}

\usage{

carray(parmlevels, RFSargs, drop = TRUE)

}

\arguments{
  \item{parmlevels}{list of levels for each parameter of randomfn in `parm'}
  \item{RFSargs}{other arguments passed to \code{\link{RFS}}}
  \item{drop}{logical}
}

\details{

\code{\link{RFS}} is executed for every combination of levels in `parmlevels'.
`parmlevels should include all parameters for which the generating function 
(\link{randomfn}) has no default.

Other arguments of \code{RFS} (i.e. excluding `parm') are provided in `RFSargs'.

}

\value{

Array of values of c. Dimensions correspond to components of parmlevels. 
If drop = TRUE then dimensions are deleted that have only one level.

}

\author{

Murray Efford

}


\seealso{

\code{\link{RFS}}, \link{randomfn}

}

\examples{

\donttest{
detectpar <- list(lambda0 = 0.5, sigma = 1)
grid144 <- make.grid(12,12, detector='proximity', spacing = 2.0)
grid144mask <- make.mask(grid144, spacing = 0.5, buffer = 4)
D <- 256/maskarea(grid144mask)
parmlevels <- list(D = D, mu = 2^(0:5), scale = c(1e-04, 1, 2, 4, 8))
RFSargs <- list (
    randomfn   = randomParents, 
    nrepl      = 1000, 
	traps      = grid144, 
	mask       = grid144mask, 
    detectfn   = 'HHN', 
	detectpar  = detectpar, 
    noccasions = 5)
ca <- carray (parmlevels, RFSargs)
round(ca,1)
#     scale
# mu   1e-04    1    2    4    8
#   1    1.9  1.9  1.8  1.6  1.4
#   2    2.8  2.9  2.5  2.4  1.8
#   4    4.5  4.4  4.1  3.9  2.6
#   8    8.2  8.4  7.2  6.5  4.5
#   16  15.6 15.7 13.5 12.0  8.0
#   32  29.9 30.5 26.0 23.1 13.4
}

}