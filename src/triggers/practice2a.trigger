trigger practice2a on Lead (before Update) {
 
    if (Trigger.isUpdate) {        
        List<Comments__c> com = new List<Comments__c>();   
        list<Comments__c> c=[select id,Name,Written_by__c from comments__c where lead__c=:trigger.new];  
            
        for (Lead a :trigger.new) {    
        
        System.debug('-----)))))>'+a.id);
                for(Comments__c co:c){
                System.debug('----->'+a.LeadSource);
                  co.comments_text__c=a.LeadSource;
                  
                  com.add(co);
                }            
        }
        update com;
     }
}