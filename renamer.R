path <- "..."
setwd(path)
library(tidyverse)
df <- read_csv("all/questionary.csv")

dictor <- "2019.04.06_f_d06"
path <- paste0(path, "/", dictor)

df %>% 
  arrange(word) %>% 
  mutate(pair_id = as.character(pair_id),
         pair_id = ifelse(nchar(pair_id) == 1, paste0("0", pair_id), pair_id),
         file_name = paste0(dictor, "_", pair_id, "_", word, ".wav"),
         file_name = str_replace_all(file_name, "а́", "А"),
         file_name = str_replace_all(file_name, "ы́", "Ы"),
         file_name = str_replace_all(file_name, "о́", "О")) ->
  df

file.rename(paste0(path, "/", list.files(path)),
            paste0(path, "/", df$file_name))
