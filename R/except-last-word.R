#'
#' @title
#' Excludes the last word from a phrase of text.
#'
#' @description
#' Given a phrase of text the function will return all words except the
#' last word within the phrase.
#'
#' @param text The phrase containing words.
#' @return A character vector containing 1 or more words.
#'
#' @export
#'
except_last_word <- function (text) {

    stopifnot (is.character (text))
    stopifnot (length (text) == 1)

    # split the phrase into separate words
    words <- split_by_word (text)

    # exclude the last word
    except_last <- words [1:length (words)-1]

    # paste the words back together
    paste (except_last, collapse = " ")
}
