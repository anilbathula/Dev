global class bulkdelleads Implements Schedulable{
public static String CRON_EXP = '0 0 0 3 9 ? 2022';
     global void Execute(SchedulableContext SC){    
             
        Del_leads ld=new Del_leads();
        ld.query='select id,Name,Company,Phone,Email from lead where createddate<=:z and date_opened__c=null limit 200 ';                  
        database.executebatch(ld);    
        
        Del_oppys op=New Del_oppys();
        op.query='Select id,Name From Opportunity Where Createddate<=:z limit 5';
        Database.executeBatch(op);
           
     }
   /*----------Test Method-------------------*/
   static testmethod void bulkdelleads () {   
   Test.startTest();

      Lead l = new Lead ();
      l.LastName = 'Raghu ';
      l.company='eg';
      insert l;

   // Schedule the test job     

      String jobId = System.schedule('testBasicScheduledApex',bulkdelleads.CRON_EXP,new bulkdelleads());
   // Get the information from the CronTrigger API object 
    

      CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, 
         NextFireTime
         FROM CronTrigger WHERE id = :jobId];

   // Verify the expressions are the same 
    
      System.assertEquals(bulkdelleads.CRON_EXP,ct.CronExpression);

   // Verify the job has not run 
    
      System.assertEquals(0, ct.TimesTriggered);

   // Verify the next time the job will run 
    
      System.assertEquals('2022-09-03 00:00:00', 
         String.valueOf(ct.NextFireTime));
     

   Test.stopTest();

  

   }


}