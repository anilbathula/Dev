trigger terst on dupe_eliminator__AccChild__c (before insert,before update) {

    For(dupe_eliminator__AccChild__c c:trigger.new){
        
        c.Name='Dupe emliminator';
        
    }

}