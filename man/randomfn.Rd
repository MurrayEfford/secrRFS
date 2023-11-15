\name{randomfn}
\alias{randomfn}
\alias{randomDensity}
\alias{randomGaussian}
\alias{randomParents}

\title{Intensity Generators}

\description{

Functions to generate the intensity surface for one realisation of a Cox process.

}

\usage{

randomDensity(mask, parm, plt = FALSE, ...)
randomGaussian(mask, parm, plt = FALSE, ...)
randomParents(mask, parm, plt = FALSE, parentcex = 0, ...)

}

\arguments{

  \item{mask}{secr mask object}
  \item{parm}{list of parameter values (see Details)}
  \item{plt}{logical}
  \item{\dots}{other arguments passed to plot.mask when plt = TRUE}
  \item{parentcex}{numeric}

}

\details{

\tabular{llll}{
randomDensity  \tab secr            \tab \link{randomHabitat} \tab D, A, p \cr
randomGaussian \tab RandomFields    \tab RFsimulate    \tab D, var, scale \cr
randomPoisson  \tab spatstat.random \tab rThomas       \tab D, mu, scale \cr 
}

All functions generate a surface with expected global density `D'.

\code{randomDensity} generates a binary habitat mosaic using the algorithm of Saura and Martinez-Millan (2000) as in \code{\link{randomHabitat}}.

\code{randomGaussian} generates a log-gaussian intensity surface with point-specific variance `var' and exponential covariance function with scale `scale'.

\code{randomParents} generates an intensity surface from a Thomas process with `mu' expected offspring per parent and circular bivariate normal dispersion `scale' about each parent. Parent points are plotted if parentcex > 0.

The `parm' argument can include maskscale = TRUE to adjust the expected number within the mask (area A) to equal DA (default maskscale = FALSE).

}

\value{

Vector of intensity values, one for each point in \code{mask}.

\code{randomDensity} is modified from the \pkg{secr} function of the same name.

}

\author{

Murray Efford

}

\seealso{

\code{\link{RFS}}, 
\code{\link{randomHabitat}}
}

\examples{

grid144 <- make.grid(12,12, detector='proximity', spacing = 2.0)
grid144mask <- make.mask(grid144, spacing = 0.5, buffer = 4)
D <- 256/maskarea(grid144mask)

parm <- list(D = D, A = 0.5, p = 0.5, rescale = TRUE)
Di <- randomDensity(grid144mask, parm)
# non-habitat cells have density = 0
table(Di)

}
