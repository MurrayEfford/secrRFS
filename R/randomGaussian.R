randomGaussian <- function (mask, parm, plt = FALSE, ...) 
{
	if (!(requireNamespace("RandomFields"))) {
		stop("install RandomFields")
	}
	defaultparm <- list(
		var = NULL, 
		scale = NULL, 
		model = 'exp', 
		D = NULL,
		maskscale = FALSE)
	if (is.null(parm$D)) stop ("randomGaussian requires D to be specified")
	if (is.null(parm$var)) stop ("randomGaussian requires var to be specified")
	if (is.null(parm$scale)) stop ("randomGaussian requires scale to be specified")
	parm <- replace(defaultparm, names(parm), parm)
	mu <- log(parm$D) - parm$var/2
	model <- match.arg(parm$model[1], c('exp','gauss'))
	# default is negative exponential autocorrelation
	if (model == 'exp')
		model <- RandomFields::RMexp(var = parm$var, scale = parm$scale)   
	else if (model == 'gauss')
		model <- RandomFields::RMgauss(var = parm$var, scale = parm$scale) 
	else
		stop("unknown model")
	model <- model + RandomFields::RMtrend(mean = mu)
	rf <- RandomFields::RFsimulate(model, x = as.matrix(mask))@data[,1]
	Lambda  <- exp(rf)
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

