trigger insrt_acct on Account (after insert) {
    for (Account c: Trigger.new) {     
        SendAccounts.caseToVictor(c.name,c.Description,c.type);
    }

}