# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Exploratory Data Analysis
# =============================================

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

#end
