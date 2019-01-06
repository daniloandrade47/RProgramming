pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
  
  #path to the specdata directory
  directory <- ("./specdata/")

  # listing directory files
  listing_files <- list.files(directory)
  # defining the path of each file, preparing for the loop
  path_files <- paste(directory, listing_files, sep="")

  # loop that will read all 332 files
 for (i in id) {
  read_files <- read.csv(path_files[i], header = T, sep = ",")
 
  # ignoring the NA values to calculate the mean
  pollutant_na_remove <- read_files[!is.na(read_files[,pollutant]), pollutant]
  mean_vector <- c(mean_vector,pollutant_na_remove)
 }
  # writes the loop results to a vector of averages
  result <- mean(mean_vector)
  return(round(result,3))
}

# checking if the data output corresponds to the request
pollutantmean("specdata", "sulfate", 1:10) == 4.064
pollutantmean("specdata", "nitrate", 70:72) == 1.706
pollutantmean("specdata", "nitrate", 23) == 1.281
