source("source/fundamentus/tratar_xml_fundamentus.R")
library(tidyr)
library(stringr)
library(dplyr)
library(readr)

limpar_string <- function(x){
  ponto <- str_replace_all(x, "\\.", "")
  virgula <-str_replace_all(ponto, ",", ".")
  percent <- str_replace_all(virgula, "%", "")
}

converte_percentual <- function(x){
  x/100
}

listar_padrao <- function(tabela, padrao){
  
  detectar_padrao <- function(x) any(str_detect(x, padrao))
  
  tem_padrao <- tabela %>% summarize_all(list(detectar_padrao))
  liste_coluna_padrao <- which(tem_padrao %in% TRUE)
  return(liste_coluna_padrao)
}

listar_numero <- function(tabela){
  listar_padrao(tabela, ",")
}

listar_percentual <- function(tabela){
  listar_padrao(tabela, "%")
}


formatar_tabela <- function(tabela){
  
  lista_coluna_percentual <- listar_percentual(tabela)
  
  lista_coluna_numerica <- listar_numero(tabela)
  
  tabela <- tabela %>% mutate_all(limpar_string)
  
  tabela <- tabela %>% mutate_at(lista_coluna_numerica, parse_number)
  
  
  tabela <- tabela %>% mutate_at(lista_coluna_percentual,converte_percentual)
  
  return(tabela)
}


teste_construir_tabela_avançada <- function(){
  
  xml_avancado <- busca_avancada()
  
  tab01 <- tratar_busca_avancada(xml_avancado)
  
  tab_formatada <- formatar_tabela(tab01)
  
  return(tab_formatada)
}

