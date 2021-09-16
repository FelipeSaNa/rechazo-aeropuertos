# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Exploratory Data Analysis
# =============================================

#total grouping by years
data_anual = data_all %>%
    group_by(ano, aeropuerto) %>%
    summarize(total_eventos = sum(eventos_de_rechazo)) %>%
    filter(aeropuerto == "cdmx" | aeropuerto =="cancun")

#data grouping by country of origin
data_nacionalidad = data_all %>%
    # group_by(pais) %>%
    filter(aeropuerto == "cdmx" | aeropuerto == "cancun")

#graph of country of origin by year
data_nacionalidad %>%
    filter(ano == 2017)

