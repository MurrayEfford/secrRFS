# secrRFS

Spatially Explicit Capture-Recapture Random Field Simulator

This package implements a simulation-based method for predicting overdispersion of $n$ when the distribution of animal activity centres follows a known Cox process (Moller and Waagepetersen 2004; Efford and Fletcher unpubl.). 

**secrRFS** depends on **secr**. **spatstat** (Baddeley and Turner 2005) is required for LGCP and cluster options.

**secrRFS** is NOT available on CRAN.

The code here is under development. It may be installed using
```
devtools::install_github("MurrayEfford/secrRFS")
```
 or
 
```
install.packages("secrRFS", repos = "https://MurrayEfford.r-universe.dev")
```

Please report problems as Issues on GitHub.

## References

Baddeley, A. and Turner, R. (2005) spatstat: An R package for analyzing spatial point
  patterns. *Journal of Statistical Software* **12**, 1--42. DOI: 10.18637/jss.v012.i06

Efford, M. G. (2025) secr: Spatially explicit capture--recapture models. 
  R package version 5.2.1. https://github.com/MurrayEfford/secr

Efford, M. G. and Fletcher, D. (2024) The effect of spatial overdispersion 
on confidence intervals for population density estimated by spatially explicit 
capture--recapture. *bioRxiv* DOI: 10.1101/2024.03.12.584742

Moller, J. and Waagepetersen, R. P. (2004) Statistical inference and 
simulation for spatial point processes. Chapman & Hall/CRC.

Saura, S. and Martinez-Millan, J. (2000) Landscape patterns simulation
with a modified random clusters method. *Landscape Ecology*,
**15**, 661--678.
