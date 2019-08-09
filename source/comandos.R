# l? um arquivo

senado <- read_csv("senado.csv")

# para escrever em um arquivo csv com separador decimal virgula
write.csv2(s,file = "teste.csv")


# J? paraverificaraestruturadoobjeto
str(senado)

# Para verificar estat?sticas b?sicas do objeto(m?dia,mediana,quantis,m?nimo,m?ximoetc.)
summary(senado)


#lendo arquivocomdelimitador#
read_delim('caminho/do/arquivo/arquivo_separado_por#.txt', delim = '#')
#lendo arquivodecolunafixa
#coluna 1detamanho5,coluna2detamanho2ecoluna3detamanho10
read_fwf('caminho/do/arquivo/arquivo.txt', col_positions = fwf_widths(c(5, 2, 10), c("col1","col2","col3")))



# Paraverificarqualodiret?rio
getwd() #Get WorkingDirectory
# Para informar ao R em qual pasta ele deve ler os arquivos,
setwd('D:/caminho/do/arquivo/arquivo.csv')

# salvar um ou v?rios objetos
save(objeto, file = 'participantes.Rdata')
rm(objeto) # removendooobjeto


install.packages("dslabs")
install.packages("dplyr")
install.packages("lubridate")
install.packages("tidyverse")
install.packages("caret")
install.packages("purrr")
install.packages("pdftools")
install.packages("broom")
install.packages("devtools")
install.packages("e1071")
install.packages("ggrepel")
install.packages("randomForest")
install.packages("Rborist")
install.packages("NHANES")
install.packages("datasus")
install.packages("rvest")
install.packages("httr")



# ‘openssl’, ‘httr’, ‘rvest’, ‘xml2’

#To install this package, start R (version "3.5") and enter:
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("genefilter", version = "3.8")


install.packages(c("dslabs","dplyr", "lubridate", "tidyverse", "caret", "purrr", "pdftools", "broom", "devtools", "e1071", "ggrepel", "randomForest", "Rborist", "NHANES", "datasus","rvest", "httr"))



# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("genefilter", version = "3.8")
# 
# 
# 
# library(devtools)
# #devtools::install_bioc("genefilter", force = TRUE)
# library(genefilter)
# tt <- colttests(x, y)
# 
# 
# 
# install.packages("BiocManager")
# 
# BiocManager::install("genefilter",version = "3.8")
# 
# library(genefilter)
# 
# tt <- colttests(x, y)


library(tidyverse)
library(caret)

set.seed(1996)
n <- 1000
p <- 10000
x <- matrix(rnorm(n*p), n, p)
colnames(x) <- paste("x", 1:ncol(x), sep = "_")
y <- rbinom(n, 1, 0.5) %>% factor()

library(genefilter)
tt <- colttests(x, y)
head(tt)


#escolhe 10 valores "aleatórios" em um data frame sem repetição

countries <-sample(levels(gapminder$country),size = 10, replace=FALSE)


# Expressões lógicas

# ou |
# e &




# bind_rows adiciona uma linha na tabela rmse_results
# rmse_results <- bind_rows(rmse_results, data_frame(method="Regularized Movie Effect Model", RMSE = model_2_rmse))

# cria a tabela 
rmse_results <- data_frame(method = "Just the average", RMSE = naive_rmse)



# Portanto, para alterar a decodificação para a Língua Portuguesa — Brasil, basta chamar a função:

Sys.setlocale("LC_ALL","pt_BR.UTF-8")




#exemplo usando %in%
gapminder %>%
  filter(continent == "Africa" & 
           year %in% c(1970, 2010) & 
           !is.na(gdp) & 
           !is.na(population)) %>%  mutate(dollars_per_day = gdp/population/365)

gapminder %>%
  filter(continent == "Africa" & 
           year %in% seq(1970,2010,1) & 
           !is.na(gdp) & 
           !is.na(population)) %>%  mutate(dollars_per_day = gdp/population/365)
