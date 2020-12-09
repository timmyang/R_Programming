corr <-
function(directory, threshold = 0) {
        # Setting working directory
        setwd(paste("/Users/hyeonwooyang/Desktop/Desktop/5_Coursera/1_R_Programming/git_project/data", directory, sep = "/"))
        
        # Reading files from the given id range
        v <- c()
        
        for(i in 1:332) {
                if(i < 10) {
                        x <- data.frame(read.csv(paste("00", i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                                
                        if(s > threshold) {
                                good <- complete.cases(x)
                                c <- cor(x[good, ][, "sulfate"], x[good, ][, "nitrate"])
                                v <- append(v, c)
                        }
                }
                else if(i < 100) {
                        x <- data.frame(read.csv(paste("0", i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        
                        if(s > threshold) {
                                good <- complete.cases(x)
                                c <- cor(x[good, ][, "sulfate"], x[good, ][, "nitrate"])
                                v <- append(v, c)
                        }
                }
                else {
                        x <- data.frame(read.csv(paste(i, ".csv", sep = "")))
                        s <- sum(complete.cases(x))
                        
                        if(s > threshold) {
                                good <- complete.cases(x)
                                c <- cor(x[good, ][, "sulfate"], x[good, ][, "nitrate"])
                                v <- append(v, c)
                        }
                }
        }

        # Return a numeric vector of correlations
        v
}
