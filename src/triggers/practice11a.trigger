trigger practice11a on Contact (before delete) {
    for(Contact a:[Select id,name from Contact where accountid !=null AND Account.Activ__c=true])
    trigger.oldMap.get(a.accountid).adderror('cant delete');

}