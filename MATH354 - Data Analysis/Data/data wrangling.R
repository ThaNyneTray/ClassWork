storms %>%
  mutate(ratio = pressure/wind) %>%
  select(name, ratio)

pollution %>% 
  group_by(city) %>% 
  summarise(mean=mean(amount), median=median(amount), n=n())
