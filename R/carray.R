
carray <- function (parmlevels, RFSargs, drop = TRUE) {
	ptm  <- proc.time()
	vals <- do.call(expand.grid, parmlevels)
	cval <- mapply(RFS, parm = apply(vals,1,as.list), MoreArgs = RFSargs, SIMPLIFY = FALSE)
	cval <- array(unlist(cval), dim = sapply(parmlevels, length), dimnames = parmlevels)
	if (drop) cval <- drop(cval)
	proctime <- as.numeric((proc.time() - ptm)[3]) / 60
	message('Completed in ', round(proctime,2), ' minutes at ',
			   format(Sys.time(), "%H:%M:%S %d %b %Y"))
	cval
}
################################################################################
