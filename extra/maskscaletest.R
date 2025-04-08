library(secrRFS)

detectpar <- list(lambda0 = 0.5, sigma = 1)
grid144 <- make.grid(12,12, detector = 'proximity', spacing = 2.0)
grid144mask <- make.mask(grid144, spacing = 0.5, buffer = 4)
D <- 256/maskarea(grid144mask)

parmlevels <- list(D = D, p = c(0.25,0.5), A = c(0.0625,0.125,0.25,0.5,0.75,1), 
				   maskscale = c(FALSE,TRUE))
RFSargs <- list (
	randomfn   = randomDensity, 
	nrepl      = 1000, 
	traps      = grid144, 
	mask       = grid144mask, 
	detectfn   = 'HHN', 
	detectpar  = detectpar, 
	noccasions = 5)
ca <- carray (parmlevels, RFSargs)
round(ca,1)