\name{CrossNN}
\alias{CrossNN}
\title{Covariate balance checking through the nearest neighbor graph}
\description{This function tests whether covariates in a treatment group and a matched control group are balanced in observational studies through the nearest neighbor graph constructed on the subjects.}
\usage{
CrossNN(distM,treated.index,perm=0)
}
\arguments{
  \item{distM}{The distance matrix for the pooled observations (pooled over the treated subjects and the matched controls). If there are n treated subjects and n matched controls, then this distance matrix is a 2n by 2n matrix with the [i,j] element the distance between observation i and observation j.  What distance to use is decided by users. Some simple choices are the Euclidean distance, L1 distance, and mahalanobis distance.}
  \item{treated.index}{The subject indices of the treated subjects.  The subjects are ordered in the same way as for calculating the distance matrix, distM.}
  \item{perm}{The number of permutations performed to calculate the p-value of the test. The default value is 0, which means the permutation is not performed and only approximate p-value based on asymptotic theory is provided.  Doing permutation could be time consuming, so be cautious if you want to set this value to be larger than 10,000.}
}
\value{
  \item{test.stat.D}{The raw test statistic (Dm in the reference paper).}
  \item{test.stat.Z}{The standardized test statistic (ZD in the reference paper.}
  \item{pval.appr}{The approximated p-value based on asymptotic theory.}
  \item{pval.perm}{The permutation p-value when argument `perm` is positive.}
}
\seealso{
  \code{\link{CrossMST}}
}
\examples{
## A snippet of the smoking example in the reference paper.
## smoking.rda contains a 300 by 300 distance matrix, smokingDist.
## The indices of the treated subjects are 1:150. 
data(smoking)
CrossNN(smokingDist, 1:150)

## Uncomment the following line to get permutation p-value with 1,000 permutations.
# CrossNN(smokingDist, 1:150, perm=1000)
}

