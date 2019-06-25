@isTest 
private class HelloWorldTestClass {
    static testMethod void validateHelloWorld() {
       lead__c l = new lead__c(Name='Behind the Cloud', List_Number__c=100);
       System.debug('Price before inserting new book: ' + l.List_Number__c);

       // Insert book 
    
       insert l;
    
       // Retrieve the new book 
    
       l= [SELECT List_Number__c FROM lead__c WHERE Id =:l.Id];
       System.debug('Price after trigger fired: ' + l.List_Number__c);

       // Test that the trigger correctly updated the price 
    
       System.assertEquals(90, l.List_Number__c);
    }
}