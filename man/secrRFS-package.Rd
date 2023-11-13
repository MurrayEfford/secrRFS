\name{secrRFS-package}
\alias{secrRFS-package}
\alias{secrRFS}

\docType{package}

\title{SECR random field simulator}

\description{

  Functions to estimate the overdispersion of number detected \eqn{n} by simulating intensity
  surfaces (Efford and Fletcher unpubl.).
  
}

\details{

\tabular{ll}{
Package: \tab secrRFS\cr
Type: \tab Package\cr
Version: \tab 0.0.0\cr
Date: \tab 2023-11-11\cr
License: \tab GNU General Public License Version 2 or later\cr
}

See the vignette for an extended description (type `vignette('secrRFS')` after loading package).

If \code{ncores > 1} the \pkg{parallel} package is used to create
worker processes on multiple cores (see \link{Parallel} for more). 

}

\author{ Murray Efford \email{murray.efford@otago.ac.nz} }

\references{

Efford, M. G. (2023) secr: Spatially explicit capture--recapture models. 
  R package version 4.6.5. https://CRAN.R-project.org/package=secr/

Efford, M. G. and Fletcher, D. J. unpubl. The effect of spatial overdispersion 
on confidence intervals for population density estimated by spatially explicit 
capture--recapture.

}

\keyword{ package }

\seealso{

\code{\link{RFS}}, 
\code{\link{carray}}

}
