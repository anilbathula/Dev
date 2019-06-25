trigger practice2 on Account (before update) {
    if(Trigger.Isupdate){
    list<Contact> cs=[select id,name,slno__c from contact where Accountid=:trigger.new];
    
       for(Account a:Trigger.New)
        if(a.Total_Slno__c==null){
        for(Contact c:cs){
           
            }
        }
        
    
    }
   
    

}