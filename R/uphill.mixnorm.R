#' uphill.mixnorm
#' @description
#' This function is use for conducting a uphill search on the mixture of normal distribution
#' 
#' @param x is the function of the mixture
#' @param k is the number of mixture
#' @param n is the number of iteration
#' @param t is the temperature
#' 
#' @examples
#' uphill.mixnorm(mixnorm(100, c(.50, .15, .35), c(-3, 0, 3), c(3,3,3)), 4, 1000, 10)
#' 
#' @author Ernest Chan \email{faiernest418@@gmail.com}
#' 
#' @export


uphill.mixnorm = function(x, k, n = 1000, t = 100)
{
	p = rep(1/k, k)
	mnx = min(x)
	mxx = max(x)
	m = (1:k) * (mxx-mnx)/(k+1) + mnx
	s = rep(1, k)

	f = mixlike(x, p, m, s)

	for ( i in 1:n)
	{
		newm = m
		for (j in 1:length(m))
			newm[j] = m[j] + rnorm(1, 0, 0.1)

		news = s
		for (j in 1:length(s))
		{
			t = log(s[j]) + rnorm(1, 0, 0.1)
			news[j] = exp(t)
		}

		newp = p
		for (j in 1:length(p))
		{
			t = log(p[j]) + rnorm(1, 0, 0.1)
			newp[j] = exp(t)
		}
		newp = newp/sum(newp)

		newf  = mixlike(x, newp, newm, news)
		if (runif(1) < (newf/f)^(1/t))
		{
			m = newm
			s = news
			p = newp
			f = newf
		}
		t= t*.99
	}
	list(prob = p, sd = s, mean = m, value = f)
}
