n = c (2, 3, 5, 7, 9) 
s = c ("aa", "bb", "cc", "dd", "ee") 
# b = c (VERDADEIRO, FALSO, VERDADEIRO, FALSO, VERDADEIRO) 

# df = data.frame (n, s, b) # df é um quadro de dados


a= seq(2,10,0.2)
b= seq(3,11,0.2)
c= seq(4,12,0.2)
d= seq(5,13,0.2)
e= seq(6,14,0.2)
f= seq(7,15,0.2)
g= seq(8,16,0.2)
h= seq(9,17,0.2)
i= seq(10,18,0.2)
j= seq(11,19,0.2)
k= seq(12,20,0.2)
l= seq(13,21,0.2)
m= seq(14,22,0.2)


dwf = data.frame (a,b,c,d,e,f,g,h,i,j,k,l,m) # df é um quadro de dados
x <- seq(1,13,3)

y <-seq(1,10,1)

dwf[,x]


#carregar biblioteca
library(xlsx)
xl_data <- read.xlsx("acoes.xlsx", "Plan1")
print(xl_data)


#listar linhas e colunas
ts<-xl_data[y,x]

tt<-xl_data[y,x]

tx<-xl_data[y,x]


library(plyr)
i=1
dataframe01 <- data.frame(seq(1,10,1))

dataframe03 <- data.frame(seq(1,10,1))


 # plyr
#resultados <- join_all(list(df1,df2,df3)) 

dataframe01

for(i in indices) {
  print(i)
}
  
indices <- seq(1,5,1)



for(i in indices) {
  
  i=2
  dataframe02 <- data.frame(dataframe03[,1],ts[,i],tt[,i],tx[,i])
  
  
  dataframe01 <- merge(dataframe01,dataframe02)
  
}



#salva o arquivo
#row.names = FALSE oculta a coluna com o número de linhas
write.csv2(xl_data[y,x], "tste.csv", row.names = FALSE)




#########





#1,4,7,10
xs <- seq(1,10,1)
xt <- seq(2,10,2)



# transpor
t(ts)


#listar diretorio r

getwd()

#concatenar listas

pares <- c(2,4,6,8,9)
impares <- c(1,3,5,7,9)
todos.os.numeros <- c(pares,impares)

#lista e remove variaveis
ls()
rm(a)

#ordena
sort(todos.os.numeros, decreasing=FALSE, na.last=TRUE)

#ordena e retira os repetidos
unique(sort(todos.os.numeros, decreasing=FALSE, na.last=TRUE))




# comando para reprocessar o java como root
# 
# export JAVA_HOME=/usr/lib/jvm/java-8-oracle
# export PATH=$PATH:$JAVA_HOME/bin
# R CMD javareconf

#reiniciar o Rstudio


library(xlsx)
xl_data <- read.xlsx("EXPEC TRATADA 2.xlsx", "Planilha1")
#print(xl_data)
#1-81
#82-162
#163-243

a <- seq(1,81,1)

b <- seq(82,162,1)

c <- seq(163,243,1)

library(dplyr)
library(tidyverse)


j<-1
Lista <-0
for(i in 1:81){
  #print(j)
  Lista[j]<- a[i]
  Lista[j+1]<- b[i]
  Lista[j+2]<- c[i]
  j<-j+3
  
}
    dani <- xl_data[,Lista]

#write.csv2(dani, "dani.csv", row.names = FALSE)

#write.xlsx(dani, "dani.xlsx")


################333333


teste <- data.frame(1,1,1,1,1)
colunas <- c("Ano","Idade","TaxaH","TaxaM","Media")

names(teste) <- colunas
idade <- 0
#colunaIdade <-1
linhaIdade <- 1
linha <-1
colunaSeq <- seq(1,243,3)

for (colunaIdade in colunaSeq) {
  
  for (anos in 1998:2017) {
    
      teste[linha,] <-c(anos,idade,dani[linhaIdade, colunaIdade+1], dani[linhaIdade, colunaIdade+2], dani[linhaIdade, colunaIdade])
      linhaIdade <- linhaIdade + 1
      linha <- linha + 1
    
  }
  
  idade <- idade+1
  #colunaIdade <- colunaIdade+3
  linhaIdade <- 1
  
}
 
# for (s in 1:2) {
#   for (anos in 1998:2017) {
#     print(anos)
#   }
# }
  

filter(teste, teste$Ano==1998 & teste$Idade==10)


teste %>% filter(teste$Idade==10) %>% ggplot(aes(Ano, TaxaH,TaxaM)) + geom_line()

teste %>% geom_point(aes(Ano, TaxaH))

teste %>% ggplot(aes(Ano, TaxaH, col = Idade)) + geom_line()

plot(teste$Ano,teste$Idade)



write.xlsx(teste, "dani2.xlsx")


#################################################

teste2 <- data.frame(1,1,1,1)
colunas2 <- c("Ano","Idade","Taxa","Tipo")

names(teste2) <- colunas2

contador <-1


for (linhaTeste in 1:1620) {
  # for (anos in 1998:2017) {
  #   print(anos)
  # }
  
    teste2[contador,] <- c(teste[linhaTeste,1],teste[linhaTeste,2],teste[linhaTeste,3],"Homem")
  teste2[contador+1,] <- c(teste[linhaTeste,1],teste[linhaTeste,2],teste[linhaTeste,4],"Mulher")
  teste2[contador+2,] <- c(teste[linhaTeste,1],teste[linhaTeste,2],teste[linhaTeste,5],"Media")
  
  contador <- contador+3
}


teste2$Ano <- as.numeric(teste2$Ano) 
teste2$Idade <- as.numeric(teste2$Idade ) 
teste2$Taxa <- as.numeric(teste2$Taxa ) 
teste2$Tipo <- as.factor(teste2$Tipo ) 


teste2  %>% filter(teste2$Idade==10) %>% ggplot(aes(Ano, Taxa, col = Tipo)) + geom_line()

teste2  %>% filter(teste2$Idade==60 & teste2$Tipo!="Media") %>% ggplot(aes(Ano, Taxa, col = Tipo)) + geom_line()

teste2  %>% filter(teste2$Idade==60) %>% ggplot(aes(Ano, Taxa, col = Tipo)) + geom_line()

  teste2  %>% filter((teste2$Ano==2000 | teste2$Ano==2002) & teste2$Idade==60)



teste2 %>% filter(teste2$Idade==60) %>% ggplot(aes(Ano, Idade, col = Taxa)) + geom_line()
  
