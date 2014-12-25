library (swiftcap)
context ("split_by_word")

test_that ("words are split on spaces", {
    expect_equal (split_by_word ("word word word"),     rep ("word", 3))
    expect_equal (split_by_word (" word   word word "), rep ("word", 3))
    expect_equal (length (unlist (split_by_word ("you'll you'd we'll"))), 3)
})
