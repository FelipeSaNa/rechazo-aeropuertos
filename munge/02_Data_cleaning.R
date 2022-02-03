# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Data Cleaning and Merging
# =============================================

#Cleaning 2017  rechazos database
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

#Cleaning 2018 rechazos database
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

#Cleaning 2019 rechazos database
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
    pivot_longer(cols= canada:apatridas, names_to = "pais")


#Cleaning 2020 rechazos database
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

#Cleaning 2021 rechazos database
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
    pivot_longer(cols= canada:apatridas, names_to = "pais")

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



#cleaning ingresos 2017 dataase
ingresos_2017 = ingresos_2017 %>%
    rename(aguascalientes = aguascalientes_a_i_jesus_teran,
           apodaca = apodaca_a_i_del_norte,
           cancun = cancun_a_i,
           chihuahua = chihuahua_a_i,
           cdmx = cd_de_mexico_a_i_benito_juarez,
           colima = colima_a_i,
           cozumel = cozumel_a_i,
           durango = durango_a_i,
           guadalajara = guadalajara_a_i,
           hermosillo = hermosillo_a_i,
           huatulco = huatulco_a_i,
           loreto = loreto_a_i,
           mazatlan = mazatlan_a_i,
           merida = merida_a_i,
           monterrey = monterrey_a_i_gral_mariano_escobedo,
           morelia = morelia_a_i,
           oaxaca = oaxaca_a_i,
           puebla = puebla_a_i_hermanos_serdan,
           puerto_vallarta = puerto_vallarta_a_i,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = san_jose_del_cabo_a_i,
           san_luis = san_luis_potosi_a_i_ponciano_arriaga,
           silao = silao_a_i_el_bajio,
           toluca = toluca_a_i,
           torreon = torreon_a_i,
           veracruz = veracruz_a_i,
           zacatecas = zacatecas_a_i_gral_leobardo_c_ruiz,
           zihuatanejo = zihuatanejo_a_i)%>%
    pivot_longer(cols = cdmx:otros, names_to = "aeropuerto")%>%
    pivot_wider(names_from = pais, values_from = value)%>%
    clean_names() %>%
    pivot_longer(cols= mexico:no_especificado, names_to = "pais")%>%
    rename(ingresos = value)

#cleaning 2018 database
ingresos_2018 = ingresos_2018 %>%
    rename(aguascalientes = aguascalientes_a_i_jesus_teran,
           apodaca = apodaca_a_i_del_norte,
           cancun = cancun_a_i,
           chihuahua = chihuahua_a_i,
           cdmx = cd_de_mexico_a_i_benito_juarez,
           colima = colima_a_i,
           cozumel = cozumel_a_i,
           durango = durango_a_i,
           guadalajara = guadalajara_a_i,
           hermosillo = hermosillo_a_i,
           huatulco = huatulco_a_i,
           loreto = loreto_a_i,
           mazatlan = mazatlan_a_i,
           merida = merida_a_i,
           monterrey = monterrey_a_i_gral_mariano_escobedo,
           morelia = morelia_a_i,
           oaxaca = oaxaca_a_i,
           puebla = puebla_a_i_hermanos_serdan,
           puerto_vallarta = puerto_vallarta_a_i,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = san_jose_del_cabo_a_i,
           san_luis = san_luis_potosi_a_i_ponciano_arriaga,
           silao = silao_a_i_el_bajio,
           tijuana = tijuana_a_i_gral_abelardo_l_rodriguez,
           toluca = toluca_a_i,
           torreon = torreon_a_i,
           zacatecas = zacatecas_a_i_gral_leobardo_c_ruiz,
           zihuatanejo = zihuatanejo_a_i) %>%
    pivot_longer(cols = cdmx:otros, names_to = "aeropuerto")%>%
    pivot_wider(names_from = pais, values_from = value)%>%
    clean_names() %>%
    pivot_longer(cols= mexico:no_especificado, names_to = "pais")%>%
    rename(ingresos = value)

#cleaning 2019 database
ingresos_2019 = ingresos_2019 %>%
    rename(aguascalientes = aguascalientes_a_i_jesus_teran,
           apodaca = apodaca_a_i_del_norte,
           cancun = cancun_a_i,
           chihuahua = chihuahua_a_i,
           cdmx = cd_de_mexico_a_i_benito_juarez,
           colima = colima_a_i,
           cozumel = cozumel_a_i,
           durango = durango_a_i,
           guadalajara = guadalajara_a_i,
           hermosillo = hermosillo_a_i,
           huatulco = huatulco_a_i,
           loreto = loreto_a_i,
           mazatlan = mazatlan_a_i,
           merida = merida_a_i,
           monterrey = monterrey_a_i_gral_mariano_escobedo,
           morelia = morelia_a_i,
           oaxaca = oaxaca_a_i,
           puerto_vallarta = puerto_vallarta_a_i,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = san_jose_del_cabo_a_i,
           san_luis = san_luis_potosi_a_i_ponciano_arriaga,
           silao = silao_a_i_el_bajio,
           tijuana = tijuana_a_i_gral_abelardo_l_rodriguez,
           toluca = toluca_a_i,
           torreon = torreon_a_i,
           veracruz = veracruz_a_i,
           zacatecas = zacatecas_a_i_gral_leobardo_c_ruiz,
           zihuatanejo = zihuatanejo_a_i) %>%
    pivot_longer(cols = cdmx:otros, names_to = "aeropuerto")%>%
    pivot_wider(names_from = pais, values_from = value)%>%
    clean_names() %>%
    pivot_longer(cols= mexico:no_especificado, names_to = "pais")%>%
    rename(ingresos = value)

#cleaning 2020 database
ingresos_2020 = ingresos_2020 %>%
    rename(aguascalientes = aguascalientes_a_i_jesus_teran,
           acapulco = acapulco_a_i_plan_de_los_amates,
           apodaca = apodaca_a_i_del_norte,
           cancun = cancun_a_i,
           chihuahua = chihuahua_a_i,
           cdmx = cd_de_mexico_a_i_benito_juarez,
           colima = colima_a_i,
           cozumel = cozumel_a_i,
           durango = durango_a_i,
           guadalajara = guadalajara_a_i,
           hermosillo = hermosillo_a_i,
           huatulco = huatulco_a_i,
           loreto = loreto_a_i,
           los_cabos = los_cabos_aerodromo,
           mazatlan = mazatlan_a_i,
           merida = merida_a_i,
           monterrey = monterrey_a_i_gral_mariano_escobedo,
           morelia = morelia_a_i,
           oaxaca = oaxaca_a_i,
           puerto_vallarta = puerto_vallarta_a_i,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = san_jose_del_cabo_a_i,
           san_luis = san_luis_potosi_a_i_ponciano_arriaga,
           silao = silao_a_i_el_bajio,
           toluca = toluca_a_i,
           torreon = torreon_a_i,
           zacatecas = zacatecas_a_i_gral_leobardo_c_ruiz,
           zihuatanejo = zihuatanejo_a_i) %>%
    pivot_longer(cols = cancun:otros, names_to = "aeropuerto")%>%
    pivot_wider(names_from = pais, values_from = value)%>%
    clean_names() %>%
    pivot_longer(cols= mexico:no_especificado, names_to = "pais") %>%
    rename(ingresos = value)

#cleaning 2021 database
ingresos_2021 = ingresos_2021 %>%
    rename(aguascalientes = aguascalientes_a_i_jesus_teran,
           apodaca = apodaca_a_i_del_norte,
           cancun = cancun_a_i,
           chihuahua = chihuahua_a_i,
           cdmx = cd_de_mexico_a_i_benito_juarez,
           colima = colima_a_i,
           cozumel = cozumel_a_i,
           durango = durango_a_i,
           guadalajara = guadalajara_a_i,
           hermosillo = hermosillo_a_i,
           loreto = loreto_a_i,
           los_cabos = los_cabos_aerodromo,
           mazatlan = mazatlan_a_i,
           merida = merida_a_i,
           monterrey = monterrey_a_i_gral_mariano_escobedo,
           morelia = morelia_a_i,
           oaxaca = oaxaca_a_i,
           puerto_vallarta = puerto_vallarta_a_i,
           queretaro = queretaro_a_i_ing_fernando_espinosa,
           san_jose_del_cabo = san_jose_del_cabo_a_i,
           san_luis = san_luis_potosi_a_i_ponciano_arriaga,
           silao = silao_a_i_el_bajio,
           tampico = tampico_a_i,
           toluca = toluca_a_i,
           torreon = torreon_a_i,
           veracruz = veracruz_a_i,
           zacatecas = zacatecas_a_i_gral_leobardo_c_ruiz,
           zihuatanejo = zihuatanejo_a_i) %>%
    pivot_longer(cols = cancun:otros, names_to = "aeropuerto")%>%
    pivot_wider(names_from = pais, values_from = value)%>%
    clean_names() %>%
    pivot_longer(cols= mexico:no_especificado, names_to = "pais")%>%
    rename(ingresos = value)

#cleaning visa database
visa_requirements = visa_requirements %>%
    pivot_wider(names_from = pais, values_from = visa) %>%
    clean_names()%>%
    rename(brunei = brunei_darussalam,
           lesoto = lesotho,
           congo_rep_dem = republica_democratica_del_congo,
           laos = lao,
           samoa_occidental =samoa,
           botsuana =  botswana,
           macedonia = ex_republica_yugoslava_de_macedonia,
           fiyi_islas = fiji,
           irak = iraq,
           kazajistan = kazajstan,
           mianmar_birmania = myanmar,
           siria = republica_arabe_de_siria,
           saharaui_rep_arabe = republica_arabe_de_saharaui_democratica,
           moldavia = republica_de_moldova,
           dominicana_rep = republica_dominicana,
           nepal = republica_federal_democratica_de_nepal,
           ruanda = rwanda,
           surinam = suriname,
           ucrania = urania,
           zimbaue = zimbawe) %>%
    pivot_longer(cols=afganistan:zimbaue, names_to = "pais", values_to = "visa") %>%
    mutate(visa = ifelse(pais == "ecuador", "no", "si"))


#cleaning sexo_edad database
sexo_edad_1 = sexo_edad %>%
    tabyl(nacionalidad)

sexo_edad = sexo_edad %>%
    # select(-c(menor_mujer, menor_hombre, mayor_mujer, mayor_hombre)) %>% %>%
  mutate(aeropuerto = case_when(aeropuerto == "Aeropuerto Internacional de Acapulco" ~ "acapulco",
                                aeropuerto == "Aeropuerto Internacional de Aguascalientes" ~ "aguascalientes",
                                aeropuerto == "Aeropuerto Internacional de Cancún" ~ "cancun",
                                aeropuerto == "Aeropuerto Internacional de Chichen-Itzá" ~ "chichen_itza",
                                aeropuerto == "Aeropuerto Internacional de Chihuahua" ~ "chihuahua",
                                aeropuerto == "Aeropuerto Internacional de Cozumel" ~ "cozumel",
                                aeropuerto == "Aeropuerto Internacional de Durango" ~ "durango",
                                aeropuerto == "Aeropuerto Internacional de Guadalajara" ~ "guadalajara",
                                aeropuerto == "Aeropuerto Internacional de Hermosillo" ~ "hermosillo",
                                aeropuerto == "Aeropuerto Internacional de Huatulco" ~ "huatulco",
                                aeropuerto == "Aeropuerto Internacional de la Ciudad de México" ~ "cdmx",
                                aeropuerto == "Aeropuerto Internacional de León" ~ "guanajuato",
                                aeropuerto == "Aeropuerto Internacional de Loreto" ~ "loreto",
                                aeropuerto == "Aeropuerto Internacional de Los Cabos" ~ "los_cabos",
                                aeropuerto == "Aeropuerto Internacional de Manzanillo" ~ "manzanillo",
                                aeropuerto == "Aeropuerto Internacional de Mazatlán" ~ "mazatlan",
                                aeropuerto == "Aeropuerto Internacional de Mérida" ~ "merida",
                                aeropuerto == "Aeropuerto Internacional de Monterrey" ~ "monterrey",
                                aeropuerto == "Aeropuerto Internacional de Morelia" ~ "morelia",
                                aeropuerto == "Aeropuerto Internacional de Oaxaca" ~ "oaxaca",
                                aeropuerto == "Aeropuerto Internacional de Puebla" ~ "puebla",
                                aeropuerto == "Aeropuerto Internacional de Puerto Vallarta" ~ "puerto_vallarta",
                                aeropuerto == "Aeropuerto Internacional de Querétaro" ~ "queretaro",
                                aeropuerto == "Aeropuerto Internacional de San Luis Potosí" ~ "san_luis",
                                aeropuerto == "Aeropuerto Internacional de Tampico" ~ "tampico",
                                aeropuerto == "Aeropuerto Internacional de Tapachula" ~ "tapachula",
                                aeropuerto == "Aeropuerto Internacional de Tijuana" ~ "tijuana",
                                aeropuerto == "Aeropuerto Internacional de Toluca" ~ "toluca",
                                aeropuerto == "Aeropuerto Internacional de Torreón" ~ "torreon",
                                aeropuerto == "Aeropuerto Internacional de Uruapan" ~ "uruapan",
                                aeropuerto == "Aeropuerto Internacional de Veracruz" ~ "veracruz",
                                aeropuerto == "Aeropuerto Internacional de Villahermosa" ~ "villahermosa",
                                aeropuerto == "Aeropuerto Internacional de Zacatecas" ~ "zacatecas",
                                aeropuerto == "Aeropuerto Internacional de Zihuatanejo" ~ "zihuatanejo",
                                aeropuerto == "Aeropuerto Internacional del Norte" ~ "apodaca"),
         nacionalidad = case_when(nacionalidad == "Afganistán" ~ "afganistan",
                                  nacionalidad == "Albania" ~ "albania",
                                  nacionalidad == "Alemania" ~ "alemania",
                                  nacionalidad == "Andorra" ~ "andorra",
                                  nacionalidad == "Angola" ~ "angola",
                                  nacionalidad == "Antigua y Barbuda" ~ "antigua_y_barbuda",
                                  nacionalidad == "Apátrida" ~ "apatridas",
                                  nacionalidad == "Arabia Saudita" ~ "arabia_saudita",
                                  nacionalidad == "Argelia" ~ "argelia",
                                  nacionalidad == "Argentina" ~ "argentina",
                                  nacionalidad == "Armenia" ~ "armenia",
                                  nacionalidad == "Australia" ~ "australia",
                                  nacionalidad == "Austria" ~ "austria",
                                  nacionalidad == "Azerbaiyán" ~ "azerbaiyan",
                                  nacionalidad == "Bahamas" ~ "bahamas_commonwealth",
                                  nacionalidad == "Bahrein" ~ "bahrein",
                                  nacionalidad == "Bangladesh" ~ "bangladesh",
                                  nacionalidad == "Barbados" ~ "barbados",
                                  nacionalidad == "Belarús" ~ "bielorrusia",
                                  nacionalidad == "Bélgica" ~ "belgica",
                                  nacionalidad == "Belice" ~ "belice",
                                  nacionalidad == "Benin"~ "benin",
                                  nacionalidad == "Bermuda"~ "bermuda",
                                  nacionalidad == "Bosnia y Herzegovina" ~ "bosnia_herzegovina",
                                  nacionalidad == "Botswana" ~ "botsuana",
                                  nacionalidad == "Brasil" ~ "brasil",
                                  nacionalidad == "Brunei Darussalam" ~ "brunei",
                                  nacionalidad == "Bulgaria" ~ "bulgaria",
                                  nacionalidad == "Burkina Faso" ~ "burkina_faso",
                                  nacionalidad == "Burundi" ~ "burundi",
                                  nacionalidad == "Cabo Verde" ~ "cabo_verde",
                                  nacionalidad == "Camboya" ~ "camboya",
                                  nacionalidad == "Camerún" ~ "camerun",
                                  nacionalidad == "Canadá" ~ "canada",
                                  nacionalidad == "Chile" ~ "chile",
                                  nacionalidad == "China" ~ "china",
                                  nacionalidad == "Chipre" ~ "chipre",
                                  nacionalidad == "Colombia" ~ "colombia",
                                  nacionalidad == "Congo" ~ "congo_rep",
                                  nacionalidad == "Costa Rica" ~ "costa_rica",
                                  nacionalidad == "Côte D'Ivoire" ~ "costa_de_marfil",
                                  nacionalidad == "Croacia" ~ "croacia",
                                  nacionalidad == "Cuba" ~ "cuba",
                                  nacionalidad == "Dinamarca" ~ "dinamarca",
                                  nacionalidad == "Dominica" ~ "dominica",
                                  nacionalidad == "Ecuador" ~ "ecuador",
                                  nacionalidad == "Egipto" ~ "egipto",
                                  nacionalidad == "El Salvador" ~ "el_salvador",
                                  nacionalidad == "Emiratos Árabes Unidos" ~ "emiratos_arabes_unidos",
                                  nacionalidad == "Eritrea" ~ "eritrea",
                                  nacionalidad == "Eslovaquia" ~ "eslovaquia",
                                  nacionalidad == "Eslovenia" ~ "eslovenia",
                                  nacionalidad == "España" ~ "espana",
                                  nacionalidad == "Estado Plurinacional de Bolivia" ~ "bolivia",
                                  nacionalidad == "Estados Federados de Micronesia" ~ "micronesia_rep",
                                  nacionalidad == "Estados Unidos de América" ~ "estados_unidos",
                                  nacionalidad == "Estonia" ~ "estonia",
                                  nacionalidad == "Etiopia" ~ "etiopia",
                                  nacionalidad == "Ex República Yugoslava De Macedonia" ~ "macedonia",
                                  nacionalidad == "Federación De Rusia" ~ "rusia",
                                  nacionalidad == "Fiji" ~ "fiyi_islas",
                                  nacionalidad == "Filipinas" ~ "filipinas",
                                  nacionalidad == "Finlandia" ~ "finlandia",
                                  nacionalidad == "Francia" ~ "francia",
                                  nacionalidad == "Gabón" ~ "gabon",
                                  nacionalidad == "Gambia" ~ "gambia",
                                  nacionalidad == "Georgia" ~ "georgia",
                                  nacionalidad == "Ghana" ~ "ghana",
                                  nacionalidad == "Granada" ~ "granada",
                                  nacionalidad == "Grecia" ~ "grecia",
                                  nacionalidad == "Guatemala" ~ "guatemala",
                                  nacionalidad == "Guinea" ~ "guinea",
                                  nacionalidad == "Guinea Bissau" ~ "guinea_bissau",
                                  nacionalidad == "Guinea Ecuatorial" ~ "guinea_ecuatorial",
                                  nacionalidad == "Guyana" ~ "guyana",
                                  nacionalidad == "Haití" ~ "haiti",
                                  nacionalidad == "Honduras" ~ "honduras",
                                  nacionalidad == "Hungría" ~ "hungria",
                                  nacionalidad == "India" ~ "india",
                                  nacionalidad == "Indonesia" ~ "indonesia",
                                  nacionalidad == "Iraq" ~ "irak",
                                  nacionalidad == "Irlanda" ~ "irlanda",
                                  nacionalidad == "Islandia" ~ "islandia",
                                  nacionalidad == "Islas Caimán" ~ "caiman_islas",
                                  nacionalidad == "Islas Marshall" ~ "marshall_islas",
                                  nacionalidad == "Islas Reunion"~ "reunion_islas",
                                  nacionalidad == "Israel" ~ "israel",
                                  nacionalidad == "Italia" ~ "italia",
                                  nacionalidad == "Jamaica" ~ "jamaica",
                                  nacionalidad == "Japón" ~ "japon",
                                  nacionalidad == "Jordania" ~ "jordania",
                                  nacionalidad == "Kazajstan" ~ "kazajistan",
                                  nacionalidad == "Kenia" ~ "kenia",
                                  nacionalidad == "Kirguistán" ~ "kirguistan",
                                  nacionalidad == "Kuwait" ~ "kuwait",
                                  nacionalidad == "Lesotho" ~ "lesoto",
                                  nacionalidad == "Letonia" ~ "letonia",
                                  nacionalidad == "Líbano" ~ "libano",
                                  nacionalidad == "Liberia" ~ "liberia",
                                  nacionalidad == "Libia" ~ "libia",
                                  nacionalidad == "Lituania" ~ "lituania",
                                  nacionalidad == "Luxemburgo" ~ "luxemburgo",
                                  nacionalidad == "Madagascar" ~ "madagascar",
                                  nacionalidad == "Malasia" ~ "malasia",
                                  nacionalidad == "Malawi" ~ "malaui",
                                  nacionalidad == "Mali" ~ "mali",
                                  nacionalidad == "Malta" ~ "malta",
                                  nacionalidad == "Marruecos" ~ "marruecos",
                                  nacionalidad == "Mauricio" ~ "mauricio",
                                  nacionalidad == "Mauritania" ~ "mauritania",
                                  nacionalidad == "Mongolia" ~ "mongolia",
                                  nacionalidad == "Montenegro" ~ "montenegro",
                                  nacionalidad == "Mozambique" ~ "mozambique",
                                  nacionalidad == "Myanmar" ~ "mianmar_birmania",
                                  nacionalidad == "Namibia" ~ "namibia",
                                  nacionalidad == "Nicaragua" ~ "nicaragua",
                                  nacionalidad == "Nigeria" ~ "nigeria",
                                  nacionalidad == "Noruega" ~ "noruega",
                                  nacionalidad == "Nueva Zelandia" ~ "nueva_zelandia",
                                  nacionalidad == "Oman" ~ "oman",
                                  nacionalidad == "Países Bajos" ~ "paises_bajos_holanda",
                                  nacionalidad == "Pakistán" ~ "pakistan",
                                  nacionalidad == "Palestina" ~ "palestina",
                                  nacionalidad == "Panamá" ~ "panama",
                                  nacionalidad == "Papua Nueva Guinea" ~ "papua_nueva_guinea",
                                  nacionalidad == "Paraguay" ~ "paraguay",
                                  nacionalidad == "Perú" ~ "peru",
                                  nacionalidad == "Polonia" ~ "polonia",
                                  nacionalidad == "Portugal" ~ "portugal",
                                  nacionalidad == "Qatar" ~ "qatar",
                                  nacionalidad == "Región Administrativa Especial De Macao" ~ "macao",
                                  nacionalidad == "Región Administrativa Especial Hong Kong"~ "hong_kong_china",
                                  nacionalidad == "Reino Unido de Gran Bretaña e Irlanda del Norte"~ "reino_unido",
                                  nacionalidad == "República Árabe de Siria" ~ "siria",
                                  nacionalidad == "República Árabe Saharaui Democrática" ~ "saharaui_rep_arabe",
                                  nacionalidad == "República Bolivariana de Venezuela" ~ "venezuela",
                                  nacionalidad == "República Centroafricana" ~ "centroafricana_rep",
                                  nacionalidad == "República Checa" ~ "checa_rep",
                                  nacionalidad == "República de Corea" ~ "corea_rep_sur",
                                  nacionalidad == "República de Moldova" ~ "moldavia",
                                  nacionalidad == "República Democrática del Congo" ~ "congo_rep_dem",
                                  nacionalidad == "República Democrática Popular de Lao" ~ "laos",
                                  nacionalidad == "República Dominicana" ~ "dominicana_rep",
                                  nacionalidad == "República Federal Democrática de Nepal" ~ "nepal",
                                  nacionalidad == "República Islámica del Irán" ~ "iran",
                                  nacionalidad == "República Unida de Tanzania" ~ "tanzania",
                                  nacionalidad == "Rumania" ~ "rumania",
                                  nacionalidad == "Rwanda" ~ "ruanda",
                                  nacionalidad == "Saint Kitts y Nevis" ~ "san_cristobal_y_nieves",
                                  nacionalidad == "Samoa" ~ "samoa_occidental",
                                  nacionalidad == "San Vicente y Las Granadinas" ~ "san_vicente_y_las_granadinas",
                                  nacionalidad == "Santa Lucía" ~ "santa_lucia",
                                  nacionalidad == "Santo Tomé y Príncipe" ~ "santo_tome_y_principe",
                                  nacionalidad == "Senegal" ~ "senegal",
                                  nacionalidad == "Serbia" ~ "serbia",
                                  nacionalidad == "Sierra Leona" ~ "sierra_leona",
                                  nacionalidad == "Singapur" ~ "singapur",
                                  nacionalidad == "Somalia" ~ "somalia",
                                  nacionalidad == "Sri Lanka" ~ "sri_lanka",
                                  nacionalidad == "Sudáfrica" ~ "sudafrica",
                                  nacionalidad == "Sudán" ~ "sudan",
                                  nacionalidad == "Suecia" ~ "suecia",
                                  nacionalidad == "Suiza" ~ "suiza",
                                  nacionalidad == "Suriname" ~ "surinam",
                                  nacionalidad == "Tailandia" ~ "tailandia",
                                  nacionalidad == "Taiwan (Provincia de China)" ~ "taiwan",
                                  nacionalidad == "Tayikistán" ~ "tayikistan",
                                  nacionalidad == "Togo" ~ "togo",
                                  nacionalidad == "Trinidad y Tobago" ~ "trinidad_y_tobago",
                                  nacionalidad == "Túnez" ~ "tunez",
                                  nacionalidad == "Turkmenistan" ~ "turkmenistan",
                                  nacionalidad == "Turquía" ~ "turquia",
                                  nacionalidad == "Ucrania" ~ "ucrania",
                                  nacionalidad == "Uganda" ~ "uganda",
                                  nacionalidad == "Uruguay" ~ "uruguay",
                                  nacionalidad == "Uzbekistán" ~ "uzbekistan",
                                  nacionalidad == "Vietnam" ~ "vietnam",
                                  nacionalidad == "Yemen" ~ "yemen",
                                  nacionalidad == "Zambia" ~ "zambia",
                                  nacionalidad == "Zimbabwe" ~ "zimbabue")) %>%
  rename(pais = nacionalidad) %>%
  arrange(ano, aeropuerto, pais)


#
#
#
#
#
#
# #END
#
