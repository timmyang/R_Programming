pollutantmean <-
function(directory, pollutant, id = 1:332) {
        # Setting working directory
        setwd(paste("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data", directory, sep = "/"))
        
        # Reading files from the given id range
        df <- data.frame()
        for(i in id) {
                if(i < 10) {
                        x <- data.frame(read.csv(paste("00", i, ".csv", sep = "")))
                        df <- rbind(df, x)
                }
                else if(i < 100) {
                        x <- data.frame(read.csv(paste("0", i, ".csv", sep = "")))
                        df <- rbind(df, x)
                }
                else {
                        x <- data.frame(read.csv(paste(i, ".csv", sep = "")))
                        df <- rbind(df, x)
                }
        }
        
        # Which pollutant? sulfate or nitrate?
        mean(df[, pollutant], na.rm = TRUE)
}
