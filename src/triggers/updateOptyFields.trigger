trigger updateOptyFields on Opportunity (after insert, after update) {
    
    List<contact> conList = new List <contact>();
    
    for (opportunity optyObj: Trigger.new){
        if (optyObj.StageName == 'Qualification' && optyObj.Borrower__c <> null){
            
            conList = [select Id,Login_details__c from contact where Id = :optyObj.Borrower__c ];
            for(contact conObj: conList){
                conObj.Login_details__c = system.now()+'test';
            }
            update(conList);
        }   
    }
}