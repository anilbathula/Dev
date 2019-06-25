trigger practice10 on Account (before delete) {

    for (Contact c : [SELECT id,Account.Name FROM Contact WHERE Accountid IN :Trigger.oldMap.keySet()]) {
        Trigger.oldMap.get(c.Accountid).addError('Cannot delete Account with a contact');
    }

}