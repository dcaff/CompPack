\name{mc}
\alias{mc}
\title{Generate Markov Chains}
\usage{
  mc(p, n)
}
\arguments{
  \item{p}{Probability matrix.}

  \item{n}{Number of observations.}
}
\value{
  x values of observations.
}
\description{
  Generates a Markov Chain.
}
\examples{
A<-matrix(c(.9,.8,0,0,.1,.2,0,0,0,0,.5,.6,0,0,.5,.4), nrow=4)
 B<-matrix(rep(.3,16), nrow=4); diag(B)<-.1
 C<-matrix(c(.9,0,0,0, .1,.9,0,0 ,0,.1,.8,.1, 0,0,.2,.9), nrow=4)
 D<-matrix(c(.9,0,0,.1,.1,.9,0,0,0,.1,.9,0,0,0,.1,.9), nrow=4)
 mc(A, 10)
 mc(B, 10)
 mc(C, 10)
 mc(D, 10)
}
\author{
  Tyler Hunt \email{tyler@psychoanalytix.com}
}

