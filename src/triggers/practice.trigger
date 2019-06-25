trigger practice on Account (before insert,before update) {
    
    for(Account a:Trigger.New){    
   
       if( a.phone==null){
        a.Phone.addError('You cant save the record with out this value');
        }
}    
}