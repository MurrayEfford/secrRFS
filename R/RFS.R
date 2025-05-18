
RFS <- function (randomfn = randomDensity, 
				 parm = list(), 
				 nrepl = 2, 
				 traps, 
				 mask, 
				 detectfn = 'HHN', 
				 detectpar, 
				 noccasions, 
				 verbose = FALSE, 
				 seed = NULL) {
	pd <- pdot(mask, traps, detectfn, detectpar, noccasions)
	a <- sum(pd) * attr(mask, 'area')
	En <- a * parm$D
	one <- function (r, randomfn, mask, parm, pd) {
		D <- randomfn(mask, parm)
		sum(pd * D) / sum(pd) 
	}
	set.seed(seed)
	localD <- sapply(1:nrepl, one, randomfn, mask, parm, pd)
	c <- a * var(localD) / mean(localD) + 1 
	
	if (verbose) {
		list(parm = unlist(parm), detectpar = detectpar, detectfn = detectfn, 
			 noccasions = noccasions, a = a, localD = localD, c = c)
	}
	else {
		c
	}
}
################################################################################
