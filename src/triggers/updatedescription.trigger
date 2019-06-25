trigger updatedescription on Account (before insert,before update) {
    Account acc;
    for(Account ac:trigger.New){
        acc=ac;
        System.debug('anil::::::'+acc);
    }
    acc.Description=acc.Name +'      ' + 'account created';
    System.debug('anil::::::'+acc.Description);
    
}