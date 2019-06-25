trigger mailingaddrs on Contact (after update) {

    List<Contact> cs = new List<Contact>();
    Map<id,Contact>varmap=new map<id,Contact>();
    string s;
    set<id>ids=new set<id>();
    
     for (Contact c : Trigger.new){
     
    IF(!staticFlag.has_dupexist(c.id)){
         if(c.accountid!=null ){
              varmap.put(c.accountid,c); 
              ids.add(c.id);
            System.debug('===>'+ids );             
         }
     }
    }
    
   if(!ids.isempty()){
    for (Contact c : [SELECT id, accountId, MailingCity,
                             MailingCountry, MailingPostalCode,
                             MailingState, MailingStreet
                            FROM contact
                            WHERE accountId
                            in :varmap.keySet()]) {
                            

        Contact parentAccount = varmap.get(c.Id);
        System.debug('-->'+parentAccount);

        c.MailingCity = System.now() + ' '+'test';
        cs.add(c);

       
        }
Update cs;
}
   
   

}