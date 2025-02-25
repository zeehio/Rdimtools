% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/v_nonlinear_BMDS.R
\name{do.bmds}
\alias{do.bmds}
\title{Bayesian Multidimensional Scaling}
\usage{
do.bmds(
  X,
  ndim = 2,
  par.a = 5,
  par.alpha = 0.5,
  par.step = 1,
  mc.iter = 50,
  print.progress = FALSE
)
}
\arguments{
\item{X}{an \eqn{(n\times p)} matrix whose rows are observations
and columns represent independent variables.}

\item{ndim}{an integer-valued target dimension.}

\item{par.a}{hyperparameter for conjugate prior on variance term, i.e., \eqn{\sigma^2 \sim IG(a,b)}. Note that \eqn{b} is chosen appropriately as in paper.}

\item{par.alpha}{hyperparameter for conjugate prior on diagonal term, i.e., \eqn{\lambda_j \sim IG(\alpha, \beta_j)}. Note that \eqn{\beta_j} is chosen appropriately as in paper.}

\item{par.step}{stepsize for random-walk, which is standard deviation of Gaussian proposal.}

\item{mc.iter}{the number of MCMC iterations.}

\item{print.progress}{a logical; \code{TRUE} to show iterations, \code{FALSE} otherwise (default: \code{FALSE}).}
}
\value{
a named \code{Rdimtools} S3 object containing
\describe{
\item{Y}{an \eqn{(n\times ndim)} matrix whose rows are embedded observations.}
\item{algorithm}{name of the algorithm.}
}
}
\description{
A Bayesian formulation of classical Multidimensional Scaling is presented.
Even though this method is based on MCMC sampling, we only return maximum a posterior (MAP) estimate
that maximizes the posterior distribution. Due to its nature without any special tuning,
increasing \code{mc.iter} requires much computation. A note on the method is that
this algorithm does not return an explicit form of projection matrix so it's
classified in our package as a nonlinear method. Also, automatic dimension selection is not supported
for simplicity as well as consistency with other methods in the package.
}
\examples{
\donttest{
## load iris data
data(iris)
set.seed(100)
subid = sample(1:150,50)
X     = as.matrix(iris[subid,1:4])
label = as.factor(iris[subid,5])

## compare with other methods
outBMD <- do.bmds(X, ndim=2)
outPCA <- do.pca(X, ndim=2)
outLDA <- do.lda(X, label, ndim=2)

## visualize
opar <- par(no.readonly=TRUE)
par(mfrow=c(1,3))
plot(outBMD$Y, pch=19, col=label, main="Bayesian MDS")
plot(outPCA$Y, pch=19, col=label, main="PCA")
plot(outLDA$Y, pch=19, col=label, main="LDA")
par(opar)
}

}
\references{
\insertRef{oh_bayesian_2001}{Rdimtools}
}
\author{
Kisung You
}
\concept{nonlinear_methods}
