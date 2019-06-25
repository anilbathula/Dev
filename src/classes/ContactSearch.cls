public class ContactSearch {    
    Public Static List<Contact> searchForContacts(String strLName,String strMailingPostalCode ){        
        List<Contact> lstCont = [Select ID, Name from Contact Where LastName =:strLName And MailingPostalCode =: strMailingPostalCode ];        
       Return lstCont;
    }
}