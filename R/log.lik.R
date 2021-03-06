#' Find the log likelihood of a normal distribution
#' 
#' @description 
#' Find the log likelihood of a normal distribution.
#' 
#' @param x data.
#' @param mu estimated mean.
#' @param var estimated variance.
#' 
#' @author Damon McCafferty \email{damon.mccafferty@@economics.utah.edu} 
#' 
#' @return ll logliklihood of the distribution
#' 
#' @examples
#' x = rnorm(100, 3, 7)
#' log.lik(x,3,7)
#' 
#' @export 

log.lik<-function(x=data, mu, var)
{
  n=length(x)
  ll = -n/2* log(2*pi*var) - .5/var*sum((mu-x)^2)
  
  -ll
}
