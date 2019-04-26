lower_case <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")

upper_case <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")

punctuation <- c(".", ",", "!", "?", "'", '"', "(", ")", " ", "-", ";", ":")

my_symbols <- list(lower_case, upper_case, punctuation)


library(readr)
jb <- read_file("./Base_R/Text")
jb <- gsub("\r", "", jb)
jb <- gsub("\n", "", jb)
jb <- as.vector(jb)

jb <- unlist(str_split(jb, ""))


is_lower <- jb %in% lower_case
is_upper <- jb %in% upper_case
is_punct <- jb %in% punctuation

sum(is_lower | is_upper | is_punct)
jb[!(is_lower | is_upper | is_punct)]

####

my_symbols <- c(lower_case, upper_case, punctuation)
my_symbols <- data.frame(my_symbols)
names(my_symbols) = "Symbol"
my_symbols$Num <- 1:length(my_symbols$Symbol)

####

library(tidyverse)

jb = data.frame(jb)
names(jb) = "Symbol"

soln_orig <- jb %>% left_join(my_symbols) %>% pull(Num)

soln <- soln_orig

sum(soln %% 2 == 0)

soln[soln == 20] <- 39
soln[38:465] <- soln[38:465]^2

soln <- matrix(soln, ncol = 5)
soln[,4:5] <- soln[,4:5]/2
soln[18:24, 3] <- soln[18:24, 3] + 100
soln[,1] <- soln[,1] + (1:191)*2
soln <- c(soln)

sum(soln < 17)

soln <- sqrt(soln)
soln <- log(soln)
soln <- (soln + 257)/18
soln <- soln - 14

write.csv(soln, "./Base_R/Secret_Code_2", row.names = FALSE)

## Reverse, reverse

soln <- soln + 14
soln <- soln*18 - 257
soln <- exp(soln)
soln <- soln^2

sum(soln < 17)

soln <-  matrix(soln, ncol = 5)
soln[,1] <- soln[,1] - (1:191)*2
soln[18:24, 3] <- soln[18:24, 3] - 100
soln[,4:5] <- soln[,4:5]*2
soln <- c(soln)

sum(soln[500:955] > 50)

soln[38:465] <- sqrt(soln[38:465])

soln <- round(soln)

soln[soln == 39] <- 20
