<!-- badges: start -->
[![R-CMD-check](https://github.com/MurrayEfford/ipsecr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MurrayEfford/ipsecr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->
  
# secrRFS

Spatially Explicit Capture-Recapture Random Field Simulator

This package implements a simulation-based method for predicting overdispersion of $n$ when the distribution of animal activity centres follows a known Cox process (M\o ller and Waagepetersen 2004; Efford and Fletcher unpubl.). 

**secrRFS** depends on **secr** 4.6.5 or later. **RandomFields** (Schlather et al. 2015) and **spatstat** (Baddeley and Turner 2005) are required for some options.

**secrRFS** is NOT available on CRAN.

The code here is under development. It may be installed using
```
devtools::install_github("MurrayEfford/secrRFS")
```

Please report problems as Issues on GitHub.

## References

Baddeley, A. and Turner, R. (2005) spatstat: An R package for analyzing spatial point
  patterns. *Journal of Statistical Software* **12**, 1--42. DOI: 10.18637/jss.v012.i06

Efford, M. G. (2023) secr: Spatially explicit capture--recapture models. 
  R package version 4.6.5. https://github.com/MurrayEfford/secr

Efford, M. G. and Fletcher, D. J. unpubl. Spatial overdispersion impacts 
confidence intervals for population density estimated by spatially explicit capture--recapture.

M\o ller, J., and Waagepetersen, R. P. (2004) Statistical inference and 
simulation for spatial point processes. Chapman & Hall/CRC.

Saura, S. and Martinez-Millan, J. (2000) Landscape patterns simulation
with a modified random clusters method. *Landscape Ecology*,
**15**, 661--678.

Schlather, M., Malinowski, A., Menck, P. J., Oesting, M. and Strokorb, K. 2015. Analysis, simulation and prediction of multivariate random fields with package RandomFields. *Journal of Statistical Software*, **63**, 1--25. URL https://www.jstatsoft.org/v63/i08/.
