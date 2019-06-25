trigger createleads on Opportunity (After Update) {
    Opportunity opn;
    lead__c l;
    
    for(Opportunity o:Trigger.New){
    opn=o;
    
    }
    if(opn.StageName=='Qualification')
    {
    l=new lead__c(Name=opn.Name);   
    insert l;         
    }

}