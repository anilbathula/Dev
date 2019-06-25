trigger debugvalues on Contact (before insert,before update,after insert,after update) {

for(contact c:trigger.new){
    if(trigger.isbefore && trigger.isinsert){
      System.debug('==inb=>'+c.New_year__c);
    }
    
    if(trigger.isbefore && trigger.isupdate){
      System.debug('=upb==>'+c.New_year__c);
    }
    
    if(trigger.isAfter && trigger.isinsert){
      System.debug('==inA=>'+c.New_year__c);
    }
    
    if(trigger.isAfter && trigger.isupdate){
      System.debug('=upA==>'+c.New_year__c);
    }
}

}