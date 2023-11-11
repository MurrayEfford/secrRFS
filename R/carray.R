
carray <- function (parmlevels, RFSargs, drop = TRUE) {
	vals <- do.call(expand.grid, parmlevels)
	cval <- mapply(RFS, parm = apply(vals,1,as.list), MoreArgs = RFSargs, SIMPLIFY = FALSE)
	cval <- array(unlist(cval), dim = sapply(parmlevels, length), dimnames = parmlevels)
	if (drop) cval <- drop(cval)
	cval
}
################################################################################
