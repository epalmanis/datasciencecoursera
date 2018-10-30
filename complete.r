  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

complete <- function(directory, id = 1:332) {
semua_file <- list.files(directory, full.names = TRUE)
dat2 <- data.frame()
    
for (i in id) {
      moni_i_test <- read.csv(semua_file[i])
      nobs <- sum(complete.cases(moni_i_test))
      tmp <- data.frame(i, nobs)
      dat2 <- rbind(dat2, tmp)
    }
    
    colnames(dat2) <- c("id", "nobs")
    dat2
}

