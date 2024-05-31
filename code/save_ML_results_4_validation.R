
library(tidyverse)

validation_RB_NO_MOSS <- read_csv("data/Features_JdA_validation_2019_pred_NO_MOSS.csv") %>%
  dplyr::select(site_id,BayRidge)
validation_SVR <- read_csv("data/Features_JdA_validation_2019_pred_SVR.csv") %>%
  dplyr::select(site_id,SVR)
validation_GB <- read_csv("data/Features_JdA_validation_2019_pred_GB.csv") %>%
  dplyr::select(site_id,GB)


validation_ML <- validation_RB_NO_MOSS %>%
  left_join(validation_SVR, by = c("site_id"))%>%
  left_join(validation_GB, by = c("site_id")) %>%
  rename(Sitio = site_id)

fixed_validation_sites <- readr::read_csv("data/fixed_Junta_validation_data.csv")

any(duplicated(fixed_validation_sites$Sitio))

fixed_validation_sites_ML <- fixed_validation_sites %>%
  left_join(validation_ML, by = c("Sitio"))


write_csv(fixed_validation_sites_ML,"data/fixed_Junta_validation_data_ML.csv")


BR_plot <- ggplot(fixed_validation_sites_ML,aes(x=log((Abundancia_abejas+1)/Esfuerzo_min),y=BayRidge))+
  geom_point(aes(color=Habitat))+
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color= "red", linewidth=2)+
  geom_smooth(method = "lm")

SVR_plot <- ggplot(fixed_validation_sites_ML,aes(x=log((Abundancia_abejas+1)/Esfuerzo_min),y=SVR))+
  geom_point()+
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color= "red", linewidth=2)+
  geom_smooth(method = "lm")

GBR_plot <- ggplot(fixed_validation_sites_ML,aes(x=log((Abundancia_abejas+1)/Esfuerzo_min),y=GB))+
  geom_point()+
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color= "red", linewidth=2)+
  geom_smooth(method = "lm")

library(patchwork)
BR_plot/SVR_plot/GBR_plot

ggplot(fixed_validation_sites_ML,aes(x=log((Abundancia_abejas+1)/Esfuerzo_min),y=BayRidge))+
  geom_point(aes(color=Habitat), size=3, alpha=0.5)+
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color= "red", linewidth=2)+
  geom_smooth(method = "lm")
