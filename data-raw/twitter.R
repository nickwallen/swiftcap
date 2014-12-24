#
# prepares the twitter data to be packaged
#

p <- 0.02
data_path <- "data-raw"

# unzip the text file
zip <- file.path (data_path, "twitter.zip")
unzip (zip, exdir = data_path)

# load the text
txt <- file.path (data_path, "twitter.txt")
twitter <- readLines (txt, skipNul = TRUE)

# sample the text
index <- as.logical (rbinom (n = length (twitter), size = 1, prob = p))
twitter <- twitter [index]

# persist the twitter data for use within the package
devtools::use_data (twitter, overwrite = TRUE)

# remove the txt file
if (file.exists (txt))
    file.remove (txt)
