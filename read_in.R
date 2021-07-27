files<-list.files(data)

grep(".csv", files, value = T)


foodstuff<-read.csv(paste0(data,"Scanned vs Not Scanned Matrix Grid TOTAL FOODSTUFFS All Categories Harraways  and  Sons Ltd_Scanned Matrix.csv"), skip = 5)
supervalue<-read.csv(paste0(data, "Scanned vs Not Scanned Matrix Grid TOTAL SUPERVALUEFRESH CHOICE All Categories Harraways  and  Sons _Scanned Matrix.csv"), skip = 5)
woolwoorth<-read.csv(paste0(data, "Scanned vs Not Scanned Matrix Grid WOOLWORTHS NZ EXCL SVFC All Categories Harraways  and  Sons Ltd_Scanned Matrix.csv"), skip = 5)

clean_source_data<-function(data){

data<-data%>%
  select(-State)%>%
  filter(!is.na(Storeid))%>%
  replace(is.na(.),0)%>%
  gather(Product, count, -StoreName, -Storeid)


return(data)


}

food_stuff<-clean_source_data(foodstuff)
super<-clean_source_data(supervalue)
countdown<-clean_source_data(woolwoorth)
