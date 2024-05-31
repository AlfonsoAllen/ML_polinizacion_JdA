
library(tidyverse)
library(wesanderson)
library(mapSpain)
library(raster)
# Los puntos que no aparecen en el mapa corresponden con localizaciones donde
# hay agua

country <- esp_get_country()
lines <- esp_get_can_box()

# Plot municipalities

andalucia <- esp_get_ccaa("01")
madrid <- esp_get_ccaa("13")
euskadi <- esp_get_ccaa("16")


visit_rate_JdA <- read_csv("data/Features2_pred.csv") %>% dplyr::select(Longitud,Latitud, BayRidge)
visit_rate_CAM <- read_csv("data/Features3_pred.csv") %>% dplyr::select(Longitud,Latitud, BayRidge)
visit_rate_Eus <- read_csv("data/Features4_pred.csv") %>% dplyr::select(Longitud,Latitud, BayRidge)


ggplot() +
  geom_point(data=visit_rate_JdA, aes(x = Longitud, y = Latitud, color = BayRidge),size=2)+
  geom_sf(data=andalucia, fill=NA, linewidth = 1) +
  scale_color_gradientn(colors = rev(wes_palette("Zissou1", type = "continuous")))+
  theme_bw()+
  labs(title = "Global model (BayRidge without MOSS)", x = "Longitude", y = "Latitude",
       color = "log(vis.rate)")


ggplot() +
  geom_point(data=visit_rate_CAM, aes(x = Longitud, y = Latitud, color = BayRidge),size=2)+
  geom_sf(data=madrid, fill=NA, linewidth = 1) +
  scale_color_gradientn(colors = rev(wes_palette("Zissou1", type = "continuous")))+
  theme_bw()+
  labs(title = "Global model (BayRidge without MOSS)", x = "Longitude", y = "Latitude",
       color = "log(vis.rate)")

ggplot() +
  geom_point(data=visit_rate_Eus, aes(x = Longitud, y = Latitud, color = BayRidge),size=2)+
  geom_sf(data=euskadi, fill=NA, linewidth = 1) +
  scale_color_gradientn(colors = rev(wes_palette("Zissou1", type = "continuous")))+
  theme_bw()+
  labs(title = "Global model (BayRidge)", x = "Longitude", y = "Latitude",
       color = "log(vis.rate)")
