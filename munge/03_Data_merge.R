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
    replace(is.na(.), 0)

#remove not needed data
rm(data_2017, data_2018, data_2019, data_2020, data_2021)

#save clean and merged database in various formats
save(data_all, file = here("data","clean","eventos_rechazo_agosto2021.RDS"))
write_xlsx(data_all, here("data","clean","eventos_rechazo_agosto2021.xlsx"))
write_csv(data_all, here("data","clean","eventos_rechazo_agosto2021.csv"))
