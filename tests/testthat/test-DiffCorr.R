test_that("comp.2.cc.fdr basic functionality", {
    data(AraMetLeaves)
    res <- comp.2.cc.fdr(output.file = "Met_DiffCorr_res.txt", 
                     log10(AraMetLeaves[, 1:17]),   ## Col-0 (17 samples)
                     log10(AraMetLeaves[, 18:37]),  ## tt4 (20 samples)
                     method = "pearson",
                     threshold = 1.0, save = FALSE)

    expect_true(is.data.frame(res))
    expect_true(all(c("molecule X", "molecule Y", "r1", "p1", "r2", "p2", "p (difference)", 
                    "(r1-r2)", "lfdr (in cond. 1)", "lfdr (in cond. 2)", "lfdr (difference)") %in% colnames(res)))
    
    # relationship between malate and Thr
    res2 <- res[res$`molecule X` == "Malate" & res$`molecule Y` == "Threonine", ]
    expect_equal(res2$r1, 0.765864054338824)
})

test_that("cluster.molecule()", {
    # Col-0 (17 samples)
    hc.mol1 <- cluster.molecule(AraMetLeaves[, 1:17], "pearson", "average")
    # tt4 mutant (20 samples)
    hc.mol2 <- cluster.molecule(AraMetLeaves[, 18:37], "pearson", "average")
    
    # class
    expect_identical(class(hc.mol1), "hclust")
    expect_identical(class(hc.mol2), "hclust")
    
    # method
    expect_identical(hc.mol1$method, "average")
    expect_identical(hc.mol2$method, "average")
    
    # order
    expect_equal(head(hc.mol1$order), c(33, 59, 40, 27, 39, 53))
    expect_equal(head(hc.mol2$order), c(26, 27, 39, 59, 15, 33))    
    
    # height
    expect_equal(hc.mol1$height[1], 0.0268457955035175)
    expect_equal(hc.mol1$height[8], 0.0639511219472022)    
    expect_equal(hc.mol2$height[1], 0.0214197534705823)
    expect_equal(hc.mol2$height[8], 0.0368260078562662)
})

test_that("get.eigen.molecule()", {
    # with Golub data
    library(pcaMethods)
    data(golub, package = "multtest")
    hc.mol1 <- cluster.molecule(golub[1:100, 1:27], "pearson", "average")
    # cutting tree
    g1 <- cutree(hc.mol1, h = 0.6)
    res1 <- get.eigen.molecule(golub[1:100,], g1)
    ##
    expect_equal(as.integer(g1[85]), 33)
    expect_equal(res1$group, 13)
    expect_equal(res1$N, 18)
})

test_that("DiffCorr works0", {
    res_compcorr <- compcorr(10, 0.1, 10, 0.9)
    expect_identical(class(res_compcorr), "list")
    expect_equal(res_compcorr$diff, -2.56656021657955)
})

test_that("cor.dist()", {
    res_cor.dist <- cor.dist(as.matrix(t(iris[, 1:4])))
    expect_identical(class(res_cor.dist), c("matrix", "array"))
    expect_equal(res_cor.dist[1, 2], 1.117569784133)
})

test_that("cor2.test()", {
    res_cor2.test <- cor2.test(30, 0.6)
    expect_equal(res_cor2.test, 0.000457055239405078)
})

test_that("generate_g()", {
    library(igraph)
    set.seed(1234)
    mat <- matrix(runif(100), nr=10)
    rownames(mat) <- as.character(1:10)
    g <- generate_g(mat)
    expect_identical(class(g), "igraph")
    expect_identical(as.character(V(g)[.nei(2)]), "8")
})

test_that("get.eigen.molecule.graph()", {
    hc.mol1 <- cluster.molecule(golub[, 1:27], "pearson", "average")
    g1 <- cutree(hc.mol1, h=0.4)
    res1 <- get.eigen.molecule(golub, g1)
    g1.eigen <- get.eigen.molecule.graph(res1)
    expect_identical(class(g1.eigen), "igraph")
    expect_equal(length(V(g1.eigen)), 29)
    expect_equal(length(E(g1.eigen)), 31)
})

test_that("get.lfdr()", {
    library("fdrtool")
    data(pvalues)
    dev.new()
    res <- get.lfdr(pvalues)
    expect_identical(class(res), "list")
    expect_equal(head(res$lfdr)[1], 0.649926998163217)
})

test_that("get.min.max()", {
    res <- get.min.max(iris[,1:2])
    expect_equal(res$max, 7.9)
    expect_equal(res$min, 2)
})

test_that("scalingMethods()", {
    res <- scalingMethods(iris[,1:4], "level")
    expect_equal(dim(res), c(150, 4))
    expect_equal(res[150, 1], 0.493670886075949)
})

test_that("uncent.cor2dist() ", {
    res <- uncent.cor2dist(as.matrix(t(iris[,1:4])), 1) 
    expect_identical(class(res), "numeric")
    expect_equal(as.character(res[2]), "0.021986797478038", tolerance = 1E-5)
})

test_that("uncent.cordist()", {
    res <- uncent.cordist(as.matrix(t(iris[,1:4]))) 
    expect_identical(class(res), c("matrix", "array"))
    expect_equal(res[1, 2], 0.0219867974780388)
})