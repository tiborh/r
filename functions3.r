## testing a function:
test_function <- function(number) {
    if (number < 10) {
        if (number < 5) {
            result <- "extra small"
        } else {
            result <- "small"
        }
    } else if (number < 100) {
        result <- "medium"
    } else {
        result <- "large"
    }
    return(result)
}

test_function(5)                        # 1
test_function(100)                      # 2
test_function(4)                        # 3
test_function(2500)                     # 4
