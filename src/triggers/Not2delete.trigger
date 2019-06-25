trigger Not2delete on Account (before delete) {
for(Account a:trigger.old)
    if(a.ACCID__c=='0019000000AC31y'){
        a.adderror('This Account cant be deleted its a default record by salesforce');
    }

}