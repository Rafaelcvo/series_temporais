# Exercicios pag 16 - 1.4.1

v1 = c(105, 106, 150, 135, 120, 147)
v2 = c(105, 250, 300, 175, 157, 147, 134)

v <- c(v1, v2)
v

uni <- unique(v)
uni
uni[3]
length(uni)
mean(uni)
max(uni)

# Exercicio pag 17 1.5

produto <- c('Produto A', 'Produto B', 'Produto C' ,'Produto D', 'Produto E')
preco <- c(5, 15, 4, 6, 8)
tabela <- data.frame(produto, preco)
tabela[4:5,]

# Criando uma nova coluna

tabela$quant <- c(50,100,120,150,200)

tabela[, 'custos'] <- c(2,12,3,5,6)
tabela

# Trabalhando com o dataset iris

base_flores <- iris

str(base_flores)

head(base_flores)

summary(base_flores)

names(base_flores)


# Exercicio pag 1.5.1

nome<-c("Paulo",	"Anna","Pedro",	"Viviane",	"Ricardo",	"Diego",	"Marcos","Renata","Victor","Bruno",	"Juliana",	"Adriana",	"Juliana",	"Beatriz","Vanessa",	"Ingrid","Mariana")
genero<-c(1	,2	,1	,2,	1	,1,	1,	2	,1	,1,	2,	2,	2,	2,	2	,1,2)
regiao<-c("Região 2",	"Região 3",	"Região 3",	"Região 2",	"Região 3","Região 5",	"Região 2",	"Região 5",	"Região 5",	"Região 1","Região 1","Região 1","Região 2","Região 1",	"Região 2",	"Região 3",	"Região 3")
idade<-c(36,32,	30,	32,	31,	29,	35,	33,	25,	27,	27,	19,	31,	22,	36,	34	,33)

tabela_pessoas <- data.frame(nome, genero, regiao, idade)
tabela_pessoas  

# Quantas observaçoes tem no dataframe
nrow(tabela_pessoas)  
  
# Media de idade das pessoas
mean(tabela_pessoas$idade)

# Classes de cada uma das colunas
str(tabela_pessoas)

# Resumo da tabela
summary(tabela_pessoas)

pessoas <- read.table(file = "datasets/populacao.txt", header = TRUE, sep = "\t",
                      encoding = "UTF-8",check.names = F)
head(pessoas)  
  
pessoas_csv <- read.csv(file = "datasets/populacao.csv", encoding="ISO-8859-1", check.names = F)

head(pessoas_csv)

produto <- c('p1', 'p2', 'p3')
valor <- c(2,3,5)
tabela <- data.frame(produto, valor)
tabela
tabela$dobro <- NA
tabela
tabela$triplo <- tabela$valor * 3
tabela  
produto  
  
  
  
  
  
  
  