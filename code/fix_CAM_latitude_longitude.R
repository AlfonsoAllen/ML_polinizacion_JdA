library(tidyverse)


sites_CAM_raw <- read_csv("../data/sites_AAP3_RAW.csv")
sites_CAM <- sites_CAM_raw
sites_CAM$latitude[sites_CAM_raw$latitude>1000] <- sites_CAM_raw$latitude[sites_CAM_raw$latitude>1000]/1000

sites_CAM$longitude[sites_CAM_raw$longitude  < (-1000)] <- sites_CAM_raw$longitude[sites_CAM_raw$longitude < (-1000)]/1000
write_csv(sites_CAM,"../data/sites_AAP3.csv")
