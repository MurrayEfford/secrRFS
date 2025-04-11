\name{secrRFS-package}
\alias{secrRFS-package}
\alias{secrRFS}

\docType{package}

\title{SECR random field simulator}

\description{

  Functions to estimate the overdispersion of number detected \eqn{n} by simulating intensity
  surfaces (Efford and Fletcher 2024).
  
}

\details{

\tabular{ll}{
Package: \tab secrRFS\cr
Type: \tab Package\cr
Version: \tab 0.0.0\cr
Date: \tab 2025-04-12\cr
License: \tab GNU General Public License Version 2 or later\cr
}

See the vignette for an extended description (type `vignette('secrRFS')` after loading package).

If \code{ncores > 1} the \pkg{parallel} package is used to create
worker processes on multiple cores (see \link{Parallel} for more). 

}

\author{ Murray Efford \email{murray.efford@otago.ac.nz} }

\references{

Efford, M. G. (2025) secr: Spatially explicit capture--recapture models. 
  R package version 5.2.1. https://CRAN.R-project.org/package=secr/

Efford, M. G. and Fletcher, D. (2024)  The effect of spatial overdispersion 
on confidence intervals for population density estimated by spatially explicit 
capture--recapture. \emph{bioRxiv} https://doi.org/10.1101/2024.03.12.584742.

}

\keyword{ package }

\seealso{

\code{\link{RFS}}, 
\code{\link{carray}}

}
