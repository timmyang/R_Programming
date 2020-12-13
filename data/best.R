best <-
function(state, outcome) {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        a <- split(data, data[, "State"])
        
        ## Check that state and outcome are valid
        if (!state %in% names(a)) {
                return(paste("Error in best(", state, ", ", outcome, ") : invalid state", sep = ""))
        }
        else if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
                return(paste("Error in best(", state, ", ", outcome, ") : invalid outcome", sep = ""))
        }
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
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

        good <- complete.cases(x, y)
        newdata <- combine[good, ]

        order <- newdata[order(newdata[, 2], newdata[, 1]), ]
        # = newdata[with(newdata, order(y, x)), ]

        ans <- unname(order[1, 1])
        
        return(ans)
}
