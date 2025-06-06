\name{RFS}
\alias{RFS}

\title{Overdispersion Simulator}

\description{Compute overdispersion of \eqn{n} by simulating CV(Da)}

\usage{

RFS(randomfn = randomDensity, parm = list(), nrepl = 2, traps, mask, 
detectfn = "HHN", detectpar, noccasions, verbose = FALSE, 
seed = NULL)

}

\arguments{
  \item{randomfn}{function to generate random intensity surface}
  \item{parm}{list of parameter values for randomfn}
  \item{nrepl}{integer number of replicates >= 2}
  \item{traps}{secr traps object}
  \item{mask}{secr mask object}
  \item{detectfn}{character or integer code for spatial detection function (see \link{detectfn})}
  \item{detectpar}{list of detection parameter values}
  \item{noccasions}{integer number of sampling occasions}
  \item{verbose}{logical}
  \item{seed}{optional seed}
}

\details{

`randomfn' should be one \code{\link{randomDensity}}, \code{\link{randomGaussian}}, \code{\link{randomParents}}. The required parameters (list `parm') are specific to each `randomfn'.

See the vignette for an extended description (type `vignette('secrRFS')` after loading package).

}

\value{

Either a scalar estimate of overdispersion (\eqn{c}) or a list including 

\item{localD}{vector of simulated local densities}
\item{c}{estimated overdispersion \eqn{c}}

}

\references{

Efford, M. G. and Fletcher, D. J. unpubl. The effect of spatial overdispersion 
on confidence intervals for population density estimated by spatially explicit 
capture--recapture.

}

\seealso{

\code{\link{carray}},
\code{\link{parallel-package}}

}

\author{Murray Efford}

\examples{

detectpar <- list(lambda0 = 0.5, sigma = 1)
grid144 <- make.grid(12,12, detector='proximity', spacing = 2.0)
grid144mask <- make.mask(grid144, spacing = 0.5, buffer = 4)
D <- 256/maskarea(grid144mask)

\donttest{

nrepl <- 100  # increase to 1000 for serious use

parm1 <- list(D = D, A = 0.5, p = 0.5)
RFS(randomDensity, parm1, nrepl, grid144, grid144mask, 'HHN', 
    detectpar, 5)

parm2 <- list(D = D, var = 1, scale = 5)
RFS(randomGaussian, parm2, nrepl, grid144, grid144mask, 'HHN', 
    detectpar, 5)

parm3 <- list(D = D, mu = 8, scale = 2)
RFS(randomParents, parm3, nrepl, grid144, grid144mask, 'HHN', 
    detectpar, 5)
}

}
