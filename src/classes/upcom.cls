@isTest 
private class upcom {
    static testMethod void upcom () {
        
        Opportunity o=new opportunity(name='Anil',StageName='prospecting',CloseDate=system.today());
        insert o;  
       
       Comments__c c =new comments__c(name='text',opportunity__c=o.id);       
        insert c; 
       
       finance__c fss=new Finance__c(Name='anil',opportunity__c=o.id);
       insert fss;
       
       Comments__c cs =new comments__c(name='text',opportunity__c=o.id,Finance__c=fss.id);       
       insert cs; 
       
    //   c=[select Name,Finance__c from Comments__c where id=:c.id];
    //   System.AssertEquals(fss.id,cs.Finance__c);
    
    }
}