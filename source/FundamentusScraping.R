    library(tidyverse)
library(rvest)
library(httr)
library(xlsx)
library(plyr)

# #fundamentos
# url2 <-paste0("http://www.fundamentus.com.br/detalhes.php?papel=","WEGE3")
# # rvest
# h2 <- read_html(url2)
# 
# # encoding = ""
# #read_xml(x, encoding = "", ..., as_html = FALSE, options = "NOBLANKS")
# 
# tab2 <- h2 %>% html_nodes("table")
# 
# 
# tab1_html <- tab2[[1]] %>% html_table
# tab2_html <- tab2[[2]] %>% html_table
# tab3_html <- tab2[[3]] %>% html_table
# tab4_html <- tab2[[4]] %>% html_table
# tab5_html <- tab2[[5]] %>% html_table
# 
# 
# #Verificar como Colocar os anos das oscilações de modo automático
# 
# # fundamentos <- c("Papel", "Tipo", "Empresa", "Setor", "Subsetor", "Valor de mercado", "Valor da firma", "Cotação", "Data última cotação",
# #        "Min 52 sem", "Max 52 sem", "Volor méd (2m)", "Último balanço processado", "Nro. Ações", "Oscilação Dia", "Oscilação Mês", 
# #        "Oscilação 30 dias", "Oscilação 12 meses", "Oscilação 2019", "Oscilação 2018", "Oscilação 2017", "Oscilação 2016", "Oscilação 2015", 
# #        "Oscilação 2014", "Ativo", "Disponibilidades", "Ativo Circulante", "Dív. Bruta", "Dív. Líquida", "Patrim. Líq", 
# #        "Receita Líquida 12 meses", "EBIT 12 meses", "Lucro Líquido 12 meses", "Receita Líquida 3 meses", "EBIT 3 meses", 
# #        "Lucro Líquido 3 meses", "P/L", "P/VP", "P/EBIT", "PSR", "P/Ativos", "P/Cap. Giro", "P/Ativ Circ Liq", "Div. Yield", 
# #        "EV / EBIT", "Giro Ativos", "Cres. Rec (5a)", "LPA", "VPA", "Marg. Bruta", "Marg. EBIT", "Marg. Líquida", "EBIT / Ativo", 
# #        "ROIC", "ROE", "Liquidez Corr", "Div Br/ Patrim")
# 
# 
# 
# # Papel <- " "
# # Tipo <- " "
# # Empresa <- " "
# # Setor <- " "
# # Subsetor <- " "
# # Valor_de_mercado <- " "
# # Valor_da_firma <- " "
# # Cotacao <- " "
# # Data_ultima_cotacao <- " "
# # Min_52_sem <- " "
# # Max_52_sem <- " "
# # Vol_med_2m <- " "
# # ultimo_balanco_processado <- " "
# # Nro_Acoes <- " "
# # Oscilacao_Dia <- " "
# # Oscilacao_Mes <- " "
# # Oscilacao_30_dias <- " "
# # Oscilacao_12_meses <- " "
# # Oscilacao_2019 <- " "
# # Oscilacao_2018 <- " "
# # Oscilacao_2017 <- " "
# # Oscilacao_2016 <- " "
# # Oscilacao_2015 <- " "
# # Oscilacao_2014 <- " "
# # Ativo <- " "
# # Disponibilidades <- " "
# # Ativo_Circulante <- " "
# # Div_Bruta <- " "
# # Div_Liquida <- " "
# # Patrim_Liq <- " "
# # Receita_Liquida_12_meses <- " "
# # EBIT_12_meses <- " "
# # Lucro_Liquido_12_meses <- " "
# # Receita_Liquida_3_meses <- " "
# # EBIT_3_meses <- " "
# # Lucro_Liquido_3_meses <- " "
# # PL <- " "
# # PVP <- " "
# # PEBIT <- " "
# # PSR <- " "
# # PAtivos <- " "
# # PCap_Giro <- " "
# # PAtiv_Circ_Liq <- " "
# # Div_Yield <- " "
# # EV_EBIT <- " "
# # Giro_Ativos <- " "
# # Cres_Rec_5a <- " "
# # LPA <- " "
# # VPA <- " "
# # Marg_Bruta <- " "
# # Marg_EBIT <- " "
# # Marg_Liquida <- " "
# # EBIT_Ativo <- " "
# # ROIC <- " "
# # ROE <- " "
# # Liquidez_Corr <- " "
# # Div_Br_Patrim <- " "
# 
# # Papel,	Tipo,	Empresa,	Setor,	Subsetor,	Valor_de_mercado,	Valor_da_firma,	Cotacao,	Data_ultima_cotacao,	Min_52_sem,	Max_52_sem,	Vol_med_2m,	ultimo_balanco_processado,	Nro_Acoes,	Oscilacao_Dia,	Oscilacao_Mes,	Oscilacao_30_dias,	Oscilacao_12_meses,	Oscilacao_2019,	Oscilacao_2018,	Oscilacao_2017,	Oscilacao_2016,	Oscilacao_2015,	Oscilacao_2014,	Ativo,	Disponibilidades,	Ativo_Circulante,	Div_Bruta,	Div_Liquida,	Patrim_Liq,	Receita_Liquida_12_meses,	EBIT_12_meses,	Lucro_Liquido_12_meses,	Receita_Liquida_3_meses,	EBIT_3_meses,	Lucro_Liquido_3_meses,	PL,	PVP,	PEBIT,	PSR,	PAtivos,	PCap_Giro,	PAtiv_Circ_Liq,	Div_Yield,	EV_EBIT,	Giro_Ativos,	Cres_Rec_5a,	LPA,	VPA,	Marg_Bruta,	Marg_EBIT,	Marg_Liquida,	EBIT_Ativo,	ROIC,	ROE,	Liquidez_Corr,	Div_Br_Patrim,
# 
# 
# 
# # tab1_html
# # X1                             X2              X3         X4
# # 1    ?Papel                          WEGE3        ?Cotação      22,80
# # 2     ?Tipo                          ON N1   ?Data últ cot 16/08/2019
# # 3  ?Empresa                   WEG SA ON N1     ?Min 52 sem      16,59
# # 4    ?Setor        Máquinas e Equipamentos     ?Max 52 sem      24,44
# # 5 ?Subsetor Motores, Compressores e Outros ?Vol $ méd (2m) 76.060.200
# 
# 
# 
# Papel <- tab1_html[1,2]
# Tipo <- tab1_html[2,2]
# Empresa <- tab1_html[3,2]
# Setor <- tab1_html[4,2]
# Subsetor <- tab1_html[5,2]
# 
# Cotacao <- tab1_html[1,4]
# Data_ultima_cotacao <- tab1_html[2,4]
# Min_52_sem <- tab1_html[3,4]
# Max_52_sem <- tab1_html[4,4]
# Vol_med_2m <- tab1_html[5,4]
# 
# basic01 <- data.frame(Papel,	Tipo,	Empresa,	Setor,	Subsetor,	Cotacao,	Data_ultima_cotacao,	Min_52_sem,	Max_52_sem,	Vol_med_2m)
# 
# 
# # tab2_html
# # X1             X2                      X3            X4
# # 1 ?Valor de mercado 47.849.400.000 ?Últ balanço processado    30/06/2019
# # 2   ?Valor da firma 47.977.500.000             ?Nro. Ações 2.098.660.000
# 
# 
# Valor_de_mercado <- tab2_html[1,2]
# Valor_da_firma <- tab2_html[2,2]
# 
# ultimo_balanco_processado <- tab2_html[1,4]
# Nro_Acoes <- tab2_html[2,4]
# 
# 
# basic02 <- data.frame(Papel,Valor_de_mercado, Valor_da_firma, ultimo_balanco_processado, Nro_Acoes)
# 
# 
# #Df <- merge(basic01, basic02)
# 
# 
# # > tab3_html
# # X1         X2                           X3                           X4                           X5                           X6
# # 1  Oscilações Oscilações Indicadores fundamentalistas Indicadores fundamentalistas Indicadores fundamentalistas Indicadores fundamentalistas
# # 2         Dia      2,01%                         ?P/L                        33,87                         ?LPA                         0,67
# # 3         Mês     -4,28%                        ?P/VP                         5,97                         ?VPA                         3,82
# # 4     30 dias      1,65%                      ?P/EBIT                        25,15                 ?Marg. Bruta                        29,2%
# # 5    12 meses     31,03%                         ?PSR                         3,80                  ?Marg. EBIT                        15,1%
# # 6        2019     31,56%                    ?P/Ativos                         3,21               ?Marg. Líquida                        11,3%
# # 7        2018     -3,83%                 ?P/Cap. Giro                        10,87                ?EBIT / Ativo                        12,8%
# # 8        2017     58,21%             ?P/Ativ Circ Liq                        23,18                        ?ROIC                        16,8%
# # 9        2016      6,25%                  ?Div. Yield                         1,5%                         ?ROE                        17,6%
# # 10       2015     -1,65%                   ?EV / EBIT                        25,22               ?Liquidez Corr                         2,00
# # 11       2014     33,09%                 ?Giro Ativos                         0,84              ?Div Br/ Patrim                         0,36
# # 12                                    ?Cres. Rec (5a)                         8,3%                                                          
# # > 
# 
# 
# 
# 
# Oscilacao_Dia <- tab3_html[2,2]
# Oscilacao_Mes <- tab3_html[3,2]
# Oscilacao_30_dias <- tab3_html[4,2]
# Oscilacao_12_meses <- tab3_html[5,2]
# Oscilacao_2019 <- tab3_html[6,2]
# Oscilacao_2018 <- tab3_html[7,2]
# Oscilacao_2017 <- tab3_html[8,2]
# Oscilacao_2016 <- tab3_html[9,2]
# Oscilacao_2015 <- tab3_html[10,2]
# Oscilacao_2014 <- tab3_html[11,2]
# 
# oscilacao <- data.frame(Papel,Oscilacao_Dia,	Oscilacao_Mes,	Oscilacao_30_dias,	Oscilacao_12_meses,	Oscilacao_2019,	Oscilacao_2018,	Oscilacao_2017,	Oscilacao_2016,	Oscilacao_2015,	Oscilacao_2014)
# 
# 
# PL <- tab3_html[2,4]
# PVP <- tab3_html[3,4]
# PEBIT <- tab3_html[4,4]
# PSR <- tab3_html[5,4]
# PAtivos <- tab3_html[6,4]
# PCap_Giro <- tab3_html[7,4]
# PAtiv_Circ_Liq <- tab3_html[8,4]
# Div_Yield <- tab3_html[9,4]
# EV_EBIT <- tab3_html[10,4]
# Giro_Ativos <- tab3_html[11,4]
# Cres_Rec_5a <- tab3_html[12,4]
# 
# 
# 
# LPA <- tab3_html[2,6]
# VPA <- tab3_html[3,6]
# Marg_Bruta <- tab3_html[4,6]
# Marg_EBIT <- tab3_html[5,6]
# Marg_Liquida <- tab3_html[6,6]
# EBIT_Ativo <- tab3_html[7,6]
# ROIC <- tab3_html[8,6]
# ROE <- tab3_html[9,6]
# Liquidez_Corr <- tab3_html[10,6]
# Div_Br_Patrim <- tab3_html[11,6]
# 
# indicadores_fundamentos <- data.frame(Papel,PL,	PVP,	PEBIT,	PSR,	PAtivos,	PCap_Giro,	PAtiv_Circ_Liq,	Div_Yield,	EV_EBIT,	Giro_Ativos,	Cres_Rec_5a,	LPA,	VPA,	Marg_Bruta,	Marg_EBIT,	Marg_Liquida,	EBIT_Ativo,	ROIC,	ROE,	Liquidez_Corr,	Div_Br_Patrim)
# 
# 
# # > tab4_html
# # X1                        X2                        X3                        X4
# # 1 Dados Balanço Patrimonial Dados Balanço Patrimonial Dados Balanço Patrimonial Dados Balanço Patrimonial
# # 2                    ?Ativo            14.907.800.000               ?Dív. Bruta             2.910.830.000
# # 3         ?Disponibilidades             2.782.750.000             ?Dív. Líquida               128.081.000
# # 4         ?Ativo Circulante             8.803.480.000              ?Patrim. Líq             8.017.900.000
# 
# 
# Ativo <- tab4_html[2,2]
# Disponibilidades <- tab4_html[3,2]
# Ativo_Circulante <- tab4_html[4,2]
# 
# Div_Bruta <-tab4_html[2,4]
# Div_Liquida <- tab4_html[3,4]
# Patrim_Liq <- tab4_html[4,4]
# 
# 
# 
# b_patrimonial <- data.frame(Papel,Ativo, Disponibilidades, Ativo_Circulante,	Div_Bruta,	Div_Liquida,	Patrim_Liq)
# 
# 
# 
# 
# 
# # > tab5_html
# # X1                                 X2                                 X3                                 X4
# # 1 Dados demonstrativos de resultados Dados demonstrativos de resultados Dados demonstrativos de resultados Dados demonstrativos de resultados
# # 2                   Últimos 12 meses                   Últimos 12 meses                    Últimos 3 meses                    Últimos 3 meses
# # 3                   ?Receita Líquida                     12.581.000.000                   ?Receita Líquida                      3.286.610.000
# # 4                              ?EBIT                      1.902.560.000                              ?EBIT                        512.366.000
# # 5                     ?Lucro Líquido                      1.412.560.000                     ?Lucro Líquido                        389.002.000
#  
# 
# 
# 
# Receita_Liquida_12_meses <- tab5_html[2,2]
# EBIT_12_meses <-tab5_html[3,2]
# Lucro_Liquido_12_meses <- tab5_html[4,2]
# 
# 
# Receita_Liquida_3_meses <- tab5_html[2,4]
# EBIT_3_meses <- tab5_html[3,4]
# Lucro_Liquido_3_meses <- tab5_html[4,4]
# 
# 
# 
# demonstrativos <- data.frame(Papel,Receita_Liquida_12_meses,	EBIT_12_meses,	Lucro_Liquido_12_meses,	Receita_Liquida_3_meses,	EBIT_3_meses,	Lucro_Liquido_3_meses)
# 
# 
# 
# #######################################################################################################################
# 
# # plyr
# # resultados <- join_all(list(df1,df2,df3)) 
# tabela_fundamentos <- join_all(list(basic01, basic02, oscilacao, indicadores_fundamentos, b_patrimonial, demonstrativos))
# 
# 
# 
# 
# # Df1 <- merge(basic01, basic02)
# # 
# # Df2 <- merge(oscilacao, indicadores_fundamentos)
# # 
# # Df3 <- merge(b_patrimonial, demonstrativos)
# # 
# # 
# # Df4 <- merge(Df1, Df2)
# # 
# # Df5 <- merge(Df4, Df3)
# 

####################################################################################################################################




fundamentos_basic01 <- function(acao, tabela){
  
  # tab1_html
  # X1                             X2              X3         X4
  # 1    ?Papel                          WEGE3        ?Cotação      22,80
  # 2     ?Tipo                          ON N1   ?Data últ cot 16/08/2019
  # 3  ?Empresa                   WEG SA ON N1     ?Min 52 sem      16,59
  # 4    ?Setor        Máquinas e Equipamentos     ?Max 52 sem      24,44
  # 5 ?Subsetor Motores, Compressores e Outros ?Vol $ méd (2m) 76.060.200
  
  
  
  Papel <- acao
  Tipo <- tabela[2,2]
  Empresa <- tabela[3,2]
  Setor <- tabela[4,2]
  Subsetor <- tabela[5,2]
  
  Cotacao <- tabela[1,4]
  Data_ultima_cotacao <- tabela[2,4]
  Min_52_sem <- tabela[3,4]
  Max_52_sem <- tabela[4,4]
  Vol_med_2m <- tabela[5,4]
  
   basic01 <- data.frame(Papel,	Tipo,	Empresa,	Setor,	Subsetor,	Cotacao,	Data_ultima_cotacao,	Min_52_sem,	Max_52_sem,	Vol_med_2m)
   
   return(basic01)
  
  
}


fundamentos_basic02 <- function(acao, tabela){
  
  # tab2_html
  # X1             X2                      X3            X4
  # 1 ?Valor de mercado 47.849.400.000 ?Últ balanço processado    30/06/2019
  # 2   ?Valor da firma 47.977.500.000             ?Nro. Ações 2.098.660.000
  
  Papel <- acao
  Valor_de_mercado <- tabela[1,2]
  Valor_da_firma <- tabela[2,2]
  
  ultimo_balanco_processado <- tabela[1,4]
  Nro_Acoes <- tabela[2,4]
  
  
  basic02 <- data.frame(Papel,Valor_de_mercado, Valor_da_firma, ultimo_balanco_processado, Nro_Acoes)
  
  return(basic02)
  
}

fundamentos_oscilacao <- function(acao, tabela){
  
  # > tab3_html
  # X1         X2                           X3                           X4                           X5                           X6
  # 1  Oscilações Oscilações Indicadores fundamentalistas Indicadores fundamentalistas Indicadores fundamentalistas Indicadores fundamentalistas
  # 2         Dia      2,01%                         ?P/L                        33,87                         ?LPA                         0,67
  # 3         Mês     -4,28%                        ?P/VP                         5,97                         ?VPA                         3,82
  # 4     30 dias      1,65%                      ?P/EBIT                        25,15                 ?Marg. Bruta                        29,2%
  # 5    12 meses     31,03%                         ?PSR                         3,80                  ?Marg. EBIT                        15,1%
  # 6        2019     31,56%                    ?P/Ativos                         3,21               ?Marg. Líquida                        11,3%
  # 7        2018     -3,83%                 ?P/Cap. Giro                        10,87                ?EBIT / Ativo                        12,8%
  # 8        2017     58,21%             ?P/Ativ Circ Liq                        23,18                        ?ROIC                        16,8%
  # 9        2016      6,25%                  ?Div. Yield                         1,5%                         ?ROE                        17,6%
  # 10       2015     -1,65%                   ?EV / EBIT                        25,22               ?Liquidez Corr                         2,00
  # 11       2014     33,09%                 ?Giro Ativos                         0,84              ?Div Br/ Patrim                         0,36
  # 12                                    ?Cres. Rec (5a)                         8,3%                                                          
  # > 
  
  
  
  Papel <- acao
  Oscilacao_Dia <- tabela[2,2]
  Oscilacao_Mes <- tabela[3,2]
  Oscilacao_30_dias <- tabela[4,2]
  Oscilacao_12_meses <- tabela[5,2]
  Oscilacao_2019 <- tabela[6,2]
  Oscilacao_2018 <- tabela[7,2]
  Oscilacao_2017 <- tabela[8,2]
  Oscilacao_2016 <- tabela[9,2]
  Oscilacao_2015 <- tabela[10,2]
  Oscilacao_2014 <- tabela[11,2]
  
  oscilacao <- data.frame(Papel,Oscilacao_Dia,	Oscilacao_Mes,	Oscilacao_30_dias,	Oscilacao_12_meses,	Oscilacao_2019,	Oscilacao_2018,	Oscilacao_2017,	Oscilacao_2016,	Oscilacao_2015,	Oscilacao_2014)
  
  return(oscilacao)
}



fundamentos_indicadores <- function(acao, tabela){
  
  # > tab3_html
  # X1         X2                           X3                           X4                           X5                           X6
  # 1  Oscilações Oscilações Indicadores fundamentalistas Indicadores fundamentalistas Indicadores fundamentalistas Indicadores fundamentalistas
  # 2         Dia      2,01%                         ?P/L                        33,87                         ?LPA                         0,67
  # 3         Mês     -4,28%                        ?P/VP                         5,97                         ?VPA                         3,82
  # 4     30 dias      1,65%                      ?P/EBIT                        25,15                 ?Marg. Bruta                        29,2%
  # 5    12 meses     31,03%                         ?PSR                         3,80                  ?Marg. EBIT                        15,1%
  # 6        2019     31,56%                    ?P/Ativos                         3,21               ?Marg. Líquida                        11,3%
  # 7        2018     -3,83%                 ?P/Cap. Giro                        10,87                ?EBIT / Ativo                        12,8%
  # 8        2017     58,21%             ?P/Ativ Circ Liq                        23,18                        ?ROIC                        16,8%
  # 9        2016      6,25%                  ?Div. Yield                         1,5%                         ?ROE                        17,6%
  # 10       2015     -1,65%                   ?EV / EBIT                        25,22               ?Liquidez Corr                         2,00
  # 11       2014     33,09%                 ?Giro Ativos                         0,84              ?Div Br/ Patrim                         0,36
  # 12                                    ?Cres. Rec (5a)                         8,3%                                                          
  # > 
  
  Papel <- acao
  PL <- tabela[2,4]
  PVP <- tabela[3,4]
  PEBIT <- tabela[4,4]
  PSR <- tabela[5,4]
  PAtivos <- tabela[6,4]
  PCap_Giro <- tabela[7,4]
  PAtiv_Circ_Liq <- tabela[8,4]
  Div_Yield <- tabela[9,4]
  EV_EBIT <- tabela[10,4]
  Giro_Ativos <- tabela[11,4]
  Cres_Rec_5a <- tabela[12,4]
  
  
  
  LPA <- tabela[2,6]
  VPA <- tabela[3,6]
  Marg_Bruta <- tabela[4,6]
  Marg_EBIT <- tabela[5,6]
  Marg_Liquida <- tabela[6,6]
  EBIT_Ativo <- tabela[7,6]
  ROIC <- tabela[8,6]
  ROE <- tabela[9,6]
  Liquidez_Corr <- tabela[10,6]
  Div_Br_Patrim <- tabela[11,6]
  
  indicadores_fundamentos <- data.frame(Papel,PL,	PVP,	PEBIT,	PSR,	PAtivos,	PCap_Giro,	PAtiv_Circ_Liq,	Div_Yield,	EV_EBIT,	Giro_Ativos,	Cres_Rec_5a,	LPA,	VPA,	Marg_Bruta,	Marg_EBIT,	Marg_Liquida,	EBIT_Ativo,	ROIC,	ROE,	Liquidez_Corr,	Div_Br_Patrim)
   
  return(indicadores_fundamentos)
  
}

fundamentos_balaco_patrimonial <- function(acao, tabela){
  
  # > tab4_html
  # X1                        X2                        X3                        X4
  # 1 Dados Balanço Patrimonial Dados Balanço Patrimonial Dados Balanço Patrimonial Dados Balanço Patrimonial
  # 2                    ?Ativo            14.907.800.000               ?Dív. Bruta             2.910.830.000
  # 3         ?Disponibilidades             2.782.750.000             ?Dív. Líquida               128.081.000
  # 4         ?Ativo Circulante             8.803.480.000              ?Patrim. Líq             8.017.900.000
  
  Papel <- acao
  Ativo <- tabela[2,2]
  Disponibilidades <- tabela[3,2]
  Ativo_Circulante <- tabela[4,2]
  
  Div_Bruta <-tabela[2,4]
  Div_Liquida <- tabela[3,4]
  Patrim_Liq <- tabela[4,4]
  
  
  
  b_patrimonial <- data.frame(Papel,Ativo, Disponibilidades, Ativo_Circulante,	Div_Bruta,	Div_Liquida,	Patrim_Liq)
   
  return(b_patrimonial)
  
}

fundamentos_demostrativo <- function(acao, tabela){
  
  # > tab5_html
  # X1                                 X2                                 X3                                 X4
  # 1 Dados demonstrativos de resultados Dados demonstrativos de resultados Dados demonstrativos de resultados Dados demonstrativos de resultados
  # 2                   Últimos 12 meses                   Últimos 12 meses                    Últimos 3 meses                    Últimos 3 meses
  # 3                   ?Receita Líquida                     12.581.000.000                   ?Receita Líquida                      3.286.610.000
  # 4                              ?EBIT                      1.902.560.000                              ?EBIT                        512.366.000
  # 5                     ?Lucro Líquido                      1.412.560.000                     ?Lucro Líquido                        389.002.000
  
  
  
  Papel <- acao
  Receita_Liquida_12_meses <- tabela[3,2]
  EBIT_12_meses <-tabela[4,2]
  Lucro_Liquido_12_meses <- tabela[5,2]
  
  
  Receita_Liquida_3_meses <- tabela[3,4]
  EBIT_3_meses <- tabela[4,4]
  Lucro_Liquido_3_meses <- tabela[5,4]
  
  
  
  demonstrativos <- data.frame(Papel,Receita_Liquida_12_meses,	EBIT_12_meses,	Lucro_Liquido_12_meses,	Receita_Liquida_3_meses,	EBIT_3_meses,	Lucro_Liquido_3_meses)
  
  return(demonstrativos)
  
  
}



# Papel <- " "
# Tipo <- " "
# Empresa <- " "
# Setor <- " "
# Subsetor <- " "
# Valor_de_mercado <- " "
# Valor_da_firma <- " "
# Cotacao <- " "
# Data_ultima_cotacao <- " "
# Min_52_sem <- " "
# Max_52_sem <- " "
# Vol_med_2m <- " "
# ultimo_balanco_processado <- " "
# Nro_Acoes <- " "
# Oscilacao_Dia <- " "
# Oscilacao_Mes <- " "
# Oscilacao_30_dias <- " "
# Oscilacao_12_meses <- " "
# Oscilacao_2019 <- " "
# Oscilacao_2018 <- " "
# Oscilacao_2017 <- " "
# Oscilacao_2016 <- " "
# Oscilacao_2015 <- " "
# Oscilacao_2014 <- " "
# Ativo <- " "
# Disponibilidades <- " "
# Ativo_Circulante <- " "
# Div_Bruta <- " "
# Div_Liquida <- " "
# Patrim_Liq <- " "
# Receita_Liquida_12_meses <- " "
# EBIT_12_meses <- " "
# Lucro_Liquido_12_meses <- " "
# Receita_Liquida_3_meses <- " "
# EBIT_3_meses <- " "
# Lucro_Liquido_3_meses <- " "
# PL <- " "
# PVP <- " "
# PEBIT <- " "
# PSR <- " "
# PAtivos <- " "
# PCap_Giro <- " "
# PAtiv_Circ_Liq <- " "
# Div_Yield <- " "
# EV_EBIT <- " "
# Giro_Ativos <- " "
# Cres_Rec_5a <- " "
# LPA <- " "
# VPA <- " "
# Marg_Bruta <- " "
# Marg_EBIT <- " "
# Marg_Liquida <- " "
# EBIT_Ativo <- " "
# ROIC <- " "
# ROE <- " "
# Liquidez_Corr <- " "
# Div_Br_Patrim <- " "
# 
# basic01 <- data.frame(Papel,	Tipo,	Empresa,	Setor,	Subsetor,	Cotacao,	Data_ultima_cotacao,	Min_52_sem,	Max_52_sem,	Vol_med_2m)
# 
# basic02 <- data.frame(Papel,Valor_de_mercado, Valor_da_firma, ultimo_balanco_processado, Nro_Acoes)
# 
# oscilacao <- data.frame(Papel,Oscilacao_Dia,	Oscilacao_Mes,	Oscilacao_30_dias,	Oscilacao_12_meses,	Oscilacao_2019,	Oscilacao_2018,	Oscilacao_2017,	Oscilacao_2016,	Oscilacao_2015,	Oscilacao_2014)
# 
# indicadores_fundamentos <- data.frame(Papel,PL,	PVP,	PEBIT,	PSR,	PAtivos,	PCap_Giro,	PAtiv_Circ_Liq,	Div_Yield,	EV_EBIT,	Giro_Ativos,	Cres_Rec_5a,	LPA,	VPA,	Marg_Bruta,	Marg_EBIT,	Marg_Liquida,	EBIT_Ativo,	ROIC,	ROE,	Liquidez_Corr,	Div_Br_Patrim)
# 
# b_patrimonial <- data.frame(Papel,Ativo, Disponibilidades, Ativo_Circulante,	Div_Bruta,	Div_Liquida,	Patrim_Liq)
# 
# demonstrativos <- data.frame(Papel,Receita_Liquida_12_meses,	EBIT_12_meses,	Lucro_Liquido_12_meses,	Receita_Liquida_3_meses,	EBIT_3_meses,	Lucro_Liquido_3_meses)



# tdavi <- "dfa"
# t <- function(acao){
#   url <-paste0("http://www.fundamentus.com.br/detalhes.php?papel=",acao)
#   #print(url)
#   
#   #tdavi <- "dfadfasdf"
#   url2 <- "dfd"
#   
#   return(url)
# }
# 
# print(t(test))
# t(test)

carregar_pagina_fundamentus <- function(acao) {
  
  #fundamentos
  url <-paste0("http://www.fundamentus.com.br/detalhes.php?papel=",acao)
  # rvest
  h <- read_html(url)
  
  # encoding = ""
  #read_xml(x, encoding = "", ..., as_html = FALSE, options = "NOBLANKS")
  
  tab <- h %>% html_nodes("table")
  

  
  
  return(tab)
  
}

# test565 <- c("GBIO33", "STBP3", "TESA3")
# 
# test565 <- "GBIO33"
# 

# tab <- carregar_pagina_fundamentus(test565)
# 
# tab1_html <- tab[[1]] %>% html_table
# tab2_html <- tab[[2]] %>% html_table
# tab3_html <- tab[[3]] %>% html_table
# tab4_html <- tab[[4]] %>% html_table
# tab5_html <- tab[[5]] %>% html_table
# 
# 
# basic01 <- rbind(basic01,fundamentos_basic01(tab1_html))
# basic02 <- rbind(basic02,fundamentos_basic02(tab2_html))
# oscilacao <- rbind(oscilacao,fundamentos_oscilacao(tab3_html))
# indicadores_fundamentos <- rbind(indicadores_fundamentos,fundamentos_indicadores(tab3_html))
# b_patrimonial <- rbind(b_patrimonial,fundamentos_balaco_patrimonial(tab4_html))
# demonstrativos <- rbind(demonstrativos,fundamentos_demostrativo(tab5_html))


processarAcoes <- function(listaAcao) {
  
  Papel <- " "
  Tipo <- " "
  Empresa <- " "
  Setor <- " "
  Subsetor <- " "
  Valor_de_mercado <- " "
  Valor_da_firma <- " "
  Cotacao <- " "
  Data_ultima_cotacao <- " "
  Min_52_sem <- " "
  Max_52_sem <- " "
  Vol_med_2m <- " "
  ultimo_balanco_processado <- " "
  Nro_Acoes <- " "
  Oscilacao_Dia <- " "
  Oscilacao_Mes <- " "
  Oscilacao_30_dias <- " "
  Oscilacao_12_meses <- " "
  Oscilacao_2019 <- " "
  Oscilacao_2018 <- " "
  Oscilacao_2017 <- " "
  Oscilacao_2016 <- " "
  Oscilacao_2015 <- " "
  Oscilacao_2014 <- " "
  Ativo <- " "
  Disponibilidades <- " "
  Ativo_Circulante <- " "
  Div_Bruta <- " "
  Div_Liquida <- " "
  Patrim_Liq <- " "
  Receita_Liquida_12_meses <- " "
  EBIT_12_meses <- " "
  Lucro_Liquido_12_meses <- " "
  Receita_Liquida_3_meses <- " "
  EBIT_3_meses <- " "
  Lucro_Liquido_3_meses <- " "
  PL <- " "
  PVP <- " "
  PEBIT <- " "
  PSR <- " "
  PAtivos <- " "
  PCap_Giro <- " "
  PAtiv_Circ_Liq <- " "
  Div_Yield <- " "
  EV_EBIT <- " "
  Giro_Ativos <- " "
  Cres_Rec_5a <- " "
  LPA <- " "
  VPA <- " "
  Marg_Bruta <- " "
  Marg_EBIT <- " "
  Marg_Liquida <- " "
  EBIT_Ativo <- " "
  ROIC <- " "
  ROE <- " "
  Liquidez_Corr <- " "
  Div_Br_Patrim <- " "
  contador <- 0
  hora <- Sys.time()
  basic01 <- data.frame(Papel,	Tipo,	Empresa,	Setor,	Subsetor,	Cotacao,	Data_ultima_cotacao,	Min_52_sem,	Max_52_sem,	Vol_med_2m)
  
  basic02 <- data.frame(Papel,Valor_de_mercado, Valor_da_firma, ultimo_balanco_processado, Nro_Acoes)
  
  oscilacao <- data.frame(Papel,Oscilacao_Dia,	Oscilacao_Mes,	Oscilacao_30_dias,	Oscilacao_12_meses,	Oscilacao_2019,	Oscilacao_2018,	Oscilacao_2017,	Oscilacao_2016,	Oscilacao_2015,	Oscilacao_2014)
  
  indicadores_fundamentos <- data.frame(Papel,PL,	PVP,	PEBIT,	PSR,	PAtivos,	PCap_Giro,	PAtiv_Circ_Liq,	Div_Yield,	EV_EBIT,	Giro_Ativos,	Cres_Rec_5a,	LPA,	VPA,	Marg_Bruta,	Marg_EBIT,	Marg_Liquida,	EBIT_Ativo,	ROIC,	ROE,	Liquidez_Corr,	Div_Br_Patrim)
  
  b_patrimonial <- data.frame(Papel,Ativo, Disponibilidades, Ativo_Circulante,	Div_Bruta,	Div_Liquida,	Patrim_Liq)
  
  demonstrativos <- data.frame(Papel,Receita_Liquida_12_meses,	EBIT_12_meses,	Lucro_Liquido_12_meses,	Receita_Liquida_3_meses,	EBIT_3_meses,	Lucro_Liquido_3_meses)
  
  
 
  for(acao in listaAcao){
    print(c("processando açao ", acao))
    
    tab <- carregar_pagina_fundamentus(acao)
    
    if(length(tab)==5){
      contador <-contador+1
      tab1_html <- tab[[1]] %>% html_table
      tab2_html <- tab[[2]] %>% html_table
      tab3_html <- tab[[3]] %>% html_table
      tab4_html <- tab[[4]] %>% html_table
      tab5_html <- tab[[5]] %>% html_table
      
      
      basic01 <- rbind(basic01,fundamentos_basic01(acao, tab1_html))
      basic02 <- rbind(basic02,fundamentos_basic02(acao, tab2_html))
      oscilacao <- rbind(oscilacao,fundamentos_oscilacao(acao, tab3_html))
      indicadores_fundamentos <- rbind(indicadores_fundamentos,fundamentos_indicadores(acao, tab3_html))
      b_patrimonial <- rbind(b_patrimonial,fundamentos_balaco_patrimonial(acao, tab4_html))
      demonstrativos <- rbind(demonstrativos,fundamentos_demostrativo(acao, tab5_html))
     
      
    }

    
  }
  
  fundamentus <- data.frame(basic01, basic02, oscilacao, indicadores_fundamentos, b_patrimonial, demonstrativos)
  print(Sys.time()- hora)
  print(c("Número de ações processadas", contador, "açoes"))
  print(c("Número de ações Enviadas para processar ", length(acoes), " açoes"))
  return(fundamentus)
}


acoes <- c("GBIO33", "STBP3", "TESA3", "CCPR3", "MSPA3", "KLBN3", "KLBN11", "KLBN4", "EUCA3", "BAHI3", "ITEC3", "TOYB3", "PFRM3", 
          "BTOW3", "DIRR3", "TOYB4", "ELPL3", "EUCA4", "POSI3", "BRPR3", "SUZB3", "EVEN3", "MILS3", "VVAR3", "LPSB3", "EMBR3", 
          "LOGN3", "RDNI3", "SHOW3", "SEDU3", "BTTL3", "MAPT4", "GOLL4", "RCSL4", "BIOM3", "ADHM3", "GPIV33", "FJTA3", "FJTA4", 
          "BRFS3", "AHEB3", "AHEB5", "IDVL4", "IDVL3", "BBRK3", "HBOR3", "CRDE3", "PMAM3", "PINE4", "BEEF3", "TCSA3", "BSEV3", 
          "MGEL4", "FRTA3", "TCNO3", "TCNO4", "OIBR4", "DMMO3", "OIBR3", "NUTR3", "NORD3", "HBTS5", "APER3", "GFSA3", "CTKA3", 
          "CTKA4", "TPIS3", "MNPR3", "INEP4", "INEP3", "JFEN3", "VIVR3", "IGBR3", "ETER3", "ESTR4", "HOOT4", "RNEW3", "RNEW11", 
          "RNEW4", "AZEV3", "LIQO3", "PLAS3", "LUPA3", "MWET4", "BDLL4", "GSHP3", "AZEV4", "RSID3", "FHER3", "MMXM3", "SLED3", 
          "SLED4", "SNSY5", "PDGR3", "MEND6", "MEND5", "OSXB3", "TEKA4", "BBSE3", "CNTO3", "CSAB3", "CSAB4", "HETA4", "IRBR3", 
          "RPAD3", "RPAD5", "RPAD6", "SPRI3", "SPRI5", "SPRI6", "TELB3", "TELB4", "BPHA3", "TRPN3", "JBDU4", "JBDU3", "BOBR4", 
          "CTNM4", "CTNM3", "RPMG3", "CEDO3", "CEDO4", "SGPS3", "MRFG3", "ECPR3", "TXRX4", "CTSA3", "ELET3", "RSUL4", "ELET6", 
          "TXRX3", "IDNT3", "CTSA4", "HAGA4", "MERC4", "BNBR3", "AGRO3", "ATOM3", "CEBR6", "CEBR3", "ROMI3", "BAZA3", "CRPG5", 
          "CRPG6", "ELEK4", "PATI3", "BRGE12", "CRPG3", "BRGE8", "CSNA3", "CIEL3", "GUAR3", "ELEK3", "CEBR5", "FESA4", "EALT4", 
          "SOND5", "BMEB3", "SOND6", "BRGE7", "CGAS5", "EMAE4", "BRGE3", "BGIP3", "BMEB4", "JHSF3", "CGAS3", "SMLS3", "ENEV3", 
          "PTNT4", "TRPL4", "CPLE3", "SAPR4", "VIVT3", "UNIP6", "PATI4", "CPLE6", "CAML3", "BEES3", "BEES4", "BGIP4", "UNIP3", 
          "UNIP5", "EKTR4", "GOAU4", "BRSR3", "GOAU3", "ENBR3", "HAGA3", "FESA3", "BRDT3", "BAUH4", "TRPL3", "SAPR11", "CAMB4", 
          "BRSR6", "BRSR5", "CGRA4", "WIZS3", "TAEE4", "BRAP3", "CGRA3", "GGBR3", "VIVT4", "JOPA4", "CARD3", "MTSA4", "EALT3", 
          "TAEE11", "TECN3", "DOHL4", "ABCB4", "SHUL4", "TUPY3", "BRAP4", "BRGE11", "LUXM4", "BRKM5", "BRKM3", "SLCE3", "JOPA3", 
          "TAEE3", "CEEB3", "ALUP4", "ALUP3", "ALUP11", "CRIV4", "CLSC4", "BRIV3", "CMIG4", "CEPE6", "CEEB5", "BBAS3", "EEEL3", 
          "CRIV3", "GGBR4", "CSRN6", "LEVE3", "WLMM3", "NAFG4", "ENAT3", "SBSP3", "CSRN5", "ITSA4", "ITSA3", "SAPR3", "TIMP3", 
          "CEPE5", "BRIV4", "LLIS3", "TEND3", "MYPK3", "MRVE3", "VULC3", "NEOE3", "NEOE3", "CSRN3", "VLID3", "PTBL3", "BRML3", 
          "AFLT3", "COCE3", "PSSA3", "SANB4", "PEAB4", "TRIS3", "ITUB3", "CMIG3", "EEEL4", "SANB11", "SSBR3", "ENMT3", "ENMT4", 
          "BSLI3", "BBDC3", "SANB3", "ENGI4", "MTIG4", "PEAB3", "BRGE6", "PNVL4", "CSMG3", "ESTC3", "GPCP3", "GRND3", "GEPA3", 
          "SULA3", "BBDC4", "ENGI11", "EGIE3", "ITUB4", "BSLI4", "PETR4", "WLMM4", "HYPE3", "TIET4", "GEPA4", "PTNT3", "CPFE3", 
          "COCE5", "TIET11", "SULA11", "QUAL3", "TGMA3", "PRIO3", "SEER3", "LIGT3", "KROT3", "PETR3", "UGPA3", "SULA4", "TIET3", 
          "POMO3", "SMTO3", "USIM6", "EQTL3", "USIM5", "VALE3", "HGTX3", "PCAR3", "WSON33", "JSLG3", "PCAR4", "RAPT3", "ECOR3", 
          "POMO4", "DTEX3", "MDIA3", "CELP7", "USIM3", "KEPL3", "ENGI3", "WHRL4", "CBEE3", "DTCY3", "FLRY3", "WHRL3", "PARD3", 
          "RAPT4", "FRAS3", "AMAR3", "PNVL3", "MOVI3", "CRFB3", "JPSA3", "ABEV3", "BMIN3", "CVCB3", "CSAN3", "CELP5", "BMIN4", 
          "LCAM3", "REDE3", "BMKS3", "ODPV3", "MNDL3", "BPAC11", "ARZZ3", "IGTA3", "MOAR3", "OFSA3", "LREN3", "LOGG3", "B3SA3", 
          "WEGE3", "HAPV3", "MULT3", "BPAC5", "BPAC3", "UCAS3", "AALR3", "ALSC3", "BKBR3", "BALM4", "FRIO3", "CCRO3", "ALPA3", 
          "BPAN4", "RENT3", "NATU3", "ALPA4", "LIPR3", "AZUL4", "DASA3", "EZTC3", "RADL3", "GNDI3", "CESP3", "CEGR3", "CESP5", 
          "TKNO4", "CESP6", "LAME3", "MGLU3", "CPRE3", "RLOG3", "LAME4", "RAIL3", "CCXC3", "LINX3", "OMGE3", "JBSS3", "BIDI4", 
          "RANI4", "MEAL3", "RANI3", "SQIA3", "TOTS3", "SCAR3", "CYRE3", "ANIM3")



# acoes <- c("GBIO33")
# acao <- c("GBIO33")
f <- processarAcoes(acoes)


    write.xlsx(f, "fundamentus.xlsx")
