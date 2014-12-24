#'
#' Calculate MLE of N-gram Probability
#'
#' Calculates the maximum liklihood estimate of the probability of any
#' N-gram based on the training corpus.
#'
#'      p (we love you) = count (we love you) / count (we love)
#'      p (we love)     = count (we love)     / count (we)
#'      p (we)          = count (we)          / count (<start-of-sentence>)
#'
#' @param ngrams A data.table containing all contexts in the corpus.
#' @return The maximum liklihood estimate of the probability of each n-gram.
#'
ngram_mle <- function (ngrams) {

    # create a data set that contains the number of times each context occurs in the text
    context <- ngrams [, sum (frequency), by = context]
    setnames (context, c("context", "context_frequency"))

    # through merging of context and ngrams, calculate the probability
    setkeyv (context, "context")
    setkeyv (ngrams, "context")

    # calculate the maximum liklihood estimate
    ngrams [context, p := frequency / context_frequency]
}
