public class AccountHandler {
//Public method
    Public static Account insertNewAccount(String AcctName){
        try{
            Account acct = new Account(Name = AcctName);
            insert acct;
            Return acct;
        }        
           catch (DMLexception e) {
                System.debug ('A DML exception has occurred:'+ e.getMessage());
                return null;
           }  
    } 
}