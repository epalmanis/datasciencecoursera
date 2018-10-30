
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  corr <- function(directory, threshold = 0) {
    semua_file <- list.files(directory, full.names = TRUE)
    dat2 <- vector(mode = "numeric", length = 0)
    
    for (i in 1:length(semua_file)) {
      moni_i_test <- read.csv(semua_file[i])
      csum <- sum((!is.na(moni_i_test$sulfate)) & (!is.na(moni_i_test$nitrate)))
      if (csum > threshold) {
        tmp <- moni_i_test[which(!is.na(moni_i_test$sulfate)), ]
        submoni_i_test <- tmp[which(!is.na(tmp$nitrate)), ]
        dat2 <- c(dat2, cor(submoni_i_test$sulfate, submoni_i_test$nitrate))
      }
    }
    
    dat2
  }
