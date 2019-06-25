trigger Commentsonconvert on Lead (after update,after insert) {
     List<String> leadIDs = new List<String>();
     List<Comments__c> Com = new List<Comments__c>();
  //   List<Lead> leads = new List<Lead>(); 
     map<id,Lead> smap=new map<id,Lead>();
 
         for(Lead l: Trigger.New) {
             if (l.isConverted == true) { 
             smap.put(l.id,l);
                 leadIDs.add(l.Id);
                 //leads.add(l); 
             } 
         }
          
     list <Comments__c> cs = [Select id,Contact__c, Opportunity__c, Lead__c from Comments__c where Lead__c IN :leadIDs]; 
         for (Comments__c comTemp :cs ) { 
             if(smap.ContainsKey(comtemp.Lead__c)){
                   comTemp.Opportunity__c = smap.get(comtemp.Lead__c).ConvertedOpportunityId;
                     comTemp.Contact__c = smap.get(comtemp.Lead__c).ConvertedContactId; 
                     Com.add(comTemp); 
             }
          } if(Com!=null)  
            update Com; 
}