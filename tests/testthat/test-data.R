test_that("data", {
  data(AraMetLeaves)
  data(AraMetRoots)

  # class
  expect_identical(class(AraMetLeaves), c("matrix", "array"))
  expect_identical(class(AraMetRoots), c("matrix", "array"))
  
  # dimension
  expect_equal(dim(AraMetLeaves), c(59, 50))
  expect_equal(dim(AraMetRoots), c(59, 53))  
  
  # colnames
  expect_identical(colnames(AraMetLeaves)[1], "Col0.1")
  expect_identical(colnames(AraMetLeaves)[50], "mto1.13")
})

