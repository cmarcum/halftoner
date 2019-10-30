\name{halftoner-package}
\alias{halftoner-package}
\alias{halftoner}
\docType{package}
\title{
\packageTitle{halftoner}
}
\description{
\packageDescription{halftoner}
}
\details{
\packageDESCRIPTION{halftoner}
\packageIndices{halftoner}
}
\author{
\packageAuthor{halftoner}

Maintainer: \packageMaintainer{halftoner}
}
\keyword{ package }
\examples{
data(calfs)
plot(halftone(calfs))

plot(halftone(calfs,channel=1),pch=19,col="red")
points(halftone(calfs,channel=2),pch=19,col="green")
points(halftone(calfs,channel=3),pch=19,col="blue")

plot(halftone(apply(calfs,1:2,mean),x.samp=90,y.samp=90),pch="\u2605",col="red")
points(halftone(apply(calfs,1:2,mean),deg=-5),pch="\u2605",col="blue")

}
