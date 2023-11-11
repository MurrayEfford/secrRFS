
################################################################################
# modified from secr::randomDensity to allow plotting
randomDensity <- function (mask, parm, plt = FALSE, ...) 
{
	if (!(requireNamespace("secr"))) {
		stop("secr not found")
	}
	defaultparm <- list(D = NULL, p = 0.5, A = 0.5, directions = 4, 
						minpatch = 1, plt = FALSE, seed = NULL, 
						rescale = TRUE)
	if (is.null(parm$D)) stop ("myRandomHabitat requires D to be specified")
	parm     <- replace(defaultparm, names(parm), parm)
	userargs <- c("p", "A", "directions", "minpatch", "plt", "seed")
	tempmask <- do.call(secr::randomHabitat, 
						c(parm[userargs], mask = list(mask), drop = FALSE))
	habitat  <- attr(tempmask,"covariates")[["habitat"]]
	if (parm$rescale) {
		# adjust for requested habitat proportion
		habitat <- habitat * parm$D / parm$A
	}
	else {
		habitat <- habitat * parm$D
	}
	if (plt) {
		covariates(mask)$Lambda <- habitat
		plot(mask, cov = 'Lambda', dots = FALSE, ...)
	}
	return(habitat)
}
################################################################################
