rankhospital <-
function(state, outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        a <- split(data, data[, "State"])
        
        ## Check that state and outcome are valid
        if (!state %in% names(a)) {
                return(paste("Error in best(", state, ", ", outcome, ") : invalid state", sep = ""))
                # stop(paste("Error in best(", state, ", ", outcome, ") : invalid state", sep = ""))
        }
        else if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
                return(paste("Error in best(", state, ", ", outcome, ") : invalid outcome", sep = ""))
                # stop(paste("Error in best(", state, ", ", outcome, ") : invalid outcome", sep = ""))
        }
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        b <- a[[state]]
        
        x <- b[, "Hospital.Name"]
        
        if (outcome == "heart attack") {
                c <- 11
        }
        else if (outcome == "heart failure") {
                c <- 17
        }
        else {
                c <- 23
        }
        y <- as.numeric(b[, c])

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
}
