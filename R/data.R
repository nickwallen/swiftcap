#' @title
#' Basic N-Gram Model
#'
#' @description
#' An N-Gram language model that uses the Katz Back-off Algorithm across trigram,
#' bigram and unigram sub-models.
#'
#' @details
#' The model was built on a 75% random sample of a large data set of text culled
#' from Twitter, online blogs, and news articles.  All n-grams occurring less
#' than 3 times were removed and only the top 5 suggestions for each context
#' have been retained.
#'
"model"

#' @title
#' Text Corpus Culled from Blogs
#'
#' @description
#' A text corpus containing 18,125 English language blog entries.  These entries
#' contain 52,172 sentences and 766,222 words.
#'
"blogs"

#' @title
#' Text Corpus Culled from News Sources
#'
#' @description
#' A text corpus containing 20,529 English language news stories.  These contain
#' 49,501 sentences and 704,148 words.
#'
"news"

#' @title
#' Text Corpus Culled from Twitter
#'
#' @description
#' A text corpus containing 47,390 tweets created on Twitter.  These contain 84,256
#' sentences and 613,412 words.
"twitter"
