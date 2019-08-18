library(tidyverse)
library(rvest)
library(httr)

library(plyr)

#fundamentos
url2 <-paste0("http://www.fundamentus.com.br/detalhes.php?papel=","WEGE3")
# rvest
h2 <- read_html(url2)

# encoding = ""
#read_xml(x, encoding = "", ..., as_html = FALSE, options = "NOBLANKS")

tab2 <- h2 %>% html_nodes("table")


tab1_html <- tab2[[1]] %>% html_table
tab2_html <- tab2[[2]] %>% html_table
tab3_html <- tab2[[3]] %>% html_table                                                                               
tab4_html <- tab2[[4]] %>% html_table
tab5_html <- tab2[[5]] %>% html_table


#Verificar como Colocar os anos das oscilações de modo automático

fundamentos <- c("Papel", "Tipo", "Empresa", "Setor", "Subsetor", "Valor de mercado", "Valor da firma", "Cotação", "Data última cotação",
       "Min 52 sem", "Max 52 sem", "Volor méd (2m)", "Último balanço processado", "Nro. Ações", "Oscilação Dia", "Oscilação Mês", 
       "Oscilação 30 dias", "Oscilação 12 meses", "Oscilação 2019", "Oscilação 2018", "Oscilação 2017", "Oscilação 2016", "Oscilação 2015", 
       "Oscilação 2014", "Ativo", "Disponibilidades", "Ativo Circulante", "Dív. Bruta", "Dív. Líquida", "Patrim. Líq", 
       "Receita Líquida 12 meses", "EBIT 12 meses", "Lucro Líquido 12 meses", "Receita Líquida 3 meses", "EBIT 3 meses", 
       "Lucro Líquido 3 meses", "P/L", "P/VP", "P/EBIT", "PSR", "P/Ativos", "P/Cap. Giro", "P/Ativ Circ Liq", "Div. Yield", 
       "EV / EBIT", "Giro Ativos", "Cres. Rec (5a)", "LPA", "VPA", "Marg. Bruta", "Marg. EBIT", "Marg. Líquida", "EBIT / Ativo", 
       "ROIC", "ROE", "Liquidez Corr", "Div Br/ Patrim")



# Papel <-
# Tipo <-
# Empresa <-
# Setor <-
# Subsetor <-
# Valor_de_mercado <-
# Valor_da_firma <-
# Cotacao <-
# Data_ultima_cotacao <-
# Min_52_sem <-
# Max_52_sem <-
# Vol_med_2m <-
# ultimo_balanco_processado <-
# Nro_Acoes <-
# Oscilacao_Dia <-
# Oscilacao_Mes <-
# Oscilacao_30_dias <-
# Oscilacao_12_meses <-
# Oscilacao_2019 <-
# Oscilacao_2018 <-
# Oscilacao_2017 <-
# Oscilacao_2016 <-
# Oscilacao_2015 <-
# Oscilacao_2014 <-
# Ativo <-
# Disponibilidades <-
# Ativo_Circulante <-
# Div_Bruta <-
# Div_Liquida <-
# Patrim_Liq <-
# Receita_Liquida_12_meses <-
# EBIT_12_meses <-
# Lucro_Liquido_12_meses <-
# Receita_Liquida_3_meses <-
# EBIT_3_meses <-
# Lucro_Liquido_3_meses <-
# PL <-
# PVP <-
# PEBIT <-
# PSR <-
# PAtivos <-
# PCap_Giro <-
# PAtiv_Circ_Liq <-
# Div_Yield <-
# EV_EBIT <-
# Giro_Ativos <-
# Cres_Rec_5a <-
# LPA <-
# VPA <-
# Marg_Bruta <-
# Marg_EBIT <-
# Marg_Liquida <-
# EBIT_Ativo <-
# ROIC <-
# ROE <-
# Liquidez_Corr <-
# Div_Br_Patrim <-

# Papel,	Tipo,	Empresa,	Setor,	Subsetor,	Valor_de_mercado,	Valor_da_firma,	Cotacao,	Data_ultima_cotacao,	Min_52_sem,	Max_52_sem,	Vol_med_2m,	ultimo_balanco_processado,	Nro_Acoes,	Oscilacao_Dia,	Oscilacao_Mes,	Oscilacao_30_dias,	Oscilacao_12_meses,	Oscilacao_2019,	Oscilacao_2018,	Oscilacao_2017,	Oscilacao_2016,	Oscilacao_2015,	Oscilacao_2014,	Ativo,	Disponibilidades,	Ativo_Circulante,	Div_Bruta,	Div_Liquida,	Patrim_Liq,	Receita_Liquida_12_meses,	EBIT_12_meses,	Lucro_Liquido_12_meses,	Receita_Liquida_3_meses,	EBIT_3_meses,	Lucro_Liquido_3_meses,	PL,	PVP,	PEBIT,	PSR,	PAtivos,	PCap_Giro,	PAtiv_Circ_Liq,	Div_Yield,	EV_EBIT,	Giro_Ativos,	Cres_Rec_5a,	LPA,	VPA,	Marg_Bruta,	Marg_EBIT,	Marg_Liquida,	EBIT_Ativo,	ROIC,	ROE,	Liquidez_Corr,	Div_Br_Patrim,



# tab1_html
# X1                             X2              X3         X4
# 1    ?Papel                          WEGE3        ?Cotação      22,80
# 2     ?Tipo                          ON N1   ?Data últ cot 16/08/2019
# 3  ?Empresa                   WEG SA ON N1     ?Min 52 sem      16,59
# 4    ?Setor        Máquinas e Equipamentos     ?Max 52 sem      24,44
# 5 ?Subsetor Motores, Compressores e Outros ?Vol $ méd (2m) 76.060.200



Papel <- tab1_html[1,2]
Tipo <- tab1_html[2,2]
Empresa <- tab1_html[3,2]
Setor <- tab1_html[4,2]
Subsetor <- tab1_html[5,2]

Cotacao <- tab1_html[1,4]
Data_ultima_cotacao <- tab1_html[2,4]
Min_52_sem <- tab1_html[3,4]
Max_52_sem <- tab1_html[4,4]
Vol_med_2m <- tab1_html[5,4]

basic01 <- data.frame(Papel,	Tipo,	Empresa,	Setor,	Subsetor,	Cotacao,	Data_ultima_cotacao,	Min_52_sem,	Max_52_sem,	Vol_med_2m)


# tab2_html
# X1             X2                      X3            X4
# 1 ?Valor de mercado 47.849.400.000 ?Últ balanço processado    30/06/2019
# 2   ?Valor da firma 47.977.500.000             ?Nro. Ações 2.098.660.000


Valor_de_mercado <- tab2_html[1,2]
Valor_da_firma <- tab2_html[2,2]

ultimo_balanco_processado <- tab2_html[1,4]
Nro_Acoes <- tab2_html[2,4]


basic02 <- data.frame(Papel,Valor_de_mercado, Valor_da_firma, ultimo_balanco_processado, Nro_Acoes)


#Df <- merge(basic01, basic02)


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




Oscilacao_Dia <- tab3_html[2,2]
Oscilacao_Mes <- tab3_html[3,2]
Oscilacao_30_dias <- tab3_html[4,2]
Oscilacao_12_meses <- tab3_html[5,2]
Oscilacao_2019 <- tab3_html[6,2]
Oscilacao_2018 <- tab3_html[7,2]
Oscilacao_2017 <- tab3_html[8,2]
Oscilacao_2016 <- tab3_html[9,2]
Oscilacao_2015 <- tab3_html[10,2]
Oscilacao_2014 <- tab3_html[11,2]

oscilacao <- data.frame(Papel,Oscilacao_Dia,	Oscilacao_Mes,	Oscilacao_30_dias,	Oscilacao_12_meses,	Oscilacao_2019,	Oscilacao_2018,	Oscilacao_2017,	Oscilacao_2016,	Oscilacao_2015,	Oscilacao_2014)


PL <- tab3_html[2,4]
PVP <- tab3_html[3,4]
PEBIT <- tab3_html[4,4]
PSR <- tab3_html[5,4]
PAtivos <- tab3_html[6,4]
PCap_Giro <- tab3_html[7,4]
PAtiv_Circ_Liq <- tab3_html[8,4]
Div_Yield <- tab3_html[9,4]
EV_EBIT <- tab3_html[10,4]
Giro_Ativos <- tab3_html[11,4]
Cres_Rec_5a <- tab3_html[12,4]



LPA <- tab3_html[2,6]
VPA <- tab3_html[3,6]
Marg_Bruta <- tab3_html[4,6]
Marg_EBIT <- tab3_html[5,6]
Marg_Liquida <- tab3_html[6,6]
EBIT_Ativo <- tab3_html[7,6]
ROIC <- tab3_html[8,6]
ROE <- tab3_html[9,6]
Liquidez_Corr <- tab3_html[10,6]
Div_Br_Patrim <- tab3_html[11,6]

indicadores_fundamentos <- data.frame(Papel,PL,	PVP,	PEBIT,	PSR,	PAtivos,	PCap_Giro,	PAtiv_Circ_Liq,	Div_Yield,	EV_EBIT,	Giro_Ativos,	Cres_Rec_5a,	LPA,	VPA,	Marg_Bruta,	Marg_EBIT,	Marg_Liquida,	EBIT_Ativo,	ROIC,	ROE,	Liquidez_Corr,	Div_Br_Patrim)


# > tab4_html
# X1                        X2                        X3                        X4
# 1 Dados Balanço Patrimonial Dados Balanço Patrimonial Dados Balanço Patrimonial Dados Balanço Patrimonial
# 2                    ?Ativo            14.907.800.000               ?Dív. Bruta             2.910.830.000
# 3         ?Disponibilidades             2.782.750.000             ?Dív. Líquida               128.081.000
# 4         ?Ativo Circulante             8.803.480.000              ?Patrim. Líq             8.017.900.000


Ativo <- tab4_html[2,2]
Disponibilidades <- tab4_html[3,2]
Ativo_Circulante <- tab4_html[4,2]

Div_Bruta <-tab4_html[2,4]
Div_Liquida <- tab4_html[3,4]
Patrim_Liq <- tab4_html[4,4]



b_patrimonial <- data.frame(Papel,Ativo, Disponibilidades, Ativo_Circulante,	Div_Bruta,	Div_Liquida,	Patrim_Liq)





# > tab5_html
# X1                                 X2                                 X3                                 X4
# 1 Dados demonstrativos de resultados Dados demonstrativos de resultados Dados demonstrativos de resultados Dados demonstrativos de resultados
# 2                   Últimos 12 meses                   Últimos 12 meses                    Últimos 3 meses                    Últimos 3 meses
# 3                   ?Receita Líquida                     12.581.000.000                   ?Receita Líquida                      3.286.610.000
# 4                              ?EBIT                      1.902.560.000                              ?EBIT                        512.366.000
# 5                     ?Lucro Líquido                      1.412.560.000                     ?Lucro Líquido                        389.002.000
 



Receita_Liquida_12_meses <- tab5_html[2,2]
EBIT_12_meses <-tab5_html[3,2]
Lucro_Liquido_12_meses <- tab5_html[4,2]


Receita_Liquida_3_meses <- tab5_html[2,4]
EBIT_3_meses <- tab5_html[3,4]
Lucro_Liquido_3_meses <- tab5_html[4,4]



demonstrativos <- data.frame(Papel,Receita_Liquida_12_meses,	EBIT_12_meses,	Lucro_Liquido_12_meses,	Receita_Liquida_3_meses,	EBIT_3_meses,	Lucro_Liquido_3_meses)



#######################################################################################################################

# plyr
# resultados <- join_all(list(df1,df2,df3)) 
Df <- join_all(list(basic01, basic02, oscilacao, indicadores_fundamentos, b_patrimonial, demonstrativos))




Df1 <- merge(basic01, basic02)

Df2 <- merge(oscilacao, indicadores_fundamentos)

Df3 <- merge(b_patrimonial, demonstrativos)


Df4 <- merge(Df1, Df2)

Df5 <- merge(Df4, Df3)


