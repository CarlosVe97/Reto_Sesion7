install.packages('rvest')
library(rvest)

link <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
file<-read_html(theurl)

tablas<-html_nodes(file, "table")
?html_table
tabla1 <- html_table(tablas[1], fill = TRUE)
tabla1

tabla_sin_na <- na.omit(as.data.frame(tabla1))

str(tabla_sin_na)
tabla_sin_na$Sueldo <- gsub("MXN","",tabla_sin_na$Sueldo)
tabla_sin_na$Sueldo <- gsub("/mes$", "", tabla_sin_na$Sueldo)
tabla_sin_na$Sueldo <- gsub("\\$", "", tabla_sin_na$Sueldo)
tabla_sin_na$Sueldo <- gsub(",","", tabla_sin_na$Sueldo)
tabla_sin_na$Sueldo <- as.numeric(tabla_sin_na$Sueldo)
tabla_sin_na
str(tabla_sin_na)

max.pay <- which.max(tabla_sin_na$Sueldo)
tabla_sin_na[max.pay,]

min.pay <- which.min(tabla_sin_na$Sueldo)
min.pay
tabla_sin_na[min.pay,]
