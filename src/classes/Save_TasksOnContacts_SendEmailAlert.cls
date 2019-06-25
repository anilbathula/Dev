@isTest 
private class Save_TasksOnContacts_SendEmailAlert { 

   static testMethod void Test_contact() { 

           
                
                Contact testContact = new contact(LastName='Testing1',FirstName='Apex',email='anil@gmail.com'); 
                insert testContact; 
               

     
                Task testTask = new Task(Subject='AD First Mailing +email',WhoId=testContact.ID); 
                 
                insert testTask; 
              
  

          
    } 
}