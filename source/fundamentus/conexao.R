library(rvest)

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

busca_avancada <- function(){
  
  url <- "http://www.fundamentus.com.br/resultado.php"
 
  h <- read_html(url)
 
  tab <- h %>% html_nodes("table")
  
  return(tab)
  
}

teste_conexao <- function(){
  xml_fundamentus <- carregar_pagina_fundamentus("sqia3")
  
  return(xml_fundamentus)
  
}




