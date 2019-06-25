trigger deleteExistingForecasts on Opportunity (before update) {
   
    Set<Id> ids = new set<Id>();
    
    for(Opportunity op: Trigger.new){       
        if(op.Stagename=='Closed Won'){
            ids.add(op.Id); 
        }
    }
    
    //if(!ids.isempty()){
        delete [SELECT Id FROM Comments__c WHERE Opportunity__c IN :ids];
    //}
}