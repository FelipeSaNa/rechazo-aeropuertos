# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Exploratory Data Analysis part 2
# =============================================

#visits data

visitas_octubre = visitas %>%
    filter(mes == "Octubre") %>%
    tabyl(grupo) %>%
    arrange(desc(n))

visitas_octubre %>%
    select(n) %>%
    sum()

visitas_septiembre = visitas %>%
    filter(mes == "Septiembre") %>%
    tabyl(grupo) %>%
    arrange(desc(n))
visitas_septiembre %>%
    select(n) %>%
    sum()


ingresos = sexo_edad %>%
    group_by(aeropuerto) %>%
    summarize(ingresos = sum(ingresos))

ingresos %>% filter(aeropuerto == "cdmx" | aeropuerto == "cancun") %>%
    select(ingresos) %>%
    sum()

tabulado_all = tabulado_all %>%
    mutate(n = replace_na(n, 0))

discrep = tabulado_all %>%
    mutate(discrepancias = n - numero_new) %>%
    filter(discrepancias != 0) %>%
    print()

#merging with visa data
data_no_visa = sexo_edad %>%
    filter(visa == "no") %>%
    group_by(pais) %>%
    summarize(total_rechazos = sum(total_general),
              total_ingresos = sum(ingresos)) %>%
    mutate(tasa_10_ingresos = (total_rechazos/total_ingresos)*100,
           tasa_10_ingresos = round(tasa_10_ingresos, 2)) %>%
    arrange(desc(tasa_10_ingresos))

data_no_visa_ecuador = sexo_edad %>%
    filter(visa == "no") %>%
    filter(ano > 2018 & ano < 2021) %>%
    group_by(pais) %>%
    summarize(total_rechazos = sum(total_general),
              total_ingresos = sum(ingresos)) %>%
    mutate(tasa_10_ingresos = (total_rechazos/total_ingresos)*100,
           tasa_10_ingresos = round(tasa_10_ingresos, 2)) %>%
    arrange(desc(tasa_10_ingresos))


#total rejections per 10 entries and nationality graphs
data_nacionalidad = sexo_edad %>%
    group_by(pais) %>%
    summarize(total_rechazos = sum(total_general),
              total_ingresos = sum(ingresos),
              total_mujeres = sum(menor_mujer + mayor_mujer),
              total_hombres = sum(menor_hombre + mayor_hombre),
              total_mujeres_mayor = sum(mayor_mujer),
              total_mujeres_menor = sum(menor_mujer),
              total_hombres_mayor = sum(mayor_hombre),
              total_hombres_menor = sum(menor_hombre)) %>%
    mutate(tasa_10_ingresos = (total_rechazos/total_ingresos)*100,
           tasa_10_ingresos = round(tasa_10_ingresos, 2)) %>%
    arrange(desc(tasa_10_ingresos))

#graphing nationalities rejections rate
# data_nacionalidad %>%
#     filter(!is.na(tasa_10_ingresos)) %>%
#     filter(total_rechazos >10) %>%
#     arrange(tasa_10_ingresos) %>%
#     tail(15) %>%
#     mutate(pais=factor(pais, pais)) %>%
#     ggplot(aes(x=pais, y=tasa_10_ingresos) ) +
#     geom_bar(stat="identity", fill="#69b3a2") +
#     coord_flip() +
#     theme_minimal() +
#     theme(
#         panel.grid.minor.y = element_blank(),
#         panel.grid.major.y = element_blank(),
#         legend.position="none",
#         plot.title = element_text(size=12),
#         plot.subtitle = element_text(size=10)) +
#     labs(title = "México: Tasa de rechazos ocurridos por cada 100 ingresos entre 2017 y 2021",
#          subtitle = "Desagregación por nacionalidades más frecuentes que no requieren visa",
#          caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB")+
#     xlab("") +
#     ylab("Total de rechazos por cada 10 entradas en aeropuertos")
# ggsave("grafica_tasas.png", path = here("plots"))


#graphing nationalities rejections rate for countries visa is not needed
data_no_visa %>%
    filter(!is.na(tasa_10_ingresos)) %>%
    filter(pais != "ecuador") %>%
    filter(total_rechazos >= 10) %>%
    arrange(tasa_10_ingresos) %>%
    tail(15) %>%
    mutate(pais=factor(pais, pais)) %>%
    ggplot( aes(x=pais, y=tasa_10_ingresos) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=tasa_10_ingresos), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    coord_flip() +
    theme_minimal() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="none",
        plot.title = element_text(size=12),
        plot.subtitle = element_text(size=10)) +
    labs(title = "México: Tasa de rechazos ocurridos por cada 100 ingresos entre 2017 y 2021",
         subtitle = "Desagregación por nacionalidades más frecuentes que no requieren visa",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB")+
    xlab("") +
    ylab("Total de rechazos por cada 10 ingresos en aeropuertos")
ggsave("grafica_tasas_no_visa.png", path = here("plots"))



data_no_visa_ecuador %>%
    filter(!is.na(tasa_10_ingresos)) %>%
    filter(pais != "ecuador") %>%
    filter(total_rechazos >= 10) %>%
    arrange(tasa_10_ingresos) %>%
    tail(15) %>%
    mutate(pais=factor(pais, pais)) %>%
    ggplot( aes(x=pais, y=tasa_10_ingresos) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=tasa_10_ingresos), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    coord_flip() +
    theme_minimal() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="none",
        plot.title = element_text(size=12),
        plot.subtitle = element_text(size=10)) +
    labs(title = "México: Tasa de rechazos ocurridos por cada 100 ingresos entre 2019 y 2020",
         subtitle = "Desagregación por nacionalidades más frecuentes que no requieren visa",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB")+
    xlab("") +
    ylab("Total de rechazos por cada 10 entradas en aeropuertos")
ggsave("grafica__ecudaor_tasas_no_visa.png", path = here("plots"))






dataprueba = sexo_edad %>%
    group_by(pais) %>%
    summarize(rechazos = sum(total_general))


#graphing nationalities rejections
data_nacionalidad %>%
    filter(!is.na(total_rechazos)) %>%
    arrange(total_rechazos) %>%
    tail(15) %>%
    mutate(pais=factor(pais, pais)) %>%
    ggplot(aes(x=pais, y=total_rechazos) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=total_rechazos), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    coord_flip() +
    theme_minimal() +
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

#graphing nationalities rejections for countries were visa is not requiresd
data_no_visa %>%
    filter(!is.na(total_rechazos)) %>%
    arrange(total_rechazos) %>%
    tail(15) %>%
    mutate(pais=factor(pais, pais)) %>%
    ggplot( aes(x=pais, y=total_rechazos) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=total_rechazos), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    coord_flip() +
    theme_minimal() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="none",
        plot.title = element_text(size=12),
        plot.subtitle = element_text(size=10)) +
    labs(title = "México: Rechazos ocurridos en aeropuertos entre 2017 y 2021",
         subtitle = "Desagregación por nacionalidades más frecuentes que no requieren visa",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB")+
    xlab("") +
    ylab("Total de eventos")
ggsave("grafica_nacionalidades_no_visa.png", path = here("plots"))


#total grouping by years
data_anual = sexo_edad %>%
    group_by(ano) %>%
    summarize(total_eventos = sum(total_general))
#graphing rejections by year
data_anual %>%
    filter(!is.na(total_eventos)) %>%
    arrange(total_eventos) %>%
    tail(20) %>%
    mutate(ano=factor(ano, ano)) %>%
    ggplot( aes(x=ano, y=total_eventos) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=total_eventos), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    coord_flip() +
    theme_minimal() +
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


# data grouping by aeropuerto
data_aeropuerto = sexo_edad %>%
    group_by(aeropuerto) %>%
    summarize(total_rechazos = sum(total_general),
              total_ingresos = sum(ingresos)) %>%
    mutate(tasa_10_ingresos = (total_rechazos/total_ingresos)*100,
           tasa_10_ingresos = round(tasa_10_ingresos, 2)) %>%
    arrange(desc(tasa_10_ingresos))

#graphing airport rejections
data_aeropuerto %>%
    filter(!is.na(total_rechazos)) %>%
    arrange(total_rechazos) %>%
    tail(15) %>%
    mutate(aeropuerto=factor(aeropuerto, aeropuerto)) %>%
    ggplot(aes(x=aeropuerto, y=total_rechazos) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    geom_text(aes(label=total_rechazos), vjust=1, hjust =1,check_overlap = T, size = 3, color= "black")+
    coord_flip() +
    theme_minimal() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="none",
        plot.title = element_text(size=12),
        plot.subtitle = element_text(size=10)) +
    labs(title = "México: Rechazos ocurridos en aeropuertos entre 2017 y 2021",
         subtitle = "Desagregación por aeropuertos más frecuentes",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB")+
    xlab("") +
    ylab("Total de eventos")
ggsave("grafica_aeropuertos.png", path = here("plots"))


# #data grouping by country of origin
# data_nacionalidad = data_all %>%
#     group_by(pais) %>%
#     # filter(ano < 2021) %>%
#     # filter(aeropuerto == "cdmx" | aeropuerto == "cancun") %>%
#     summarize(total_eventos = sum(eventos_de_rechazo)) %>%
#     arrange(desc(total_eventos))

#rechazos by sexo

# data_no_visa = sexo_edad %>%
#     filter(visa == "no") %>%
#     group_by(pais) %>%
#     summarize(total_rechazos = sum(total_general),
#               total_ingresos = sum(ingresos),
#               total_mujeres = sum(menor_mujer + mayor_mujer),
#               total_hombres = sum(menor_hombre + mayor_hombre),
#               total_personas = sum(total_hombres, total_mujeres, na.rm = T),
#               total_mujeres_mayor = sum(mayor_mujer),
#               total_mujeres_menor = sum(menor_mujer),
#               total_hombres_mayor = sum(mayor_hombre),
#               total_hombres_menor = sum(menor_hombre)) %>%
#     mutate(tasa_10_ingresos = (total_rechazos/total_ingresos)*100,
#            tasa_10_ingresos = round(tasa_10_ingresos, 2)) %>%
#     arrange(desc(tasa_10_ingresos))

data_no_visa = sexo_edad %>%
    filter(visa == "no") %>%
    group_by(pais) %>%
    summarize(total_rechazos = sum(total_general),
              total_ingresos = sum(ingresos),
              total_mujeres = sum(menor_mujer + mayor_mujer),
              total_hombres = sum(menor_hombre + mayor_hombre),
              total_mujeres_mayor = sum(mayor_mujer),
              total_mujeres_menor = sum(menor_mujer),
              total_hombres_mayor = sum(mayor_hombre),
              total_hombres_menor = sum(menor_hombre),
              total_personas = sum(total_hombres_mayor, total_mujeres, na.rm = T)) %>%
    mutate(tasa_10_ingresos = (total_rechazos/total_ingresos)*100,
           tasa_10_ingresos = round(tasa_10_ingresos, 2),
           proporcion_hombres_mayores = round((total_hombres_mayor/total_rechazos)*100),
           proporcion_mujeres = round((total_mujeres/total_rechazos)*100)) %>%
    arrange(desc(tasa_10_ingresos)) %>%
    pivot_longer(cols= c(total_mujeres_mayor,
                         total_mujeres_menor,
                         total_hombres_mayor,
                         total_hombres_menor),names_to = "grupo") %>%
    mutate(grupo = case_when(grupo == "total_mujeres_mayor" ~ "mujeres mayores",
                             grupo == "total_mujeres_menor" ~ "mujeres menores",
                             grupo == "total_hombres_mayor" ~ "hombres mayores",
                             grupo == "total_hombres_menor" ~ "hombres menores"))


data_no_visa %>%
    filter(!is.na(total_rechazos)) %>%
    filter(pais == "congo_rep_dem"|
               pais == "ecuador"|
               pais == "rumania"|
               pais == "venezuela"|
               pais == "jamaica"|
               pais == "colombia"|
               pais == "zimbabue"|
               pais == "brasil"|
               pais == "peru"|
               pais == "bielorrusia"|
               pais == "bahamas_commonwealth"|
               pais == "bolivia"|
               pais == "malasia"|
               pais == "bosnia_herzegovina"|
               pais == "grecia") %>%
    # arrange(total_rechazos) %>%
    # mutate(pais=factor(pais, pais)) %>%
    ggplot(aes(x=pais, y=value, fill=grupo, label = value)) +
    geom_bar(position = "fill", stat = "identity") +
    # geom_text(aes(label = value))+
    coord_flip()



data_no_visa2 = sexo_edad %>%
    filter(visa == "no") %>%
    group_by(pais) %>%
    summarize(total_rechazos = sum(total_general),
              total_ingresos = sum(ingresos),
              total_mujeres = sum(menor_mujer + mayor_mujer),
              total_hombres = sum(menor_hombre + mayor_hombre),
              total_mujeres_mayor = sum(mayor_mujer),
              total_mujeres_menor = sum(menor_mujer),
              total_hombres_mayor = sum(mayor_hombre),
              total_hombres_menor = sum(menor_hombre),
              total_personas = sum(total_hombres_mayor, total_mujeres, na.rm = T)) %>%
    mutate(tasa_10_ingresos = (total_rechazos/total_ingresos)*100,
           tasa_10_ingresos = round(tasa_10_ingresos, 2),
           proporcion_hombres_mayores = (total_hombres_mayor/total_rechazos)*100,
           proporcion_mujeres_mayores = (total_mujeres_mayor/total_rechazos)*100,
           proporcion_hombres_menores = (total_hombres_menor/total_rechazos)*100,
           proporcion_mujeres_menores = (total_mujeres_menor/total_rechazos)*100)%>%
    arrange(desc(tasa_10_ingresos)) %>%
    pivot_longer(cols= c(proporcion_mujeres_menores,
                         proporcion_mujeres_mayores,
                         proporcion_hombres_menores,
                         proporcion_hombres_mayores),names_to = "grupo")%>%
    mutate(grupo = case_when(grupo == "proporcion_mujeres_mayores" ~ "mujeres mayores de edad",
                             grupo == "proporcion_mujeres_menores" ~ "mujeres menores de edad",
                             grupo == "proporcion_hombres_mayores" ~ "hombres mayores de edad",
                             grupo == "proporcion_hombres_menores" ~ "hombres menores de edad"),
           value = round(value))




data_no_visa2%>%
    filter(pais == "congo_rep_dem"|
               pais == "ecuador"|
               pais == "rumania"|
               pais == "venezuela"|
               pais == "jamaica"|
               pais == "colombia"|
               pais == "zimbabue"|
               pais == "brasil"|
               pais == "peru"|
               pais == "bielorrusia"|
               pais == "bahamas_commonwealth"|
               pais == "bolivia"|
               pais == "malasia"|
               pais == "bosnia_herzegovina"|
               pais == "grecia") %>%
    # arrange(total_rechazos) %>%
    # mutate(pais=factor(pais, pais)) %>%
    ggplot(aes(x=pais, y=value, fill=grupo)) +
    geom_bar(position = "fill", stat = "identity") +
    coord_flip()+
    theme_minimal()+
    labs(title = "México: Rechazos ocurridos en aeropuertos entre 2017 y 2021",
         subtitle = "Desagregación por sexo y edad de las personas rechazadas",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB")+
    ylab("Porcentaje")+
    xlab("") +
    geom_text(aes(label=value), vjust=0.5, hjust = 1.5,check_overlap = T, size = 3, color= "black", position = "fill")+
    theme(plot.caption = element_text(hjust = 0.5))+
    theme(legend.title=element_blank())+
    theme(plot.title = element_text(hjust = 0.5))


ggsave("grafica_sexo_edad.png", path = here("plots"))



















# grupo = case_when(total_mujeres > 0  ~ "mujer",
#                   total_hombres > 0 ~ "hombre" ))













#graph of country of origin by year
# data_all %>%
#     group_by(aeropuerto) %>%
#     summarise(sum(eventos_de_rechazo)) %>%
#     print()
#
# #summary statistics of eventos
# data_all %>%
#     summarize(sum(eventos_de_rechazo)) %>%
#     print()






#END
