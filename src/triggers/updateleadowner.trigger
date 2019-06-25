trigger updateleadowner on Lead (before update) {

list<lead>listlead=new list<lead>();

for(lead l:[select id,leadsource,owner.profile.name from lead where id in:trigger.newmap.keyset()]){
   // system.debug('===1==>'+l.firstname+'==='+l.lastname);
  if(l.owner.profile.name!='System'){
     system.debug('=====>'+l.owner.profile.name);
    
     l.leadsource='Other';
   
    
    
  }
}
 


}