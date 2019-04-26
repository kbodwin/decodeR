v <- read_file("./stringr/v_orig.txt")

str_sort(sapply(unlist(str_split(v, " ")), function(x) str_extract(x, "[:alpha:]")))
v %>% str_extract_all("[:alpha:]( |[:punct:])") %>% unlist() %>% sort()

sort(unique(unlist(str_split(v, ""))))
Set.seed(100)

v_new <- v %>% 
  str_split(" ") %>%
  unlist()



v_new <- v_new %>%
  str_replace("^v", "k") %>%
  str_replace("^V", "K") %>%
  str_replace("y$", "b") %>%
  str_replace_all("t", "z") %>%
  str_replace_all("ee", "aa")


rand <- sample(length(v_new), 10)
v_new[rand] = paste0(v_new[rand], "ugh?")
rand <- sample(length(v_new), 10)
v_new[rand] = paste0(v_new[rand], "ugh.")
rand <- sample(length(v_new), 10)
v_new[rand] = paste0(v_new[rand], "ughhhh!")
rand <- sample(length(v_new), 10)
v_new[rand] = paste0("ughhh!",v_new[rand])
rand <- sample(length(v_new), 10)
v_new[rand] = paste0("ughhh?",v_new[rand])

id <- which.max(str_length(v_new))
max(str_length(v_new))

v_new[id] <- paste0(v_new[id], "aoghajdbn")


rand <- sample(length(v_new), 50)
v_new[rand] = paste0(v_new[rand], "   ")
v_new <- v_new %>% str_pad(20)

write.table(v_new, "./stringr/scrambled_message.txt", row.names = FALSE)
