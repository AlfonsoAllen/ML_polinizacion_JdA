
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


visit_rate_JdA_validation <- read_csv("data/Features_JdA_validation_2019_pred_SVR.csv") #%>%
  # dplyr::select(Longitud,Latitud, BayRidge)

ggplot() +
  geom_point(data=visit_rate_JdA_validation, aes(x = Longitud, y = Latitud, color = SVR),size=2)+
  geom_sf(data=andalucia, fill=NA, linewidth = 1) +
  scale_color_gradientn(colors = rev(wes_palette("Zissou1", type = "continuous")))+
  theme_bw()+
  labs(title = "Global model (SVR)", x = "Longitude", y = "Latitude",
       color = "log(vis.rate)")

