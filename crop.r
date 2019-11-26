## Batch scale

# Using magick: more examples of image manipulation functions at
# https://cran.r-project.org/web/packages/magick/vignettes/intro.html

rm(list=ls())

library(magick)
library(tidyverse)

# Get a list of all pdf images in a folder of input images
imglist <- list.files(path=paste0(getwd(), "/img_input/"))

# Read all pdf images into a list
cropped_images <- map(imglist, ~image_read_pdf(paste(getwd(), "/img_input/", .x, sep=""))) %>%
  # Perform image manipulation (see example below, or put any valid combination of magick functions here)
  map(~image_scale(.x, "500"))

# Create list of file names to output
output_names <- paste0(1:length(imglist), ".jpg")

# Write images
map2(cropped_images, output_names, ~ image_write(.x, path = paste(getwd(), "/img_output/", .y, sep=""), format = "jpeg"))