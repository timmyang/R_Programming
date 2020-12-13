rankall <-
function(outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        a <- split(data, data[, "State"])
        
        ## Check that outcome is valid
        if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
                return(paste("Error in best(", state, ", ", outcome, ") : invalid outcome", sep = ""))
                # stop(paste("Error in best(", state, ", ", outcome, ") : invalid outcome", sep = ""))
        }
        
        ## For each state, find the hospital of the given rank
        if (outcome == "heart attack") {
                c <- 11
        }
        else if (outcome == "heart failure") {
                c <- 17
        }
        else {
                c <- 23
        }
                
        zList <- lapply(a, function(df) {
                        x <- df[, "Hospital.Name"]
                        y <- as.numeric(df[, c])
                
                        combine <- data.frame(x, y)
                        colnames(combine) <- c("Hospital.Name", "Rate")
                
                        good <- complete.cases(x, y)
                        newdata <- combine[good, ]
                
                        order <- newdata[order(newdata[, 2], newdata[, 1]), ]
                        # = newdata[with(newdata, order(y, x)), ]
                
                        order$Rank <- 1:nrow(order)
                
                        if (num == "best") {
                                ans <- unname(order[1, 1])
                        }
                        else if (num == "worst") {
                                ans <- unname(order[nrow(order), 1])
                        }
                        else if (num > nrow(order)) {
                                ans <- NA
                        }
                        else {
                                ans <- unname(order[num, 1])  
                        }
                        return(ans)
                })
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        df2 <- data.frame()
        
        for (i in seq_along(zList)) {
                z <- c(zList[[i]], names(zList[i]))
                df2 <- rbind(df2, z)
        }
        
        colnames(df2) <- c("hospital", "state")
        return(df2)
}
