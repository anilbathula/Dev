trigger Lead_UpdateOwner on Lead(before insert, before update)
{
     Map<Id, String> ownerMap = new Map<Id, String>();
     Map<Id, Boolean> ownerMap1 = new Map<Id,Boolean>();
     Map<Id,user> u1=new map<id,user>();
    for (Lead lead : Trigger.new)
    {
        ownerMap.put(lead.OwnerId, null);
       
    }

    if (ownerMap.size() > 0)
    {
        for (User[] users : [SELECT Id,Name,Email,isActive FROM User WHERE Id IN :ownerMap.keySet()])
        {
            for (Integer i=0; i<users.size(); i++)
            {
               // ownerMap.put(users[i].Id, users[i].Email);
               // ownerMap1.put(users[i].Id, users[i].isActive);
               u1.put(users[i].Id,users[i] );
            }
        }
        for (Lead lead : Trigger.new)
        {
           // lead.lead_owner_email__c = ownerMap.get(lead.OwnerId);
            //lead.lead_owner_status__c= string.valueof(ownerMap1.get(lead.OwnerId));
            lead.lead_owner_status__c=string.valueof(u1.get(lead.ownerid).IsActive);
            lead.lead_owner_email__c = u1.get(lead.OwnerId).Email;
            
            
        }
    }
}