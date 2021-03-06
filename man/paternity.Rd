% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/paternity.R
\name{paternity}
\alias{paternity}
\title{Estimates fractional paternity probability}
\usage{
paternity(
  offspring,
  mother,
  fathers,
  ID = "ID",
  OffID = "OffID",
  strict = FALSE
)
}
\arguments{
\item{offspring}{A particular offspring. Often as a row
from a \code{data.frame} with columns as loci and other 
meta data.}

\item{mother}{The assumed mother of the offspring as a row
from a \code{data.frame} with columns as loci and other 
meta data.}

\item{fathers}{A \code{data.frame} of potential fathers.}

\item{ID}{The name of the column where the dad's adult ID column
is found in the \code{data.frame} of potential fathers.}

\item{OffID}{The name of the column where the offspring ID is 
located.  All offspring from a maternal individual should have
have the same maternal \code{ID} to indicate which mother they
are from but must also have a unique offspring ID.}

\item{strict}{A flag (default=FALSE) to use strict paternity (e.g.,
where only one dad can be the father) versus fractional paternity 
(e.g., where potentially more than one father is assignable but 
whose likelihood is based upon their transition probabilities).}
}
\value{
A \code{data.frame} with indications of paternity by row.  Columns 
 will include ID, OffID, DadID, and potentially Fij.
}
\description{
This function estimates fractional paternity for offspring
 given a set of potential fathers.
}
\examples{
freqs <- c(1/3,1/3,1/3)
loci <- rep( paste("Loc",1:6,sep="-"), each=3)
alleles <- LETTERS[1:3]
f <- data.frame(Locus=loci, Allele=alleles, Frequency=freqs)
f
adults <- make_population(f,N=20)
adults
offs <- mate( adults[1,], adults[2,], N=10)
offs$OffID <- offs$ID
offs$MomID <- adults$ID[1]
paternity( offs, adults[1,], adults )
}
\author{
Rodney J. Dyer \email{rjdyer@vcu.edu}
}
