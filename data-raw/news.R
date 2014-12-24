#
# prepares the news data to be packaged
#

p <- 0.02
data_path <- "data-raw"

# unzip the text file
zip <- file.path (data_path, "news.zip")
unzip (zip, exdir = data_path)

# load the text
txt <- file.path (data_path, "news.txt")
news <- readLines (txt)

# sample the text
index <- as.logical (rbinom (n = length (news), size = 1, prob = p))
news <- news [index]

# persist the news data for use within the package
devtools::use_data (news, overwrite = TRUE)

# remove the txt file
if (file.exists (txt))
    file.remove (txt)
