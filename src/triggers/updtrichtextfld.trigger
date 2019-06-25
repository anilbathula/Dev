trigger updtrichtextfld on Duplicate_Leads__c (before insert,before update) {

    for(Duplicate_Leads__c d:trigger.new){
        if(d.What_the_program__c!=null){
            d.Next_Program__c=d.What_the_program__c;
            system.debug('----->'+d.Next_Program__c);
        }
    }

}