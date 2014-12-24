#'
#' @title
#' Splits text into sentences.
#'
#' @description
#' Splits text into 1 or more sentences based on sentence boundaries. Sentence
#' boundaries are demarcated by 1 or more period (.), exclam (!), or question
#' mark (?).
#'
#' @param The raw text to split on sentence boundaries.
#' @return A character vector containing 1 or more sentences.
#'
#' @export
#'
split_by_sentence <- function (text) {

  # split based on periods, exclams or question marks
  result <- unlist (strsplit (text, split = "[\\.!?]+"))

  # do not return empty strings
  result <- stri_trim_both (result)
  result <- result [nchar (result) > 0]

  # ensure that something is always returned
  if (length (result) == 0)
      result <- ""

  return (result)
}
