library(halftoner)
library(imager)
library(dplyr)
library(tibble)
library(ggplot2)

# source <- BLAH # path to source image
# output <- BLAH # path to output image

# dimensions of desired output
pixels_wide <- 3237
pixels_high <- 4713


# import image file as tibble (could probably be cleaner)
read_halftone <- function(source, ...) {
  
  image <- load.image(file = source)
  array <- as.array(image)
  array <- array[,,1,]
  
  htone <- halftone(array, ...)
  htone <- tibble(
    x = htone[[1]][,2],
    y = htone[[1]][,1],
    s = htone[[2]]
  )
  
  return(htone)
}

# construct ggplot 
draw_halftone <- function(data, threshold = .2, scaling = 1) {

  data <- data %>% filter(s > threshold)
  
  pic <- ggplot(data) + 
    geom_point(
      mapping = aes(x,y, size = s * scaling),
      show.legend = FALSE
    ) + 
    scale_x_reverse(name = NULL, expand = c(0,0), breaks = NULL) + 
    scale_y_reverse(name = NULL, expand = c(0,0), breaks = NULL) + 
    scale_size_identity() + 
    theme_void()
  
  return(pic)
}


# write image to file
save_halftone <- function(plot, file, pixels_wide, pixels_high) {
  ggsave(
    filename = file,
    plot = plot,
    width = pixels_wide / 300,
    height = pixels_high / 300,
    dpi = 300
  )  
}



# processing pipeline
source %>% 
  read_halftone() %>% 
  draw_halftone(threshold = .2, scaling = 5) %>%
  save_halftone(
    file = output, 
    pixels_wide = pixels_wide,
    pixels_high = pixels_high
  )

