susp <- read.csv("./suspects_orig.csv")
susp_new <- susp %>% 
  mutate(
    Birthtime = strftime(btimes, format = "%H:%M:%S")
  ) %>%
  select(Name, Birthday, Birthtime, Occupation)
        
        
library(lubridate)
possible_dates <- seq(as.POSIXct('2017/01/01'), as.POSIXct('2017/01/02'), by="10 sec")
btimes <- sample(possible_dates, 221)

write.csv(susp_new, "./suspects.csv", row.names = FALSE)

#### ugh not by bday

possible_dates <- seq(as.POSIXct('2018/01/01'), as.POSIXct('2018/12/01'), by="10 sec")
btimes <- sample(possible_dates, 221)

possible_dates <- seq(as.POSIXct('2018/01/01'), as.POSIXct('2019/01/02'), by="10 sec")
btimes <- sample(possible_dates, 218)

suspects <- read.csv("./suspects.csv") %>% select(Name, Occupation) %>%
  mutate(
    Time.Spotted = btimes
  )

write.csv(suspects, "./suspect_times.csv", row.names = FALSE)
