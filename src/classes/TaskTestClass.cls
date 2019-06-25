@isTest 
private class TaskTestClass { 

   static testMethod void Taskowneremail() { 

           
                System.debug('Insert Application Record... (single record validation)'); 
                Contact testContact = new contact(LastName='Testing1',FirstName='Apex'); 
                insert testContact; 
                Opportunity o=new opportunity(Name='Anil',StageName='Qualification',CloseDate=System.Today(),Borrower__c=TestContact.id);
                Insert o;

      System.debug('Insert Task Record'); 
                Task testTask = new Task(Subject='AD First Mailing +email',WhoId=testContact.ID,Whatid=o.id); 
                try{ 
                insert testTask; 
                }catch(DMLException e){ 
       system.debug('ERROR Inserting Task:'+e.getDMLMessage(0)); 
  } 

          
    } 
}