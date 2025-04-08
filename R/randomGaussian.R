randomGaussian <- function (mask, parm, plt = FALSE, ...) 
{
	if (!(requireNamespace("spatstat"))) {
		stop("install spatstat")
	}
	defaultparm <- list(
		model     = 'exponential',    # negative exponential autocorrelation
		var       = NULL, 
		scale     = NULL, 
		D         = NULL,
		n.cond    = NULL,             # Poisson n
		maskscale = FALSE)
	
	if (is.null(parm$D)) stop ("randomGaussian requires D to be specified")
	if (is.null(parm$var)) stop ("randomGaussian requires var to be specified")
	if (is.null(parm$scale)) stop ("randomGaussian requires scale to be specified")
	
	parm <- replace(defaultparm, names(parm), parm)
	mu <- log(parm$D/1e4) - parm$var/2
	model <- match.arg(parm$model[1], c('exponential','gauss'))
	
	bbox <- attr(mask, 'boundingbox')
	ow <- spatstat.geom::owin(range(bbox$x), range(bbox$y))  
	pts <- spatstat.random::rLGCP(
		model      = model,
		mu         = mu,
		var        = parm$var,
		scale      = parm$scale,
		n.cond     = parm$n.cond,
		win        = ow,
		saveLambda = TRUE,
		eps        = attr(mask,'spacing'),
		rule.eps   = 'shrink.frame')
	
	df <- as.data.frame(attr(pts, "Lambda"))
	# re-order y then x for correct overlay
	Lambda <- df[order(df[,2], df[,1]),3] * 1e4
	if (parm$maskscale) {
		# conditional on N(A)
		N <- parm$D * maskarea(mask)
		Lambda <- Lambda * N / sum(Lambda)
	}
	if (plt) {
		covariates(mask)$Lambda <- Lambda
		plot(mask, cov = 'Lambda', dots = FALSE, ...)
	}
	return(Lambda)   # vector of cell-specific densities
}
################################################################################

