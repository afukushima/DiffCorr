test_that("AraMetLeaves dataset is loaded correctly", {
  expect_true(exists("AraMetLeaves"))
  expect_true(is.matrix(AraMetLeaves))
  expect_equal(nrow(AraMetLeaves), 59)  # 59 metabolites
  expect_equal(ncol(AraMetLeaves), 50)  # 50 samples (WT, tt4, and mto1)
  expect_equal(sum(is.na(AraMetLeaves)), 0)
  expect_equal(colnames(AraMetLeaves)[1], "Col0.1")
  expect_equal(colnames(AraMetLeaves)[50], "mto1.13")
})

test_that("AraMetRoots dataset is loaded correctly", {
  expect_true(exists("AraMetRoots"))
  expect_true(is.matrix(AraMetRoots))
  expect_equal(nrow(AraMetRoots), 59)  # 59 metabolites
  expect_equal(ncol(AraMetRoots), 53)  # 53 samples (WT, tt4, and mto1)
  expect_equal(sum(is.na(AraMetRoots)), 0)
  expect_equal(colnames(AraMetRoots)[9], "Col0.9")
  expect_equal(colnames(AraMetRoots)[53], "mto1.16")
})