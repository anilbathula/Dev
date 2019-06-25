@isTest
 private class Updtcon {
  static testMethod void Updtcon () { 
  Id idRecordType = [select Id,name from RecordType where name='Applicant' and SObjectType='Contact' limit 1].Id;
   Contact C= new contact(LastName='Anil', RecordTypeid = idRecordType); 
   insert c; 
   Opportunity o=new opportunity(name='Anil',StageName='prospecting',CloseDate=system.today(),Borrower__c=c.id);
    insert o; 
    Finance__c f=new finance__c(Name='payment',opportunity__c=o.id,Contact__c=o.Borrower__r.id); 
    insert f; 
    Comments__c cm=new comments__c(Name='Raghu',Contact__c=c.id); 
    insert cm; 
    comments__c cms=new comments__c(Name='Anil',opportunity__c=o.id); 
    insert cms; 
    Comments__c cs=new comments__c(Name='Anil',Finance__c=f.id);
     insert cs; 
     } 
     }