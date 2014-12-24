library (swiftcap)
context ("split_by_sentence")

test_that ("sentences are split on periods", {
    expect_equal (length (split_by_sentence ("first sentence. second sentence.")), 2)
    expect_equal (length (split_by_sentence ("first sentence...  second sentence...")), 2)
    expect_equal (length (split_by_sentence ("   first sentence.    second sentence.   ")), 2)
})

test_that ("sentences are split on exclams", {
    expect_equal (length (split_by_sentence ("first sentence! second sentence!")), 2)
    expect_equal (length (split_by_sentence ("first sentence!!!  second sentence!!!")), 2)
    expect_equal (length (split_by_sentence ("   first sentence!    second sentence!   ")), 2)
})

test_that ("sentences are split on questions", {
    expect_equal (length (split_by_sentence ("first sentence? second sentence?")), 2)
    expect_equal (length (split_by_sentence ("first sentence???  second sentence???")), 2)
    expect_equal (length (split_by_sentence ("   first sentence?    second sentence?   ")), 2)
})
