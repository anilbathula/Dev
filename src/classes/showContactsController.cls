public with sharing class showContactsController {
    public List<Contact> conList{get;set;}
    public Contact con{get;set;}
    public showContactsController(){
        con = new  Contact();
        conList = [Select id,LastName,Name,Phone from Contact LIMIT 10];
    }
    
    public pagereference doSubmit(){
    pagereference pageRef = new pagereference('/apex/PaginationRecords');
    pageRef.setRedirect(true);
    return pageRef;
    }
    
    public pagereference save(){
        if(!String.isBlank(con.LastName))            
    insert con;
        System.debug('Contact id---------->'+con.id);
    return new pagereference('/'+con.id);
    }
}