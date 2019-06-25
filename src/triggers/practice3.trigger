trigger practice3 on Account (before insert,before update) {
set<string>ids=new set<string>();
 
    for(Account r : trigger.New){
    System.debug('===1===>'+r.id);
    if(r.Lock__c=true && r.fax!=null){             
          ids.add(r.id);
         // r.addError('You can\'t edit this record its locked!'); 
        }   
    }
    
    if(!ids.isempty()){
        for(Account r : trigger.New){
            system.debug('===2===>'+r.id);
        }
      
    }
    
   

}