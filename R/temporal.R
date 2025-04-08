temporal <- function (nrepl = 100, traps, buffer, D, detectfn = 'HHN', 
					  detectpar, noccasions, nsessions, phi = 1, 
					  lambda = 1, recrmodel = 'poisson', 
					  movemodel = 'static', seed = NULL, plt = FALSE, verbose = FALSE) {
	if (!requireNamespace('secr')) stop ("requires secr")
	detarg <- list(detectpar = detectpar, noccasions = noccasions)
	poparg <- list(
		D         = D,
		core      = traps,
		buffer    = buffer,    # uses bounding box of mask
		model2D   = "poisson",
		nsessions = nsessions,
		details   = list(lambda = lambda, phi = phi, 
						 recrmodel = recrmodel, movemodel = movemodel))
    detarg <- list(
    	traps      = traps,
    	detectfn   = detectfn,
    	detectpar  = detectpar,
    	noccasions = noccasions, 
    	renumber   = FALSE
    )
    mask <- make.mask(traps, buffer = buffer)
    # expected number of individuals detected on first occasion
    pd <- pdot(mask, traps, detectfn = detectfn, detectpar = detectpar, 
    		   noccasions = noccasions)
    En1 <- sum(pd) * attr(mask, 'area') * D
    En <- sum (En1 * lambda^(0:(nsessions-1)))
	set.seed(seed)
	if (plt) plot(0,0, xlim=c(0.5, nsessions), ylim=c(0,En1*2), xlab = 'Session', ylab = 'n')
	out <- sapply(1:nrepl, function(r) {
		suppressWarnings(detarg$popn <- do.call(sim.popn, poparg))
		CH <- do.call(sim.capthist, detarg)
		n <- sapply(CH, nrow)
		if (plt) {
			lines(1:nsessions, n)
		}
		n
	})
	outsum <- apply(out,2,sum)
	if (!verbose) {
		data.frame(nsessions = nsessions, lambda = lambda, phi = phi, 
				   varn = var(outsum), En = En, ratio = var(outsum)/En)
	}
	else {
		list(nsessions = nsessions, lambda = lambda, phi = phi, 
			 out = out,
			 varn = var(outsum), En = En, ratio = var(outsum)/En)
	}
}
# 
# mapply(temporal, phi = c(0.01,0.5,1), MoreArgs = list(nrepl = 1000, nsessions = 10, 
#        traps = local$traps, buffer = 4, D = 2844.44, recrmodel='discrete',
#        noccasions = 5, detectpar = list(lambda0 = 0.5, sigma = 1)))
# 
# nsessions 10       10       10      
# lambda    1        1        1       
# phi       0.01     0.5      1       
# varn      14011.04 21189.11 17981.77
# En        1806.946 1806.946 1806.946
# ratio     7.753987 11.72647 9.951469