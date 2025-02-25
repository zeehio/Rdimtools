% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/v_linear_MMC.R
\name{do.mmc}
\alias{do.mmc}
\title{Maximum Margin Criterion}
\usage{
do.mmc(X, label, ndim = 2)
}
\arguments{
\item{X}{an \eqn{(n\times p)} matrix whose rows are observations
and columns represent independent variables.}

\item{label}{a length-\eqn{n} vector of data class labels.}

\item{ndim}{an integer-valued target dimension.}
}
\value{
a named \code{Rdimtools} S3 object containing
\describe{
\item{Y}{an \eqn{(n\times ndim)} matrix whose rows are embedded observations.}
\item{projection}{a \eqn{(p\times ndim)} whose columns are basis for projection.}
\item{algorithm}{name of the algorithm.}
}
}
\description{
Maximum Margin Criterion (MMC) is a linear supervised dimension reduction method that
maximizes average margin between classes. The cost function is defined as
\deqn{trace(S_b - S_w)}
where \eqn{S_b} is an overall variance of class mean vectors, and \eqn{S_w} refers to
spread of every class. Note that Principal Component Analysis (PCA) maximizes
total scatter, \eqn{S_t = S_b + S_w}.
}
\examples{
\donttest{
## use iris data
data(iris, package="Rdimtools")
subid = sample(1:150, 50)
X     = as.matrix(iris[subid,1:4])
label = as.factor(iris[subid,5])

## compare MMC with other methods
outMMC = do.mmc(X, label)
outMVP = do.mvp(X, label)
outPCA = do.pca(X)

## visualize
opar <- par(no.readonly=TRUE)
par(mfrow=c(1,3))
plot(outMMC$Y, pch=19, col=label, main="MMC")
plot(outMVP$Y, pch=19, col=label, main="MVP")
plot(outPCA$Y, pch=19, col=label, main="PCA")
par(opar)
}

}
\references{
\insertRef{li_efficient_2006}{Rdimtools}
}
\author{
Kisung You
}
\concept{linear_methods}
