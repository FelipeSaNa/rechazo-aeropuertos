# Author: FSN
# Maintainers: FSN
# Copyright:   2021, FSN GPL v2 or later
# Data Import
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

#END