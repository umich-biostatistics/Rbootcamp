#install.packages("dplyr")
library(dplyr)
#install.packages("nycflights13") 
library(nycflights13)


flights

# filter
filter(flights, dest=="DTW" & month==6)

# select
select(flights, dep_time, arr_time, carrier)
select(flights, -year, -tailnum)
select(flights, month:dep_delay)

select(flights, starts_with("d"))
select(flights, ends_with("time"))
select(flights, contains("arr"))
select(flights, -starts_with("d"))
select(flights, flight, everything())

# composition
filtered <- filter(flights, dest=="DTW")
select(filtered, carrier)
select(filter(flights, dest=="DTW"), carrier)
flights %>% filter(dest=="DTW") %>% select(carrier)

# Sort data
flights %>% arrange(sched_dep_time)
flights %>% arrange(month, desc(day))
flights %>% arrange(desc(dep_time-sched_dep_time ))

# Mutate

flights %>% 
  mutate(speed = distance/(air_time/60)) %>%
  arrange(desc(speed)) %>%
  select(flight, speed)

flights %>% mutate(
  dist_km = distance * 1.61, 
  hours = air_time / 60, 
  kph = dist_km/hours ) %>%
  select(flight, kph)

# summarize
flights %>% 
  filter(!is.na(arr_delay)) %>% 
  summarize(avg_arr_delay = mean(arr_delay))

# Group by + summarize

flights %>% 
  filter(!is.na(arr_delay)) %>% 
  group_by(carrier) %>% 
  summarize(avg_arr_delay = mean(arr_delay))

# group by + muatate

flights %>% 
  filter(!is.na(arr_delay)) %>% 
  group_by(carrier) %>% 
  mutate(avg_arr_delay = mean(arr_delay)) %>% 
  select(carrier, arr_delay, avg_arr_delay)


# merge data

flights %>% 
  filter(!is.na(arr_delay)) %>% 
  group_by(carrier) %>% 
  summarize(avg_arr_delay = mean(arr_delay)) %>%
  left_join(airlines)

# join on

flights %>% inner_join(planes) %>% nrow
flights %>% inner_join(planes, "tailnum") %>% nrow

# subsetting

flights %>% distinct(tailnum, carrier)
flights %>% sample_n(3)
flights %>% slice(4:6)

# transformation
flights %>% count(carrier)
flights %>% summarize_at(vars(ends_with("time")), mean, na.rm=T)

# other useful function
x<-1:5; x; lead(x); lag(x)
coalesce(c(NA,2,NA), c(1, NA, NA), 3)	
flights %>% 
  group_by(tailnum) %>% 
  summarize(flights=n(), routes=n_distinct(flight))
recode(letters[1:5], b="boo")
x <- 1:50
case_when(
  x %% 35 == 0 ~ "fizz buzz",
  x %% 5 == 0 ~ "fizz",
  x %% 7 == 0 ~ "buzz",
  TRUE ~ as.character(x)
)






















