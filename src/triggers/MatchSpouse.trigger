trigger MatchSpouse on Contact (after insert, before update) {
    List<Contact> spouses = new List<Contact>();
    Contact spouse;
        for (Contact c : Trigger.new){
        if (c.Spouse__c != null){
        
            spouse = [select id,Spouse__c from Contact where Id=: c.Spouse__c ];
          
           if(spouse.Spouse__c != c.id)
           {
            spouse.Spouse__c = c.id;
            spouses.add(spouse);
           }
        }
    }
    if(spouses.size()>0 && staticFlag.a ){
        staticFlag.a = false;
    update spouses;

    }
}