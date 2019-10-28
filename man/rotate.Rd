\name{rotate}
\alias{rotate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Rotate a set of Cartesian points about a centroid.
}
\description{
This function takes a set of points, x and y, and rotates them by a centroid determined by the centroid function. 
}
\usage{
rotate(x, y, deg = 90, centroid.fun = mean)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
  the x coordinates.
}
  \item{y}{
  the y coordinates.
}
  \item{deg}{
  the degree of rotation specified in degrees (converted internally to radians).
}
  \item{centroid.fun}{
 a function applied to \code{x} and \code{y} that returns a centroid. Defaults to \code{mean}. See details.
}
}
\details{
The centroid function determines the basis by which the coordinates are translated. In general, users will want this to be the mean of x and the mean of y (the default). However, special cases may require different planar orbits or rotations. For example, to set the centroid to the origin (0,0), then set \code{centroid.fun=function(m) m-m}
}
\value{
\item{x.rot}{ new x coordinates.}
\item{y.rot}{ new y coordinates.}

}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Christopher Steven Marcum
}

\examples{
x<-rnorm(10)
y<-rnorm(10)
plot(x,y)
points(rotate(x,y,deg=15))
}
\keyword{ ~misc}
