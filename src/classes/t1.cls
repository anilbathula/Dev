@isTest
private class t1 {
static testMethod void Createtasks() {
        
       list<Lead__c> ld= new list<lead__c>();
       {
       lead__c l=new lead__c();
       l.Name='test123';
        ld.add(l);
       
       }
       
        insert ld;
        
        
                
    
    }
}