public class AccountProcessor {
    @future
    public static void countContact(Set<Id> setId){
        List<Account> lstAccount = [select Id,Number_of_Contacts__c,(select id from contacts) from account where id in :setId];
        for(Account acc : lstAccount){
            List<Contact> lstCont = acc.contacts;
            acc.Number_of_Contacts__c = lstCont.size();
        }
        update lstAccount;
    }
}