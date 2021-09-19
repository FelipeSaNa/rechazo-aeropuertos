# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Database merge
# =============================================

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

#END