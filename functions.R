add_address<-function(data){
  
  grocery<-read.csv(paste0(concordance,"updated_storeid_list.csv"))
  
  grocery_list<-grocery%>%
    select(Storeid=storenumber, everything(), -State)%>%
    mutate(Address = str_to_title(Address))
  
  df<-left_join( data, grocery_list, by = "Storeid")
  
  return(df)
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