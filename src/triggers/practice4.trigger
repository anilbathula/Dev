trigger practice4 on Contact (before Insert,before update,before delete) {
  
    if(Trigger.isDelete){
       for(Contact a:[Select id,name,accountid,account.Name,Account.lock__c from Contact where( accountid!=null AND Account.lock__c=true) AND id in :trigger.old]){
        if(a.Account.lock__c=true){         
          Trigger.oldMap.get(a.id).addError('ERROR TRM100: Parent is Locked: <a href=\'https://ap1.salesforce.com/' + a.accountid + '\'> ' + a.account.Name + '</a>');
        }
        }
    }
    if(Trigger.isUpdate){
        for(Contact a:[Select id,name,accountid,Account.lock__c from Contact where( accountid!=null AND Account.lock__c=true) AND id in :trigger.new]){
          if( a.Account.lock__c=true){         
          Trigger.NewMap.get(a.id).addError('ERROR TRM100: Parent is Locked: <a href=\'https://ap1.salesforce.com/' + a.accountid + '\'> ' + a.account.Name + '</a>');
        }
        
        }
        
    }
   if(Trigger.isInsert){
               
        set<id> s=new set<id>();
         for(Contact a:Trigger.new){
             if(a.accountid!=null)
               s.add(a.accountid);
         }
         if(!s.isEmpty()){
             Account a=[Select id,Name,Lock__c from Account where  id in:s];
                 for(Contact c:Trigger.new){
                       if(a.lock__c=true){
                           c.addError('Cannot Create parent is locked');
                       }
                  }
         }        
    }
   
     
  
}