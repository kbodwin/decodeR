library(tidyverse)

cs <- read_file("./general/caesar_speech")

cs_new <- cs %>% 
  str_split("[:blank:]|\r|\n") %>%
  unlist()

cs_new <- cs_new %>%
  str_remove_all("[^A-z]") %>%
  str_to_lower()



shift_letter <- function(letter, num){
  
  this_index <- which(letters == letter)
  new_index <- this_index + num
  
  if(new_index > 26){
    new_index = new_index - 26
  }else if(new_index <= 0){
    new_index = 26 + new_index
  }
  
  letters[new_index]
  
}

caesar <- function(word, num){
  
  letters_in_word <- unlist(str_split(word, ""))
  
  paste0(map_chr(letters_in_word, ~shift_letter(.x, num)), collapse = "")
  
}

caesar("sfzqlov", -23)


cs_encrypted <- map_chr(cs_new, ~caesar(.x, 17))

write.table(cs_encrypted, "./general/message_encrypted.txt", row.names = FALSE)

