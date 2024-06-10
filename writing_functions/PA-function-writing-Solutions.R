divide_and_round <- function(nums){
  
  my_min <- min(nums, na.rm = TRUE)
  divided <- nums/my_min
  rounded <- round(divided)
  
  rounded
  
}

no_nines_or_twelves <- function(nums){
  
  check <- !(nums %% 9 == 0 | nums %% 12 == 0)
  
  check
  
}


shorten <- function(vec){
  
  while(sum(vec) >= 350){
    
     vec <- vec[-1]
     
  }
  
  vec
  
}


every_other <- function(vec, start = 1){
  
  new_vec <- c()
  
  if(start == 2){
    
    vec <- vec[-1]
    
  }
  
  for(i in 1:length(vec)){
    
    if(i %% 2 != 0){
      
      new_vec <- c(new_vec, vec[i])
      
    }
    
  }
  
  new_vec
  
}

