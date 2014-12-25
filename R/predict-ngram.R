#'
#' @title
#' Prediction with N-Gram Language Models
#'
#' @description
#' Predicts the next most likely word using an N-Gram language model.
#'
#' @param object The N-gram model to use for prediction.
#' @param newdata A phrase to predict the next word for.
#' @param rank The top 'rank' most likely words are returned.
#' @return The next mostly likely word(s).
#' @export
#'
#' @examples
#' \dontrun{
#' data (blogs)
#' fit <- ngram (blogs)
#' predict (fit, "What")
#' }
#'
predict.ngram <- function (object, newdata, rank = 5) {
    phrase <- newdata

    # sanity checks
    stopifnot (is.character (phrase))
    stopifnot (length (phrase) == 1)
    stopifnot (is.numeric (rank))

    # clean and split the input phrase
    words <- split_by_word (clean_sentences (split_by_sentence (phrase)))

    # HACK only remove the 'end of sentence marker' if the phrase
    # did not end with a period.  currently difficult to tell if
    # the phrase has an explicit sentence ending or if the clean_sentences
    # function is assuming there should be one.
    if (!stri_detect (phrase, regex = ".*[\\.!?][[:blank:]]*$"))
        words <- head (words, -1)

    predictions <- NULL
    for (n in sort (object$N, decreasing = TRUE)) {

        # ensure there are enough previous words
        # for example, a trigram ngrams needs 2 previous words
        if (length (words) >= n-1) {

            # grab the necessary context; last 'n-1' words
            ctx <- paste (tail (words, n-1), collapse = " ")

            # find matching context in the model
            predictions <- object$ngrams [ context == ctx, list (word, p, n, rank)]
            if (nrow (predictions) > 0) {

                # basic translations
                # TODO ugly; should handle in a better way
                predictions [word == "$", word := "."]
                predictions [word == "###", word := NA]

                # exclude any missing predictions
                predictions <- predictions [complete.cases (predictions)]

                # only keep the top 'rank' predictions
                predictions <- predictions [rank <= rank]

                break
            }
        }
    }

    return (predictions)
}
