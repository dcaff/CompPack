\name{jackknife}
\alias{jackknife}
\title{Resamples Data using the Jackknife Method}
\usage{
  jackknife(x, t)
}
\arguments{
  \item{x}{a vector}

  \item{t}{estimation of parameter}
}
\value{
  est orignial estimation of parameter

  jkest jackknife estimation of parameter

  jkvar jackknife estimation of variance

  jkbias jackknife estimate of biasness of parameter

  jkbiascorr bias corrected parameter estimate
}
\description{
  This function is used for estimating standard errors when
  the distribution is not know.
}
\examples{
x = runif(10, 0, 1)
mean(x)
jackknife(x,mean)
}
\author{
  Damon McCafferty
  \email{damon.mccafferty@economics.utah.edu}
}

