
RFS <- function (randomfn = randomDensity, 
				 parm = list(), 
				 nrepl = 2, 
				 traps, 
				 mask, 
				 detectfn = 'HHN', 
				 detectpar, 
				 noccasions, 
				 verbose = FALSE, 
				 ncores = NULL, 
				 seed = NULL) {
	ncores <- setNumThreads(ncores)
	pd <- pdot(mask, traps, detectfn, detectpar, noccasions)
	a <- sum(pd) * attr(mask, 'area')
	En <- a * parm$D
	one <- function (r, randomfn, mask, parm, pd) {
		D <- randomfn(mask, parm)
		sum(pd * D) / sum(pd) 
	}
	if (!is.null(ncores) && ncores>1 && nrepl>1) {
		clustertype <- if (.Platform$OS.type == "unix") "FORK" else "PSOCK"
		clust <- parallel::makeCluster(ncores, type = clustertype)
		parallel::clusterSetRNGStream(clust, seed)
		on.exit(parallel::stopCluster(clust))
		localD <- parallel::parSapply(clust, 1:nrepl, one, randomfn, mask, parm, pd)
	}
	else {
		set.seed(seed)
		localD <- sapply(1:nrepl, one, randomfn, mask, parm, pd)
	}
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
