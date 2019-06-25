trigger upcom1 on opportunity (after insert,after update) {

Set<Id> sobjectSetOfIds = new Set<Id>(); 
map<string,String> smap=new map<string,string>();
 for(opportunity fs:trigger.new) {
    if(fs.Borrower__c!=null)
    {  
        smap.put(fs.Borrower__c,fs.id);
        sobjectSetOfIds.add(fs.Borrower__c);
     }
 } 
  
       
 list<Comments__c> comlist = [select id,opportunity__c,Contact__c,Finance__c from Comments__c where Contact__r.RecordType.name=:'Applicant' AND Contact__c  in :sobjectSetOfIds]; 

 list<Comments__c> updatedcomlist = new list<Comments__c>(); 
    for(Comments__c cm: comlist) 
    {   
        if(smap.containsKey(cm.Contact__c))  {
            cm.Opportunity__c=smap.get(cm.Contact__c);   
        }        
        updatedcomlist.add(cm); 
     }
     system.debug(updatedcomlist.size()+'Comments to insert is -----------------------------------'+updatedcomlist);
     update updatedcomlist;
}