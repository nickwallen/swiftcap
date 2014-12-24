
options (cache_dir = ".ecache")
options (verbose = FALSE)

# where is the data stored?
data_path <- "data-raw"

# unzip the data files, only if necessary
txts <- list.files (path = data_path, pattern = "\\.txt$", recursive = TRUE)
if (length (txts) == 0) {

    zips <- list.files (path = data_path, pattern = "\\.zip$", full.names = TRUE, recursive = TRUE)
    for (zip in zips) unzip (zip, exdir = dirname (zip))
}

# create a corpus from the text input
files <- list.files (data_path, pattern = "\\.txt$", full.names = TRUE)
text <- unlist (lapply (files, readLines, skipNul = TRUE))

# sample the original input
if (sample < 1.0) {
    index <- as.logical (rbinom (n = length (text), size = 1, prob = sample))
    text <- text [index]
}

ngrams <- ecache ({

    # create the ngram model
    ngrams <- ngram (text, N = 1:3, sample = 0.01)


})

# persist the ngram model for internal use within the package
devtools::use_data (ngrams)
