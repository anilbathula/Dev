/*-----------------Test Method-----------------*/
 
 @IsTest

private class bulk_delete_individual_emails_Test{

  public static testMethod void Del_leads (){    
            List <Lead> lds = new List<Lead>();
                for(integer i = 0; i<200; i++){
                    Lead l = new Lead(LastName='Anil',Company='ef'); 
                    lds.add(l);
                 } 
            insert lds;  
       //Test.startTest();                  
            Del_leads dl = new Del_Leads();               
            dl.query='select id,Name,Company,Phone,Email,date_opened__c from lead Where CreatedDate<=Today AND Date_opened__c=null limit 200 ';
            ID batchprocessid = Database.executeBatch(dl,200);
      // Test.stoptest();  
       }
     }