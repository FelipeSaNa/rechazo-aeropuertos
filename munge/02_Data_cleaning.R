# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Data Cleaning and Merging
# =============================================

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

#end

