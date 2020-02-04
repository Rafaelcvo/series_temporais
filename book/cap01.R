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






