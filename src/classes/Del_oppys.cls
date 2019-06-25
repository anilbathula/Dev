global class Del_oppys implements Database.Batchable<sobject>
{
  
   public String query;  
   public date d=System.today();
   public integer i=7;
   Public Date z=d-i;
   String email;
  
   global Database.QueryLocator start(Database.BatchableContext BC){
      system.debug(query);
      return Database.getQueryLocator(query);
   }
   
   global void execute(Database.BatchableContext BC,List<Opportunity> Lds){
       delete Lds;       
   }  
   
   global void finish(Database.BatchableContext BC){
                System.debug(LoggingLevel.WARN,'Deleting Opportunity Finished');
   }
}