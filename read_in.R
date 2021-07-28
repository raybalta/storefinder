files<-list.files(data)

grep(".csv", files, value = T)

product_concordance<-readxl::read_xlsx (paste0(concordance,"product_names_updated.xlsx"))

product_conconrdance_new<-readxl::read_xlsx("product names.xlsx", sheet = 2)%>%
  dplyr::rename(Product.Description = iri_prodnames, ProductNames = concorded_names )


foodstuff<-read.csv(paste0(data,"Scanned vs Not Scanned Matrix Grid TOTAL FOODSTUFFS All Categories Harraways  and  Sons Ltd_Scanned Matrix.csv"), skip = 5)
supervalue<-read.csv(paste0(data, "Scanned vs Not Scanned Matrix Grid TOTAL SUPERVALUEFRESH CHOICE All Categories Harraways  and  Sons _Scanned Matrix.csv"), skip = 5)
woolwoorth<-read.csv(paste0(data, "Scanned vs Not Scanned Matrix Grid WOOLWORTHS NZ EXCL SVFC All Categories Harraways  and  Sons Ltd_Scanned Matrix.csv"), skip = 5)



prod_code_count<-read.csv(paste0(data, "Scanned vs Not Scanned Matrix National WOOLWORTHS NZ EXCL SVFC All Categories Harraways  and  Sons L_Not Scanned by Store.csv"), skip = 5)
prod_code_foodstuff<-read.csv(paste0(data, "Scanned vs Not Scanned Matrix National TOTAL FOODSTUFFS All Categories Harraways  and  Sons Ltd_Not Scanned by Store.csv"), skip = 5)
prod_code_superval<-read.csv(paste0(data, "Scanned vs Not Scanned Matrix National TOTAL SUPERVALUEFRESH CHOICE All Categories Harraways  and  S_Not Scanned by Store.csv"), skip = 5)


