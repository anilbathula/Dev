global class Del_leads implements Database.Batchable<sobject>
{
  
   public String query;
   public date d=System.today();
   public integer i=7;
   Public Date z=d-i;     
   Public String s;
   public integer j; 
   Public string k='Name'+','+'Company'+','+'phone'+','+'Email';  
   public datetime m=system.now(); 
   
   global Database.QueryLocator start(Database.BatchableContext BC){
      system.debug(query);
      return Database.getQueryLocator(query);
     
   }
   
   global void execute(Database.BatchableContext BC,List<Lead> Lds){     
        for( j=0;j<lds.size();j++){    
            if(j==0){                     
              s +=k+'\n'+ lds[j].Name+','+lds[j].Company+','+lds[j].phone+','+lds[j].Email; 
            } else{                    
              s +=+'\n'+ lds[j].Name+','+lds[j].Company+','+lds[j].phone+','+lds[j].Email;      
            }
         } 
            
        Blob b=Blob.valueOf(s);
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName(m+'attachment.csv');
        efa.setBody(b);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        mail.setToAddresses(new String[] {'franktoanil@gmail.com'});        
        mail.setSenderDisplayName('Batch Processing');
        mail.setSubject('Batch Process Completed');
        mail.setPlainTextBody('Please find the attachment of deleted records');
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});     
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });       
        delete Lds;           
    }  
   
    global void finish(Database.BatchableContext BC){     
         System.debug(LoggingLevel.WARN,'Deleting Leads Finished');
    }

           
    
}