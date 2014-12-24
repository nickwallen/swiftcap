#
# prepares the news data to be packaged
#

p <- 0.02
data_path <- "data-raw"

# unzip the text file
zip <- file.path (data_path, "blogs.zip")
unzip (zip, exdir = data_path)

# load the text
txt <- file.path (data_path, "blogs.txt")
blogs <- readLines (txt)

# sample the text
index <- as.logical (rbinom (n = length (blogs), size = 1, prob = p))
blogs <- blogs [index]

# persist the blogs data for use within the package
devtools::use_data (blogs, overwrite = TRUE)

# remove the txt file
if (file.exists (txt))
    file.remove (txt)
