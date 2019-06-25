trigger myAccountTrigger on Account(before delete, before insert, before update, 
                                    after delete, after insert, after update) {
                                    
integer count=0;
if (Trigger.isBefore) {
    if (Trigger.isDelete) {

        // In a before delete trigger, the trigger accesses the records that will be 
    
        // deleted with the Trigger.old list. 
    
        for (Account a : Trigger.old) {
            if (a.name != null) {
                a.addError('You cant save the record without entering valu');
            } 
        }
    } else {

    // In before insert or before update triggers, the trigger accesses the new records 
    
    // with the Trigger.new list. 
    
        for (Account a : Trigger.new) {
            if (a.Phone == '') {
                a.Phone.addError('Enter phone number to save the record');
            }
    }
    if (Trigger.isInsert) {
        for (Account a : Trigger.new) {
        
        if (a.Phone == '') {
        a.Phone.addError('Enter phone number to save the record');
        }
             }

// If the trigger is not a before trigger, it must be an after trigger. 
    
}
else {
    if (Trigger.isUpdate) {
    

    List<Contact> cs=[Select id,Name,Accountid From Contact where Accountid IN :Trigger.new]; 
    Delete cs;    
    DataBase.emptyRecycleBin(cs); 
    


        List<Contact> contacts = new List<Contact>();
        for (Account a : Trigger.new) {        
            if(a.Name == 'makeContact') {
            


                contacts.add(new Contact (LastName = a.name+string.valueof(count++),
                                          AccountId = a.Id));
            }
        } 
      insert contacts;
    }
    
  

  }
  


}
}
}