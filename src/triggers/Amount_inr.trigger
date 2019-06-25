trigger Amount_inr on Invoice__c (before insert,before update) {
    if (Trigger.isInsert) {  
        for(Invoice__c c: Trigger.new){       
                c.Amount_INR__c=c.Amount__c;  
                }    
           
        }
    if (Trigger.isUpdate) {  
    Invoice__c cs=[select id,Amount__c From Invoice__c where Amount__c >  1 ];
        for(Invoice__c c: Trigger.new){  
        if(trigger.oldMap.get(c.id).Amount__c==null&&trigger.newMap.get(c.id).Amount__c!=null){
               c.Amount_INR__c=c.Amount__c;
            }    
          else  if(trigger.oldMap.get(c.id).Amount__c!=trigger.newMap.get(c.id).Amount__c){
               c.Amount_INR__c=000.00;
            }   
        }
    }
}