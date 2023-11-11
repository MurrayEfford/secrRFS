randomParents <- function (mask, parm, plt = FALSE, parentcex = 0, ...) {  # D, mu, scale
	if (!(requireNamespace("spatstat"))) {
		stop("install spatstat")
	}
	kappa <- parm$D/1e4/parm$mu   # parent mean density / m^2
	bbox <- attr(mask, 'boundingbox')
	ow <- spatstat.geom::owin(range(bbox$x), range(bbox$y))  
	pts <- spatstat.random::rThomas(
		kappa       = kappa,
		scale       = parm$scale,
		mu          = parm$mu,
		win         = ow,
		nonempty    = FALSE,  # include parents with no offspring
		saveparents = TRUE,
		saveLambda  = TRUE,
		eps         = attr(mask,'spacing'),
		rule.eps    = 'shrink.frame')    
	df <- as.data.frame(attr(pts, "Lambda"))
	# re-order y then x for correct overlay
	df <- df[order(df[,2], df[,1]),]
	parents <- as.data.frame(attr(pts, "parents"))
	if (plt) {
		covariates(mask)$Lambda <- df[,3] * 1e4
		plot(mask, cov = 'Lambda', dots = FALSE, ...)
		if (parentcex>0) points(parents, pch = 16, cex = parentcex)
	}
	df[,3] * 1e4
}
################################################################################

