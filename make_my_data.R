library(tidyverse)

d <- tibble(length = rnorm(100, 5, 2),
       weight = rnorm(100, 10, 3),
       count = rpois(100, 3),
       prop = runif(100) %>% round(3),
       group = sample(LETTERS, 100, replace = T))



d$length[87] <- paste0(d$length[87], "O")

d$count[39] <- -1

d$prop[90] <- 1.1

d$prop[22] <- paste0(d$prop[22]*100, "%")

write_csv(d, "data/my_data.csv")
