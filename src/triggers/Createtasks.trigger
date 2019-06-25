trigger Createtasks on task (after insert) {

    List<lead__c> createtasks = new List <lead__c> ();
    
    for (task o : trigger.new) {
    
            if (o.subject == 'Email') {
                    createtasks.add(
                    new lead__c ( 
                    Name = o.CreatedBy.Name
                    ,Date_of_Birth__c=system.today()
                    ,Country__c='Malaysia'));
            }
    }
    try {
        insert createtasks;
    }
    catch (Exception Ex){
        system.debug(Ex);
    }
}