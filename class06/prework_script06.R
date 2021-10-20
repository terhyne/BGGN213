# class 6 pre-work

# how to write a function: name <- function(arguments) {body}
# example (add)
add <- function(x, y=1) {x + y}
# notice that function gets added to the right with variables
add(4)
add(4,3)
# only need to specify x for this function. y=1 unless otherwise stated.
add(c(1,2,5,10), y=10)
# can add vectors too
add(10, 20, 30)
# function only has 2 inputs -> error
add(10, "string")
# function only works with numeric inputs -> error
# strategy for writing function: take code snippet and simplify (look for what's common)
# example (rescale)
rescale <- function(x) 
{rng <- range(x)
  (x-rng[1]) / (rng[2]-rng[1])}
# this says "a number minus the minimum divided by the range"
# test on a simple example (1:10)
rescale(1:10)
# try a dataset (with one NA)
rescale(c(1, 10, 40, NA, 20))
# want the function to give values for all the #s, but it gives NA 5X -> fix
# the "problem" is coming from range -> ?range for help -> argue
range(c(1, 10, 40, NA, 20), na.rm = TRUE)
rescale2 <- function(x) 
{rng <- range(x, na.rm=TRUE)
(x-rng[1]) / (rng[2]-rng[1])}
# test
rescale2(c(1, 10, 40, NA, 20))
# it works now! to use rescale function in the future, must save as script!

# install packages from CRAN and Bioconductor (repositories for R packages)
# CRAN = install.packages("")
# Bioconductor = BiocManager::install("")
# install BiocManager (CRAN), and then Bioconductor core packages 
install.packages("BiocManager")
BiocManager::install()
# learn about packages / how to use with vignettes!

# RMarkdown demo
# combines code, output, and regular text into one website/report