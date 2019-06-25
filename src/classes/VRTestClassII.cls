@isTest
private class VRTestClassII {
    static testMethod void MatchSpouse(){
            
            Account a= new Account(Name='res');
            Insert a;
            
            Contact c= new Contact(LastName='anil');
            insert c;
            
            Contact cs= new Contact(LastName='rajesh',Spouse__c=c.Id);
            insert cs;
          //  c=[select id,Spouse__c from Contact where Id=: c.Spouse__c];
         //    System.assertEquals('Anil', c.Spouse__r.id);
        
        }

}