# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Exploratory Data Analysis
# =============================================

#total rejections per 10 entries and nationality graphs
data_nacionalidad = data_all %>%
    group_by(pais) %>%
    summarize(total_rechazos = sum(eventos_de_rechazo),
              total_ingresos = sum(ingresos)) %>%
    mutate(tasa_10_ingresos = (total_rechazos/total_ingresos)*10,
           tasa_10_ingresos = round(tasa_10_ingresos, 2)) %>%
    arrange(desc(total_rechazos))

#graphing nationalities rejections rate
data_nacionalidad %>%
    filter(!is.na(tasa_10_ingresos)) %>%
    arrange(tasa_10_ingresos) %>%
    tail(20) %>%
    mutate(pais=factor(pais, pais)) %>%
    ggplot( aes(x=pais, y=tasa_10_ingresos) ) +
    geom_bar(stat="identity", fill="#69b3a2") +
    coord_flip() +
    theme_ipsum() +
    theme(
        panel.grid.minor.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position="none",
        plot.title = element_text(size=12),
        plot.subtitle = element_text(size=10)) +
    labs(title = "México: Tasa de rechazos ocurridos por cada 10 ingresos entre 2017 y 2021",
         subtitle = "Desagregación por nacionalidades más frecuentes",
         caption = "Elaboración propia con información de la Dirección de Estadística del Centro de Estudios Migratorios de SEGOB")+
    xlab("") +
    ylab("Total de rechazos por cada 10 entradas en aeropuertos")
ggsave("grafica_tasas.png", path = here("plots"))

#graphing nationalities rejections
data_nacionalidad %>%
    filter(!is.na(total_rechazos)) %>%
    arrange(total_rechazos) %>%
    tail(20) %>%
    mutate(pais=factor(pais, pais)) %>%
    ggplot( aes(x=pais, y=total_rechazos) ) +
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



#total grouping by years
data_anual = data_all %>%
    group_by(ano) %>%
    summarize(total_eventos = sum(eventos_de_rechazo))
#graphing rejections by year
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

# data grouping by aeropuerto
data_aeropuerto= data_all %>%
    group_by(aeropuerto) %>%
    # filter(ano < 2021) %>%
    # filter(aeropuerto == "cdmx" | aeropuerto == "cancun") %>%
    summarize(total_rechazos = sum(eventos_de_rechazo),
              total_ingresos = sum(ingresos)) %>%
    mutate(tasa_10_ingresos = (total_rechazos/total_ingresos)*10,
           tasa_10_ingresos = round(tasa_10_ingresos, 2)) %>%
    arrange(desc(total_rechazos))



# #data grouping by country of origin
# data_nacionalidad = data_all %>%
#     group_by(pais) %>%
#     # filter(ano < 2021) %>%
#     # filter(aeropuerto == "cdmx" | aeropuerto == "cancun") %>%
#     summarize(total_eventos = sum(eventos_de_rechazo)) %>%
#     arrange(desc(total_eventos))

#graph of country of origin by year
data_all %>%
    group_by(aeropuerto) %>%
    summarise(sum(eventos_de_rechazo)) %>%
    print()

#summary statistics of eventos
data_all %>%
    summarize(sum(eventos_de_rechazo)) %>%
    print()






#END
