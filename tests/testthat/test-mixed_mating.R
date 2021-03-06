context("mixed_mating.R")

test_that( "testing",{
  AA <- locus( c("A","A") )
  AB <- locus( c("A","B") )
  loci <- c(AA,AB) 
  momID <- c("A","B") 
  df <- data.frame( ID=factor(momID), TPI=loci )
  
  expect_that( mixed_mating(), throws_error())
  
  o <- mixed_mating(df, s=0)
  expect_that( o , is_a("data.frame") )
  expect_that( names(o), is_equivalent_to( c("ID","TPI")))
  expect_that( nrow(o), equals(2) )
  
  o <- mixed_mating(df[1,], s=1, N=10)
  expect_that( nrow(o), equals(10) )
  expect_that( names(o), is_equivalent_to( c("ID","TPI")))
  
  expect_true( sum( is_heterozygote(o$TPI))==0 )
  
})
