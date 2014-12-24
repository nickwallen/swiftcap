#
#' @title
#' Splits sentences into N-grams.
#'
#' @description
#' Splits a vector of sentences into N-grams.  The function accepts a range
#' of N values over which to create the N-grams.
#'
#' @param sentences The sentences to split into n-grams.
#' @param minN The minimum value of N defining the order of N-grams to create.
#' @param maxN The maximum value of N defining the order of N-grams to create.
#' @param delimiters The delimiters used to split the sentences into words.
#' @return A data.table containing n-grams.
#'
#' @export
#'
split_by_ngram <- function (sentences, minN, maxN, delimiters) {

    # sanity checks
    stopifnot (is.character (sentences))
    stopifnot (is.numeric (minN))
    stopifnot (is.numeric (maxN))
    stopifnot (is.character (delimiters))

    # create a tokenizer
    ctl <- RWeka::Weka_control(min = minN, max = maxN, delimiters = delimiters)
    tok <- function(x) RWeka::NGramTokenizer (x, ctl)

    # split the sentences into n-grams
    ngrams <- data.table (phrase = unlist (lapply (sentences, tok)))
}
