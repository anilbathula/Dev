trigger Opportunity_CloseDate_Update on Opportunity (after update) {
   
   //check the opprtunites in the trigger to see if the Close Date change. 
   //if so add them to a Set
   Set<Id> StandAloneAndSubsidiaryOppIds = new Set<Id>();
   for(Integer i=0;i<trigger.new.size();i++){
       if(trigger.new[i].CloseDate <> trigger.old[i].CloseDate){
           StandAloneAndSubsidiaryOppIds.add(Trigger.new[i].id);
       }
   }
   
   //Process any opps that have changed
   if(StandAloneAndSubsidiaryOppIds.size() > 0){
       //get all of the opportunity Line items tied to opportunities in this trigger
       List<Opportunity> oliList = [select Id, Name, CloseDate, (select Id, ServiceDate, OpportunityId from OpportunityLineItems) from Opportunity where Id IN :StandAloneAndSubsidiaryOppIds];
       
       //create list to hold opportunity line items that need updating.
       List<OpportunityLineItem> oliUpdateList = new List<OpportunityLineItem>();
       
       //loop through opportunites and update all of the opportunity line items. add line items to udpat list.
       for(Opportunity o : oliList){
           for(OpportunityLineItem oli : o.OpportunityLineItems){
               if( oli.ServiceDate < o.CloseDate){
                   oli.ServiceDate = o.CloseDate;
               }
               oliUpdateList.add(oli);
           }
       }
       
       //update the line items
       if(!oliUpdateList.isEmpty()){
           update oliUpdateList;
       }
   }
}