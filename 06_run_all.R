# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# RUN ALL
# =============================================
#loading packages
pacman::p_load(tidyverse, here, janitor, readxl, writexl, sf, hrbrthemes, kableExtra)

#importing databases with clean names
data_2017 = read_xls(here("data", "raw", "rechazos_2017.xls")) %>% clean_names()
data_2018 = read_xls(here("data", "raw", "rechazos_2018.xls")) %>% clean_names()
data_2019 = read_xls(here("data", "raw", "rechazos_2019.xls")) %>% clean_names()
data_2020 = read_xls(here("data", "raw", "rechazos_2020.xls")) %>% clean_names()
data_2021 = read_xls(here("data", "raw", "rechazos_2021.xls")) %>% clean_names()

#importing claves entidad
claves_entidades = as_tibble(read_csv(here("data", "raw", "municipios.csv"))) %>% clean_names()

#Cleaning 2017 database
data_2017 = data_2017 %>%
    rename(aguascalientes = aguascalientes_a_i,
           cancun = cancun_q_roo,
           ciudad_juarez = cd_juarez_a_i,
           chihuahua = chihuahua_chih,
           cdmx = ciudad_de_mexico_aicm,
           colima = colima_a_i,
           durango = durango_a_i,
           guadalajara = guadalajara_jal,
           mazatlan = mazatlan_sin,
           merida = merida_yuc,
           mexicali = mexicali_a_i,
           monterrey = monterrey_n_l,
           morelia = morelia_mich,
           oaxaca = oaxaca_a_i,
           puebla = puebla_pue,
           puerto_vallarta = puerto_vallarta_jal,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = san_jose_del_cabo_b_c_s,
           san_luis = san_luis_potosi_s_l_p,
           silao = silao_guanajuato,
           tijuana = tijuana_b_c,
           villahermosa = villahermosa_tab,
           zacatecas = zacatecas_a_i_gral_leobardo_c_ruiz,
           zihuatanejo = zihuatanejo_gro) %>%
    pivot_longer(cols = aguascalientes:zihuatanejo, names_to = "aeropuerto") %>%
    pivot_wider(names_from = pais, values_from = value) %>%
    clean_names() %>%
    pivot_longer(cols= canada:zimbabue, names_to = "pais")

#Cleaning 2018 database
data_2018 = data_2018 %>%
    rename(acapulco = acapulco_gro,
           aguascalientes = aguascalientes_a_i,
           cancun = cancun_q_roo,
           ciudad_juarez = cd_juarez_a_i,
           chihuahua = chihuahua_chih,
           cdmx = ciudad_de_mexico_aicm,
           guadalajara = guadalajara_jal,
           huatulco = huatulco_a_i,
           manzanillo = manzanillo_col,
           mazatlan = mazatlan_sin,
           merida = merida_yuc,
           mexicali = mexicali_a_i,
           monterrey = monterrey_n_l,
           morelia = morelia_mich,
           oaxaca = oaxaca_a_i,
           puebla = puebla_pue,
           puerto_vallarta = puerto_vallarta_jal,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = san_jose_del_cabo_b_c_s,
           san_luis = san_luis_potosi_s_l_p,
           silao = silao_guanajuato,
           tijuana = tijuana_b_c,
           toluca = toluca_a_i,
           torreon = torreon_a_i,
           veracruz = veracruz_ver,
           zacatecas = zacatecas_a_i_gral_leobardo_c_ruiz,
           zihuatanejo = zihuatanejo_gro) %>%
    pivot_longer(cols = acapulco:zihuatanejo, names_to = "aeropuerto") %>%
    pivot_wider(names_from = pais, values_from = value) %>%
    clean_names() %>%
    pivot_longer(cols= canada:zimbabue, names_to = "pais")

#Cleaning 2019 database
data_2019 = data_2019 %>%
    rename(aguascalientes = aguascalientes_a_i_jesus_teran,
           cancun = cancun_q_roo_a_i,
           cdmx = ciudad_de_mexico_aicm_a_i,
           chihuahua = chihuahua_a_i_roberto_fierro,
           chichen_itza = chichen_itza_a_i,
           colima = colima_a_i,
           durango = durango_a_i,
           guadalajara = guadalajara_jal_a_i,
           loreto = loreto_a_i,
           mazatlan = mazatlan_a_i,
           merida = merida_a_i,
           monterrey = monterrey_a_i_gral_mariano_escobedo,
           morelia = morelia_a_i,
           oaxaca = oaxaca_a_i,
           puebla = puebla_a_i_hermanos_serdan,
           puerto_vallarta = puerto_vallarta_a_i,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = sa_jose_del_cabo_a_i,
           san_luis = san_luis_potosi_a_i_ponciano_arriaga,
           silao = silao_a_i_el_bajio,
           tijuana = tijuana_a_i_gral_abelardo_l_rodriguez,
           toluca = toluca_a_i,
           uruapan = uruapan_a_i,
           zacatecas = zacatecas_a_i_gral_leobardo_c_ruiz,
           zihuatanejo = zihuatanejo_a_i) %>%
    pivot_longer(cols = aguascalientes:zihuatanejo, names_to = "aeropuerto") %>%
    pivot_wider(names_from = pais, values_from = value) %>%
    clean_names() %>%
    pivot_longer(cols= canada:apatriadas, names_to = "pais")


#Cleaning 2020 database
data_2020 = data_2020 %>%
    rename(aguascalientes = aguascalientes_a_i_jesus_teran,
           cancun = cancun_q_roo_a_i,
           cdmx = ciudad_de_mexico_aicm_a_i,
           chihuahua = chihuahua_a_i_roberto_fierro,
           chichen_itza = chichen_itza_a_i,
           cozumel = cozumel_a_i,
           durango = durango_a_i,
           guadalajara = guadalajara_jal_a_i,
           mazatlan = mazatlan_a_i,
           merida = merida_a_i,
           monterrey = monterrey_a_i_gral_mariano_escobedo,
           morelia = morelia_a_i,
           oaxaca = oaxaca_a_i,
           puebla = puebla_a_i_hermanos_serdan,
           puerto_vallarta = puerto_vallarta_a_i,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = sa_jose_del_cabo_a_i,
           san_luis = san_luis_potosi_a_i_ponciano_arriaga,
           silao = silao_a_i_el_bajio,
           tapachula = tapachula_a_i,
           tijuana = tijuana_a_i_gral_abelardo_l_rodriguez,
           toluca = toluca_a_i,
           zacatecas = zacatecas_a_i_gral_leobardo_c_ruiz) %>%
    pivot_longer(cols = aguascalientes:zacatecas, names_to = "aeropuerto") %>%
    pivot_wider(names_from = pais, values_from = value) %>%
    clean_names() %>%
    pivot_longer(cols= canada:apatriadas, names_to = "pais")

#Cleaning 2021 database
data_2021 = data_2021 %>%
    rename(cancun = cancun_q_roo_a_i,
           cdmx = ciudad_de_mexico_aicm_a_i,
           chichen_itza = chichen_itza_a_i,
           colima = colima_a_i,
           cozumel = cozumel_a_i,
           guadalajara = guadalajara_jal_a_i,
           mazatlan = mazatlan_a_i,
           merida = merida_a_i,
           monterrey = monterrey_a_i_gral_mariano_escobedo,
           morelia = morelia_a_i,
           puerto_vallarta = puerto_vallarta_a_i,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = sa_jose_del_cabo_a_i,
           san_luis = san_luis_potosi_a_i_ponciano_arriaga,
           silao = silao_a_i_el_bajio,
           tijuana = tijuana_a_i_gral_abelardo_l_rodriguez) %>%
    pivot_longer(cols = cancun:tijuana, names_to = "aeropuerto") %>%
    pivot_wider(names_from = pais, values_from = value) %>%
    clean_names() %>%
    pivot_longer(cols= canada:apatriadas, names_to = "pais")

#Cleaning claves entidad
claves_entidades = claves_entidades %>%
    clean_names %>%
    select(c(clave_de_entidad,nombre_de_entidad )) %>%
    rename(entidad = nombre_de_entidad,
           cve_entidad = clave_de_entidad) %>%
    mutate(cve_entidad = str_pad(cve_entidad, width = 2, side = "left", pad = 0),
           entidad = tolower(entidad),
           entidad = str_replace_all(entidad, " ", "_"),
           entidad = str_replace(entidad, "é", "e"),
           entidad = str_replace(entidad, "á", "a"),
           entidad = str_replace(entidad, "í", "i"),
           entidad = str_replace(entidad, "ó", "o"))
claves_entidades = claves_entidades[!duplicated(claves_entidades$cve_entidad), ]

# Merging databases
data_all = data_2017 %>%
    full_join(data_2018) %>%
    full_join(data_2019) %>%
    full_join(data_2020) %>%
    full_join(data_2021) %>%
    rename(eventos_de_rechazo = value) %>%
    # pivot_wider(names_from = aeropuerto, values_from = eventos_de_rechazo) %>%
    replace(is.na(.), 0) %>%
    mutate(entidad = case_when(aeropuerto == "cdmx" ~ "ciudad_de_mexico",
                               aeropuerto == "cancun" ~ "quintana_roo",
                               aeropuerto == "guadalajara" ~ "jalisco",
                               aeropuerto == "chichen_itza" ~ "yucatan",
                               aeropuerto == "monterrey" ~ "nuevo_leon",
                               aeropuerto == "puerto_vallarta" ~ "jalisco",
                               aeropuerto == "san_jose_del_cabo" ~ "baja_california",
                               aeropuerto == "tijuana" ~ "baja_california",
                               aeropuerto == "merida" ~ "yucatan",
                               aeropuerto == "silao" ~ "guanajuato",
                               aeropuerto == "morelia" ~ "michoacan_de_ocampo",
                               aeropuerto == "mazatlan" ~ "sinaloa",
                               aeropuerto == "zihuatanejo" ~"guerrero",
                               aeropuerto == "san_luis" ~ "san_luis_potosi",
                               aeropuerto == "queretaro" ~ "queretaro",
                               aeropuerto == "toluca" ~"mexico",
                               aeropuerto == "aguascalientes" ~"aguascalientes",
                               aeropuerto == "cozumel" ~ "quintana_roo",
                               aeropuerto == "chihuahua"~ "chihuahua",
                               aeropuerto == "zacatecas" ~ "zacatecas",
                               aeropuerto == "puebla" ~ "puebla",
                               aeropuerto == "colima" ~ "colima",
                               aeropuerto == "ciudad_juarez" ~"chihuahua",
                               aeropuerto == "oaxaca" ~ "oaxaca",
                               aeropuerto == "durango" ~ "durango",
                               aeropuerto == "huatulco" ~ "oaxaca",
                               aeropuerto == "manzanillo" ~ "colima",
                               aeropuerto == "mexicali" ~ "baja_california",
                               aeropuerto == "tapachula" ~ "chiapas",
                               aeropuerto == "acapulco" ~ "guerrero",
                               aeropuerto == "loreto" ~ "baja_california_sur", #no tengo puta idea donde sea loreto
                               aeropuerto == "torreon" ~ "coahuila_de_zaragoza", #revisar
                               aeropuerto == "uruapan" ~ "michoacan_de_ocampo", #revisar
                               aeropuerto == "villahermosa" ~ "tabasco")) %>%
    left_join(claves_entidades, by = "entidad")

#remove not needed data
rm(data_2017, data_2018, data_2019, data_2020, data_2021)

#save clean and merged database in various formats
save(data_all, file = here("data","clean","eventos_rechazo_agosto2021.RDS"))
write_xlsx(data_all, here("data","clean","eventos_rechazo_agosto2021.xlsx"))
write_csv(data_all, here("data","clean","eventos_rechazo_agosto2021.csv"))

#total grouping by years
data_anual = data_all %>%
    group_by(ano) %>%
    summarize(total_eventos = sum(eventos_de_rechazo))

# data grouping by aeropuerto
data_aeropuerto= data_all %>%
    group_by(aeropuerto) %>%
    # filter(ano < 2021) %>%
    # filter(aeropuerto == "cdmx" | aeropuerto == "cancun") %>%
    summarize(total_eventos = sum(eventos_de_rechazo)) %>%
    arrange(desc(total_eventos))


#data grouping by country of origin
data_nacionalidad = data_all %>%
    group_by(pais) %>%
    # filter(ano < 2021) %>%
    # filter(aeropuerto == "cdmx" | aeropuerto == "cancun") %>%
    summarize(total_eventos = sum(eventos_de_rechazo)) %>%
    arrange(desc(total_eventos))

#graph of country of origin by year
data_all %>%
    group_by(aeropuerto) %>%
    summarise(sum(eventos_de_rechazo)) %>%
    print()

#summary statistics of eventos
data_all %>%
    summarize(sum(eventos_de_rechazo)) %>%
    print()

#plotting nacionalidades
data_nacionalidad %>%
    filter(!is.na(total_eventos)) %>%
    arrange(total_eventos) %>%
    tail(20) %>%
    mutate(pais=factor(pais, pais)) %>%
    ggplot( aes(x=pais, y=total_eventos) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    coord_flip() +
    theme_ipsum() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="none",
        plot.title = element_text(size=12),
        plot.subtitle = element_text(size=10)) +
    labs(title = "México: Rechazos ocurridos en aeropuertos entre 2017 y 2021",
         subtitle = "Desagregación por nacionalidades más frecuentes",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB")+
    xlab("") +
    ylab("Total de eventos")
ggsave("grafica_nacionalidades.png", path = here("plots"))


#gráfica por años
data_anual %>%
    filter(!is.na(total_eventos)) %>%
    arrange(total_eventos) %>%
    tail(20) %>%
    mutate(ano=factor(ano, ano)) %>%
    ggplot( aes(x=ano, y=total_eventos) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    coord_flip() +
    theme_ipsum() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="none",
        plot.title = element_text(size=12),
        plot.subtitle = element_text(size=10)) +
    labs(title = "México: Rechazos ocurridos en aeropuertos entre 2017 y 2021",
         subtitle = "Desagregación por año",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB")+
    xlab("") +
    ylab("Total de eventos")
ggsave("grafica_anual.png", path = here("plots"))

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
    labs(title = "México: Distribución de rechazos en aeropuertos ocurridos en 2017",
         subtitle = "Desagregación a nivel estatal por ubicación del aeropuerto",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5),
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
    labs(title = "México: Distribución de rechazos en aeropuertos ocurridos en 2018",
         subtitle = "Desagregación a nivel estatal por ubicación del aeropuerto",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5),
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
    labs(title = "México: Distribución de rechazos en aeropuertos ocurridos en 2019",
         subtitle = "Desagregación a nivel estatal por ubicación del aeropuerto",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5),
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
    labs(title = "México: Distribución de rechazos en aeropuertos ocurridos en 2020",
         subtitle = "Desagregación a nivel estatal por ubicación del aeropuerto",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5),
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
    labs(title = "México: Distribución de rechazos en aeropuertos ocurridos en 2021",
         subtitle = "Desagregación a nivel estatal por ubicación del aeropuerto",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB") +
    scale_fill_brewer("Total de rechazos", palette = "Reds") +
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5),
          plot.caption = element_text(hjust = 0.65))
ggsave("mapa_aeropuertos_2021.png", path = here("plots"))

#remove not needed data
rm(claves_entidades,mex_map, mex_map_aeropuerto_2017, mex_map_aeropuerto_2018,
   mex_map_aeropuerto_2019,mex_map_aeropuerto_2020,
   mex_map_aeropuerto_2021,data_2017, data_2018, data_2019, data_2020, data_2021, brks)

#END