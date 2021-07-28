
##step 1

source("setup.R")
source("read_in.R")
source("functions.R")

countdown_prod_code<-clean_prod_code_file(prod_code_count)
superv<-clean_prod_code_file(prod_code_superval)
foodstuff_prod_code<-clean_prod_code_file(prod_code_foodstuff)


groceries<- Reduce( function (x, y) rbind (x,y), list (countdown_prod_code, superv, foodstuff_prod_code ))%>%
  mutate(Product.Description = tolower(Product.Description))




##ADD PRODUCT NAMES


groceries_with_names<-concord_product_names(groceries, product_conconrdance_new)


groceries_with_addresses<-add_address(groceries_with_names)


create_upload_files(groceries_with_addresses)




##prod

# iri_prodnames<-unique(groceries$Product.Description)
# row_num_iri<-c(1:length(iri_prodnames))
# 
# 
# iri_prods<-data.frame(row_num_iri, iri_prodnames)
# product_name<- unique(product_concordance$ProductName)
# 
# row_num<-c(1:length(product_name))
# 
# product_data<-data.frame(row_num, product_name)
# 
# df_names<-list(webnames = product_data,
#                iri_names =iri_prods )
# 
# write_xlsx(df_names, "product names.xlsx")

