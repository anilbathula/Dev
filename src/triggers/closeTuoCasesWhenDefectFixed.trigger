trigger closeTuoCasesWhenDefectFixed on Contact (after update) {
set<id>dids=new set<id>();
Map<id,Contact> varmap=new Map<id,Contact>();
list<case>cs=new list<case>();

    for(Contact d : Trigger.new){
        if(d.FirstName != ''){
           dids.add(d.id);
           varmap.put(d.id,d);
        }
    }
    if(!varmap.isempty()){
        
    
     List<case> cas = [select id,Subject,contactid,description from case where Contactid =:varmap.keyset()];
            for(case c : cas ){
                c.Description = 'Solution Available'+varmap.get(c.contactid).LastName;
                system.debug('--->'+c.description);
               // c.Solution__c = d.Resolution__c;
            cs.add(c);
            }
            update cs;
   }         
}