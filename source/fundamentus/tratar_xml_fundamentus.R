
source("source/fundamentus/conexao.R")

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


teste_tratar_xml <- function(){
  
  xml <- teste_conexao()
  acao <- "teste"
  
  
  if(length(xml)==5){
    tab1_html <- xml[[1]] %>% html_table
    tab2_html <- xml[[2]] %>% html_table
    tab3_html <- xml[[3]] %>% html_table
    tab4_html <- xml[[4]] %>% html_table
    tab5_html <- xml[[5]] %>% html_table
  
    basic01                 <- fundamentos_basic01(acao, tab1_html)
    basic02                 <- fundamentos_basic02(acao, tab2_html)
    oscilacao               <- fundamentos_oscilacao(acao, tab3_html)
    indicadores_fundamentos <- fundamentos_indicadores(acao, tab3_html)
    b_patrimonial           <- fundamentos_balaco_patrimonial(acao, tab4_html)
    demonstrativos          <- fundamentos_demostrativo(acao, tab5_html)
  
  
    print(basic01)
    print(basic02)
    print(oscilacao)
    print(indicadores_fundamentos)
    print(b_patrimonial)
    print(demonstrativos)
  
  }
  
  }
