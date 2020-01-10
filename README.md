# halftoner
An R-package for generating halftone graphics.

Halftone is a [reprographic technique](https://en.wikipedia.org/wiki/Halftone) that uses various sized and spaced dots to represent continuous tone gradients. It is the basis of color offset printing and predominantly used in CMYK colorspace applications.

# Changelog
This changelog reports all noteable updates to the package.

## [0.5] - 2019-28-10
### Initial commit
## [0.5.1] - 2019-30-10
### Changed
 - Revised to use S3 methods only from a suggestion by Michal B.
 - Added warning for inconsistent dimensional sampling in halftone().
 - Added a method to halftone() called 'none'.
 - halftone() now returns grid dimensionality as an attribute. 
### Removed
 - Dependency on methods has been removed
## [0.5.2] - 2019-23-12
### Changed
 - Fixed typos in the documentation.
 ### Added
 - Added dependency on R>=3.5

# Future updates
 - Revise thresholding to simply reduce pixel intensity to 0
 - Revise thresholding to take place after inversion, but before downsampling
 - Add K-channel functionality to preserve consistent downsampling across all channels
 - Implement spatial sampling routine (k-neighbors on a lattice) 
 - Implement Bernoulli sampling routine (p propto pixel intensity)
 - Revise default dimensionality to always be proportional to input dimensions in x and y
 - Provide new S3 method for rotate()
