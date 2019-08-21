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

#salva o arquivo
#row.names = FALSE oculta a coluna com o número de linhas
write.csv2(xl_data[y,x], "tste2.csv", row.names = FALSE)



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

