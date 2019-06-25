trigger ur_name on lead__c (after update) {
if(trigger.isUpdate) {
List<lead__c> recToDelete = new List<lead__c>();
for(lead__c u : trigger.new) {
    if(u.Date_of_Birth__c!=trigger.oldmap.get(u.id).Date_of_Birth__c){
    Lead__c eDel = new lead__c(Id=u.Id);
         recToDelete.add(edel);
    }
}
delete recToDelete;
}
}