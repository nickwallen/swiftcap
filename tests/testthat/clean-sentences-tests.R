
library (swiftcap)
context ("clean_sentences")

clean_sentences0 <- function (x) clean_sentences (x, start_tag = "", end_tag = "")

test_that ("sentence boundaries should be marked", {
    expect_equal (clean_sentences ("a test sentence"), "^ a test sentence $")
    expect_equal (clean_sentences (c ("first", "second")), c("^ first $", "^ second $"))
})

test_that ("all text input should be lower cased", {
    expect_equal (clean_sentences0 ("LOWER CASE"), "lower case")
    expect_equal (clean_sentences0 ("lower CAse"), "lower case")
})

test_that ("all numbers are replaced with ###", {
    expect_equal (clean_sentences0 ("foo123456"), "foo###")
    expect_equal (clean_sentences0 ("123 million"), "### million")
    expect_equal (clean_sentences0 ("the 1980s"), "the ###s")
})

test_that ("all punctuation is removed", {
    expect_equal (clean_sentences0 ("!punc-tu-ation"), "punc tu ation")
    expect_equal (clean_sentences0 ("fee-fi-fo-fum"), "fee fi fo fum")
    expect_equal (clean_sentences0 ("....periods..."), "periods")
    expect_equal (clean_sentences0 ("?question?"), "question")
})

test_that ("trim leading and trailing whitespace", {
    expect_equal (clean_sentences0 ("  trim whitespace"), "trim whitespace" )
    expect_equal (clean_sentences0 ("trim whitespace   "), "trim whitespace" )
    expect_equal (clean_sentences0 ("  trim whitespace   "), "trim whitespace" )
})

test_that ("contractions should not be disturbed", {
    expect_equal (clean_sentences0 ("don't"), "don't")
    expect_equal (clean_sentences0 ("it's"), "it's")
    expect_equal (clean_sentences0 ("he'll"), "he'll")
})

test_that ("sanity checks occur", {
    expect_error (clean_sentences0 (c()))
    expect_error (clean_sentences0 (list ("sentence1","sentence2")))
})
