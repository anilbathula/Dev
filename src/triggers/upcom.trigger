trigger upcom on Finance__c (after insert,after update) {

Set<Id> sobjectSetOfIds = new Set<Id>(); 
map<string,String> smap=new map<string,string>();
 for(Finance__c fs:trigger.new) {
    if(fs.Opportunity__c!=null)
    {  
        smap.put(fs.opportunity__c,fs.id);
        sobjectSetOfIds.add(fs.Opportunity__c);
     }
 } 
  
       
 list<Comments__c> comlist = [select id,opportunity__c,Contact__c,Finance__c from Comments__c where opportunity__c in :sobjectSetOfIds]; 

 list<Comments__c> updatedcomlist = new list<Comments__c>(); 
    for(Comments__c cm: comlist) 
    {   
        if(smap.containsKey(cm.opportunity__c))  {
            cm.Finance__c=smap.get(cm.opportunity__c);   
        }        
        updatedcomlist.add(cm); 
     }
     system.debug(updatedcomlist.size()+'Comments to insert is -----------------------------------'+updatedcomlist);
     update updatedcomlist;
}