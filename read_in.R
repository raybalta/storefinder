files<-list.files(data)

grep(".csv", files, value = T)


foodstuff<-read.csv(paste0(data,"Scanned vs Not Scanned Matrix Grid TOTAL FOODSTUFFS All Categories Harraways  and  Sons Ltd_Scanned Matrix.csv"), skip = 5)
supervalue<-read.csv(paste0(data, "Scanned vs Not Scanned Matrix Grid TOTAL SUPERVALUEFRESH CHOICE All Categories Harraways  and  Sons _Scanned Matrix.csv"), skip = 5)
pak<-read.csv(paste0(data, "Scanned vs Not Scanned Matrix Grid TOTAL FOODSTUFFS All Categories Harraways  and  Sons Ltd_Scanned Matrix.csv"), skip = 5)
