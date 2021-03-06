#' uphill search on fucntion
#' 
#' @description
#' General anneal function, where we conduct a uphill search on the function to find maximum
#' 
#' @param f function to find the maximum
#' @param mu starting point
#' @param n number of iterations
#' @param sig size of steps
#' @param tt temperature
#' @param g rate of temperature
#' 
#' @examples
#' anneal(onedfunction, 2, 100, 1, 10, .99)
#' @author Ernest Chan \email{faiernest418@@gmail.com}
#' 
#' @export

anneal = function(f,mu,n=1000,sig=1,tt=10,g=0.999)
{
	m = mu
	fm = f(m)
	x = rep(0,n)
	fx = rep(0,n)
	t = tt
	for (i in 1:n)
	{
		dm = m+rnorm(1,0,sig)
		fdm = f(dm)

		t = t*g
		if (runif(1) < (fdm/fm)^(1/t))
		{
			m = dm
			fm = fdm
		}
		x[i] = m
		fx[i] = fm
	}
	ii = ((1:n)[fx==max(fx)])[1]
	list(x = x, fx = fx, best = x[ii], fbest = fx[ii], t=t)
}
