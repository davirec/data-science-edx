library(rvest)

url <- paste0("https://en.wikipedia.org/w/index.php?title=", "Gun_violence_in_the_United_States_by_state&direction=prev&oldid=810166167")
murders_raw <- read_html(url) %>% html_nodes("table") %>% html_table() %>% .[[2]] %>% setNames(c("state", "population", "total", "murder_rate"))



# Podemos usar a str_detectfunção para ver que duas das três colunas têm vírgulas nas entradas:
commas <- function(x) any(str_detect(x, ","))
#funs deprecated use list
murders_raw %>% summarize_all(funs(commas))


murders_raw %>% summarize_all(list(commas))


test_1 <- str_replace_all(murders_raw$population, ",", "")
test_1 <- as.numeric(test_1)


murders_new <- murders_raw %>% mutate_at(2:3, parse_number)

head(murders_new)

limpar_string <- function(x){
  ponto <- str_replace_all(x, "\\.", "")
  virgula <-str_replace_all(ponto, ",", ".")
  percent <- str_replace_all(virgula, "%", "")
}

limpar_percentual <- function(x){
  x/100
}

parse_percente <- function(x){
  str_replace_all(x, "%", "")
}


test1 <- t %>% mutate_at(2, parse_number)

#deu certo
test1 <- t %>% mutate_all(limpar_string)

#nao deu certo
#tenho que excluir algumas colunas ex: os papeis e as que tenha porcentagem
test2 <- test1 %>% mutate_all(parse_number)

parse_n



commas_davi <- function(x) any(str_detect(x, "%"))

list <- t %>% summarize_all(list(commas_davi))

percentual <- which(list %in% TRUE)


test2 <- t %>% mutate_all(parse_percente)




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

listar_percentual(t)

listar_numero(t)

formatar_tabela <- function(tabela){
  #tabela <- t
  lista_coluna_percentual <- listar_percentual(tabela)
  
  lista_coluna_numerica <- listar_numero(tabela)
  
  tabela <- tabela %>% mutate_all(limpar_string)
  
  tabela <- tabela %>% mutate_at(lista_coluna_numerica, parse_number)
  
  
  tabela <- tabela %>% mutate_at(lista_coluna_percentual,limpar_percentual)
  
  return(tabela)
}
  

teste_davi <-formatar_tabela(tab2_html)
