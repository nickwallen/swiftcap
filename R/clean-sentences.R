#'
#' @title
#' Cleans sentences used as input to the model.
#'
#' @description
#' Performs pre-processing on text input that has been already been split
#' into sentences.  Each element of the character vector input should
#' denote a single sentence.
#'
#' @param sentences The sentences to pre-process.
#' @param start_tag The tag used to mark the beginning of a sentence.
#' @param end_tag The tag used to mark the end of a sentence.
#' @return A vector of cleaned, pre-processed sentences.
#'
#' @export
#'
clean_sentences <- function (sentences, start_tag = "^", end_tag = "$") {

    # sanity checks
    stopifnot (is.character (sentences))
    stopifnot (length (sentences) > 0)

    # lower case
    sentences <- stri_trans_tolower (sentences)

    # remove anything that is not alpha, numeric, whitespace or ' (for contractions)
    sentences <- stri_replace_all_regex (sentences, "[^A-Za-z0-9 ']+", " ")

    # replace all digits with a simple indicator flag
    sentences <- stri_replace_all_regex (sentences, "[[:digit:]]+", "###")

    # add starting/ending tag to each sentence
    sentences <- stri_paste (start_tag, sentences, end_tag, sep = " ")

    # trim whitespace
    sentences <- stri_trim_both (sentences)

    return (sentences)
}
