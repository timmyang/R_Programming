complete <-
function(directory, id = 1:332) {
        # Setting working directory
        setwd(paste("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data", directory, sep = "/"))
        
        # Reading files from the given id range
        df <- data.frame()
        
        for(i in id) {
                if(i < 10) {
                        x <- data.frame(read.csv(paste("00", i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        df <- rbind(df, c(i, s))
                }
                else if(i < 100) {
                        x <- data.frame(read.csv(paste("0", i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        df <- rbind(df, c(i, s))
                }
                else {
                        x <- data.frame(read.csv(paste(i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        df <- rbind(df, c(i, s))
                }
        }
        
        names(df) <- c("id", "nobs")
        
        # Return the dataframe
        df
}
