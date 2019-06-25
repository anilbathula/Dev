trigger updateChildCases on Case (after update) {
  

        List<Case> childrenToUpdate = new List<Case>();
        Set<Id> parentIds = new Set<Id>();
        Map<id,Case>Mapofcase=new Map<id,case>();
        for(Case p:trigger.new) {
        
            if(p.status!=trigger.oldmap.get(p.id).status && p.IsClosed) {
                Mapofcase.put(p.Id,p);
                system.debug('====>'+Mapofcase);
            }
        }
        
        if(!Mapofcase.isempty()) {
         //query child fields which need to be update
            for(Case ch : [SELECT Id,Status,Parent.Id  FROM Case WHERE Parent.Id IN :Mapofcase.keyset()]) {
            system.debug('====>'+ch.id);
            
              if(Mapofcase.containsKey(ch.Parent.Id)){
                     ch.Status=Mapofcase.get(ch.Parent.Id).Status;
                     childrenToupdate.add(ch);
               }
              
            } 
            if(!childrenToUpdate.isempty())
            Update childrenToUpdate;
        }
}