# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Database merge
# =============================================

#merging ingresos databases
ingresos_all = ingresos_2017 %>%
    full_join(ingresos_2018) %>%
    full_join(ingresos_2019) %>%
    full_join(ingresos_2020) %>%
    full_join(ingresos_2021)

# data_new = sexo_edad %>%
#     left_join(ingresos_all, by = c("ano", "aeropuerto", "pais"))

# anti = data_all %>%
#     anti_join(data_new)
# Merging  all databases
data_all = data_2017 %>%
    full_join(data_2018) %>%
    full_join(data_2019) %>%
    full_join(data_2020) %>%
    full_join(data_2021) %>%
    rename(eventos_de_rechazo = value) %>%
    left_join(ingresos_all, by = c("ano", "aeropuerto", "pais")) %>%
    # left_join(ingresos_2018, by = c("ano", "aeropuerto", "pais")) %>%
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
    left_join(claves_entidades, by = "entidad") %>%
    left_join(visa_requirements, by = "pais") %>%
    mutate(visa = replace_na(visa, "no")) %>%
    filter(eventos_de_rechazo >0) %>%
    arrange(ano, aeropuerto, pais)

#merging new database
sexo_edad = sexo_edad %>%
    mutate(entidad = case_when(aeropuerto == "acapulco"~ "guerrero",
                               aeropuerto == "aguascalientes" ~ "aguascalientes",
                               aeropuerto == "apodaca" ~ "nuevo_leon",
                               aeropuerto == "cancun" ~ "quintana_roo",
                               aeropuerto == "cdmx" ~ "ciudad_de_mexico",
                               aeropuerto == "chichen_itza" ~ "yucatan",
                               aeropuerto == "chihuahua" ~ "chihuahua",
                               aeropuerto == "cozumel" ~ "quintana_roo",
                               aeropuerto == "durango" ~ "durango",
                               aeropuerto == "guadalajara" ~ "jalisco",
                               aeropuerto == "guanajuato" ~ "guanajuato",
                               aeropuerto == "hermosillo" ~ "sonora",
                               aeropuerto == "huatulco" ~ "oaxaca",
                               aeropuerto == "loreto" ~ "baja_california_sur",
                               aeropuerto == "los_cabos" ~ "baja_california",
                               aeropuerto == "manzanillo" ~ "colima",
                               aeropuerto == "mazatlan" ~ "sinaloa",
                               aeropuerto == "merida" ~ "yucatan",
                               aeropuerto == "monterrey" ~ "nuevo_leon",
                               aeropuerto == "morelia" ~ "michoacan_de_ocampo",
                               aeropuerto == "oaxaca" ~ "oaxaca",
                               aeropuerto == "puebla" ~ "puebla",
                               aeropuerto == "puerto_vallarta" ~ "jalisco",
                               aeropuerto == "queretaro" ~ "queretaro",
                               aeropuerto == "san_luis" ~ "san_luis_potosi",
                               aeropuerto == "tampico" ~ "tamaulipas",
                               aeropuerto == "tapachula" ~ "chiapas",
                               aeropuerto == "tijuana" ~ "baja_california",
                               aeropuerto == "toluca"~ "mexico",
                               aeropuerto == "torreon" ~ "coahuila",
                               aeropuerto == "uruapan" ~ "michoacan_de_ocampo",
                               aeropuerto == "veracruz" ~ "veracruz",
                               aeropuerto == "villahermosa" ~ "tabasco",
                               aeropuerto == "zacatecas" ~ "zacatecas",
                               aeropuerto == "zihuatanejo" ~ "guerrero")) %>%
    left_join(claves_entidades, by = "entidad") %>%
    left_join(visa_requirements, by = "pais") %>%
    left_join(ingresos_all, by = c("ano", "aeropuerto", "pais")) %>%
    mutate(visa = replace_na(visa, "no"),
           ingresos = replace_na(ingresos,0))

#tabulados two databases

tabulado_old = data_all %>%
    tabyl(pais)
tabulado_new = sexo_edad %>%
    tabyl(pais) %>%
    rename(numero_new = n,
           porcentaje_new = percent)

tabulado_all = tabulado_old %>%
    full_join(tabulado_new)


# data_all_nac = data_all %>%
#     tabyl(pais)

# summarize(across(eventos_de_rechazo:ingresos, mean, na.rm = T))

#save clean and merged database in various formats
save(data_all, file = here("data","clean","eventos_rechazo_2017_2021.RDS"))
write_xlsx(data_all, here("data","clean","eventos_rechazo_2017_2021.xlsx"))
write_csv(data_all, here("data","clean","eventos_rechazo_2017_2021.csv"))
# save(claves_entidades, file = here("data","clean","claves_entidades_clean.RData"))


# #remove not needed data
rm(data_2017, data_2018, data_2019, data_2020, data_2021)
rm(ingresos_2017, ingresos_2018, ingresos_2019, ingresos_2020, ingresos_2021, ingresos_all)
rm(visa_requirements, sexo_edad_1, tabulado_new, tabulado_old)


#data prueba
# data_final = sexo_edad %>%
#     left_join(claves_entidades, by = "entidad") %>%
#     left_join(visa_requirements, by = "pais")
#
#     left_join(data_all, by = c("ano", "aeropuerto", "pais")) %>%
#     mutate(eventos_de_rechazo = replace_na(eventos_de_rechazo,0))
# %>%
#     select(-c(menor_mujer, menor_hombre, mayor_mujer, mayor_hombre))



# >%
#     mutate(eventos_de_rechazo = replace_na(eventos_de_rechazo,0))%>%


# sexo_edad3 = sexo_edad %>%
#     filter(aeropuerto == "Aeropuerto Internacional de la Ciudad de México") %>%
#     filter(total_general == 1 & ano == 2017 & mayor_hombre ==1)

# not_merged = data_final %>%
#     filter(eventos_de_rechazo



#END