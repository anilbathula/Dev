trigger practice101 on Contact(before delete) {
set<id>ids=new set<id>();

    for(contact c:trigger.old){        
        ids.add(c.Accountid);
    }
    
    if(!ids.isempty()){
     list<contact>cs=[select id,AccountId from contact where Accountid In:ids];
        for(contact c:cs){
         if(cs.size()>0)
          c.addError('Cannot delete Account with a contact');
        }
    }

}