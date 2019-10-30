\name{halftone}
\alias{halftone}
\title{Halftone an input image.
}
\description{
Generates down-sampled coordinates from a base image supplied as a matrix or array for plotting.
}
\usage{
halftone(img, channel = 1, x.samp = 100, y.samp = 100, deg = 0, 
         invert = FALSE, thresh = 0, seed = 1852, method = "seq")
}
\arguments{
  \item{img}{a matrix or array with at least 2 dimensions.}
  \item{channel}{which channel of the \code{img} should be down-sampled?
}
  \item{x.samp}{x-coordinate units to downsample. See details.
}
  \item{y.samp}{y-coordinate units to downsample. See details.
}
  \item{deg}{degrees to rotate points by after downsampling. Defaults to 0.
}
  \item{invert}{recode channel value? Defaults to FALSE.
}
  \item{thresh}{clipping threshold of channel value. Defaults to none.
}
  \item{seed}{set a random seed for \code{method=samp}.
}
  \item{method}{Method of downsampling. See details.
}
}
\details{
If method="samp" then the x.samp argument determines the number of resulting rows (x-coordinates) in the plotting grid. However, if the sequence method is used, then this number results in a number proportional to the original order of the x-dimension of img.

If method="samp" then the y.samp argument determines the number of resulting cols (y-coordinates) in the plotting grid. However, if the sequence method is used, then this number results in a number proportional to the original order of the y-dimension of img.

If method is set to "seq" then a number of proportional rows and columns are removed uniformaly until the desired down sampling is attained. If set to "samp" then the downsampling is done using a random uniform reduciton of rows without respect to columns. The latter can result in high deviations from original image.

If method is set to "none" then no downsampling is done. Note that the plotting routine can take a very long time for large dimensional images under this method since every 'pixel' is represented by a point on the grid. However, this may be useful for rendering simple graphics (i.e., clipart, line art) with a transparent element and for rendering large dimensional output.
}
\value{
Returns an object of class 'halftone' with two elements:
\item{x[[1]]}{a two-column matrix containing the coordinates for plotting.}
\item{x[[2]]}{a vector of point values.}

}
\author{
Christopher Steven Marcum
}

\examples{
data(calfs)
htc<-halftone(calfs)
plot(htc)
}
