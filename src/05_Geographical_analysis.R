# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Geogrpahical analysis
# =============================================

#Creating maps
data_2017 = data_all %>%
    filter(ano == 2017) %>%
    group_by(entidad) %>%
    summarize(eventos_de_rechazo = sum(eventos_de_rechazo)) %>%
    full_join(claves_entidades, by = "entidad") %>%
    mutate(eventos_de_rechazo = replace_na(eventos_de_rechazo, 0))

data_2018 = data_all %>%
    filter(ano == 2018) %>%
    group_by(entidad) %>%
    summarize(eventos_de_rechazo = sum(eventos_de_rechazo)) %>%
    full_join(claves_entidades, by = "entidad") %>%
    mutate(eventos_de_rechazo = replace_na(eventos_de_rechazo, 0))

data_2019 = data_all %>%
    filter(ano == 2019) %>%
    group_by(entidad) %>%
    summarize(eventos_de_rechazo = sum(eventos_de_rechazo)) %>%
    full_join(claves_entidades, by = "entidad") %>%
    mutate(eventos_de_rechazo = replace_na(eventos_de_rechazo, 0))

data_2020 = data_all %>%
    filter(ano == 2020) %>%
    group_by(entidad) %>%
    summarize(eventos_de_rechazo = sum(eventos_de_rechazo)) %>%
    full_join(claves_entidades, by = "entidad") %>%
    mutate(eventos_de_rechazo = replace_na(eventos_de_rechazo, 0))

data_2021 = data_all %>%
    filter(ano == 2021) %>%
    group_by(entidad) %>%
    summarize(eventos_de_rechazo = sum(eventos_de_rechazo)) %>%
    full_join(claves_entidades, by = "entidad") %>%
    mutate(eventos_de_rechazo = replace_na(eventos_de_rechazo, 0))

mex_map = st_read(here("data", "raw", "00ent.shp"))
brks = c(0,1,20,50,100,500,1000,2000,3000,4000,5000, 6000,7000, 9000, 10000,11000,12000,15000,20000,30000)

# 2017 map
mex_map_aeropuerto_2017 = mex_map %>%
    left_join(data_2017,
              by = c("CVE_ENT"= "cve_entidad"))

mex_map_aeropuerto_2017 %>%
    mutate(casos_cut = cut(eventos_de_rechazo, breaks = brks,
                           labels = c("[0)","[1-20)","[20-50)", "[50-100)",
                                      "[100-500)", "[500-1,000)", "[1,000-2,000)",
                                      "[2,000-3,000)", "[3,000-4,000)", "[4,000-5,000)",
                                      "[5,000-6,000)", "[6,000-7,000]", "[7,000-9,000]", "[9,000-10,000]",
                                      "[10,000-11,000]", "[11,000-12,000]", "[12,000-15,000]", "[15,000-20,000]",
                                      "[20,000-30,000]"),
                           right = FALSE)) %>%
    ggplot(aes(fill = casos_cut)) +
    geom_sf(colour = "#dddddd", size = 0.001) +
    labs(title = "México: Distribución de eventos de rechazo en aeropuertos ocurridas en 2017 a nivel estatal",
         #subtitle = "Víctimas registradas",
         caption = "Elaboración propia con información de la UPM del INM") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          # plot.subtitle = element_text(hjust = 0.5),
          plot.caption = element_text(hjust = 0.65))
ggsave("mapa_aeropuertos_2017.png", path = here("plots"))


#Creating 2018 map
mex_map_aeropuerto_2018 = mex_map %>%
    left_join(data_2018,
              by = c("CVE_ENT"= "cve_entidad"))

mex_map_aeropuerto_2018 %>%
    mutate(casos_cut = cut(eventos_de_rechazo, breaks = brks,
                           labels = c("[0)","[1-20)","[20-50)", "[50-100)",
                                      "[100-500)", "[500-1,000)", "[1,000-2,000)",
                                      "[2,000-3,000)", "[3,000-4,000)", "[4,000-5,000)",
                                      "[5,000-6,000)", "[6,000-7,000]", "[7,000-9,000]", "[9,000-10,000]",
                                      "[10,000-11,000]", "[11,000-12,000]", "[12,000-15,000]", "[15,000-20,000]",
                                      "[20,000-30,000]"),
                           right = FALSE)) %>%
    ggplot(aes(fill = casos_cut)) +
    geom_sf(colour = "#dddddd", size = 0.001) +
    labs(title = "México: Distribución de eventos de rechazo en aeropuertos ocurridas en 2018 a nivel estatal",
         #subtitle = "Víctimas registradas",
         caption = "Elaboración propia con información de la UPM del INM") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          # plot.subtitle = element_text(hjust = 0.5),
          plot.caption = element_text(hjust = 0.65))
ggsave("mapa_aeropuertos_2018.png", path = here("plots"))

#Creating 2019 map
mex_map_aeropuerto_2019 = mex_map %>%
    left_join(data_2019,
              by = c("CVE_ENT"= "cve_entidad"))

mex_map_aeropuerto_2019 %>%
    mutate(casos_cut = cut(eventos_de_rechazo, breaks = brks,
                           labels = c("[0)","[1-20)","[20-50)", "[50-100)",
                                      "[100-500)", "[500-1,000)", "[1,000-2,000)",
                                      "[2,000-3,000)", "[3,000-4,000)", "[4,000-5,000)",
                                      "[5,000-6,000)", "[6,000-7,000]", "[7,000-9,000]", "[9,000-10,000]",
                                      "[10,000-11,000]", "[11,000-12,000]", "[12,000-15,000]", "[15,000-20,000]",
                                      "[20,000-30,000]"),
                           right = FALSE)) %>%
    ggplot(aes(fill = casos_cut)) +
    geom_sf(colour = "#dddddd", size = 0.001) +
    labs(title = "México: Distribución de eventos de rechazo en aeropuertos ocurridas en 2019 a nivel estatal",
         #subtitle = "Víctimas registradas",
         caption = "Elaboración propia con información de la UPM del INM") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          # plot.subtitle = element_text(hjust = 0.5),
          plot.caption = element_text(hjust = 0.65))
ggsave("mapa_aeropuertos_2019.png", path = here("plots"))

#Creating 2020 map
mex_map_aeropuerto_2020 = mex_map %>%
    left_join(data_2020,
              by = c("CVE_ENT"= "cve_entidad"))

mex_map_aeropuerto_2020 %>%
    mutate(casos_cut = cut(eventos_de_rechazo, breaks = brks,
                           labels = c("[0)","[1-20)","[20-50)", "[50-100)",
                                      "[100-500)", "[500-1,000)", "[1,000-2,000)",
                                      "[2,000-3,000)", "[3,000-4,000)", "[4,000-5,000)",
                                      "[5,000-6,000)", "[6,000-7,000]", "[7,000-9,000]", "[9,000-10,000]",
                                      "[10,000-11,000]", "[11,000-12,000]", "[12,000-15,000]", "[15,000-20,000]",
                                      "[20,000-30,000]"),
                           right = FALSE)) %>%
    ggplot(aes(fill = casos_cut)) +
    geom_sf(colour = "#dddddd", size = 0.001) +
    labs(title = "México: Distribución de eventos de rechazo en aeropuertos ocurridas en 2020 a nivel estatal",
         #subtitle = "Víctimas registradas",
         caption = "Elaboración propia con información de la UPM del INM") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          # plot.subtitle = element_text(hjust = 0.5),
          plot.caption = element_text(hjust = 0.65))
ggsave("mapa_aeropuertos_2020.png", path = here("plots"))

#Creating 2021 map
mex_map_aeropuerto_2021 = mex_map %>%
    left_join(data_2021,
              by = c("CVE_ENT"= "cve_entidad"))

mex_map_aeropuerto_2021 %>%
    mutate(casos_cut = cut(eventos_de_rechazo, breaks = brks,
                           labels = c("[0)","[1-20)","[20-50)", "[50-100)",
                                      "[100-500)", "[500-1,000)", "[1,000-2,000)",
                                      "[2,000-3,000)", "[3,000-4,000)", "[4,000-5,000)",
                                      "[5,000-6,000)", "[6,000-7,000]", "[7,000-9,000]", "[9,000-10,000]",
                                      "[10,000-11,000]", "[11,000-12,000]", "[12,000-15,000]", "[15,000-20,000]",
                                      "[20,000-30,000]"),
                           right = FALSE)) %>%
    ggplot(aes(fill = casos_cut)) +
    geom_sf(colour = "#dddddd", size = 0.001) +
    labs(title = "México: Distribución de eventos de rechazo en aeropuertos ocurridas en 2021 a nivel estatal",
         #subtitle = "Víctimas registradas",
         caption = "Elaboración propia con información de la UPM del INM") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          # plot.subtitle = element_text(hjust = 0.5),
          plot.caption = element_text(hjust = 0.65))
ggsave("mapa_aeropuertos_2021.png", path = here("plots"))

#remove not needed data
rm(claves_entidades,mex_map, mex_map_aeropuerto_2017, mex_map_aeropuerto_2018,
   mex_map_aeropuerto_2019,mex_map_aeropuerto_2020,
   mex_map_aeropuerto_2021,data_2017, data_2018, data_2019, data_2020, data_2021, brks)

