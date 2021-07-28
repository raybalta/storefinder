add_address<-function(data){
  
  grocery<-read.csv(paste0(concordance,"updated_storeid_list.csv"))
  
  grocery_list<-grocery%>%
    select(Storeid=storenumber, StoreName = storename, everything(), -State)%>%
    mutate(Address = str_to_title(Address),
           StoreName = str_to_title(StoreName),
           ClassName = "StoreLocation",
           LastEdited = as.character(Sys.Date()),
           Created = as.character(Sys.Date()))
  
  data<-left_join( data, grocery_list, by = "Storeid")%>%
    filter(!is.na(Address))%>%
    mutate(ID = rownames(.))%>%
    select(ID,ClassName, LastEdited, Created, StoreName, Address, ProductName, Latitude= latitude,
           Longtitude= longitude, -Storeid)
  
 
  
  return(data)
}



clean_source_data<-function(data){
  
  data<-data%>%
    select(-State)%>%
    replace(is.na(.),0)%>%
    filter(!is.na(Storeid))%>%
    gather(Product, count, -StoreName, -Storeid)%>%
    filter(count !=0)
  
  
  return(data)
  
  
}

clean_prod_code_file<-function(data){
  
  
  data<-data%>%
    select( Storeid =  StoreId, everything(), -Ref.No.)%>%
    filter(!is.na(Storeid), !EAN %in% c("", "EAN") )%>%
    mutate(Storeid = as.numeric(Storeid))
  
  return(data)
  
}




concord_product_names<-function(data_1, data_2){
  
  data<- left_join(data_1, data_2, by = "Product.Description")%>%
    dplyr::rename(ProductName = ProductNames)%>%
    filter(!is.na(ProductName))%>%
    select(-row_num_iri, -EAN, -Product.Description)
  
  return(data)
}


create_upload_files<-function(data_1){
  
  file<-paste0("Output/", Sys.Date())
  
  if (file.exists(file)) {
    
    cat("The file already exists")
    
  } else {
    
    dir.create(file)
    
  }
  
  write.csv(data_1, paste0(file, "/", "grocery_list.csv"), row.names = F)
  
  write.csv(data_1[1], paste0(file, "/", "ids.csv"), row.names = F)
  
  
  
}
