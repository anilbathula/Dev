@isTest
public class showContactsController_Test {

    public static testMethod void controllerTest(){
        Account acc = new Account(Name='Test');
        insert acc;
        
        Contact con = new Contact(LastName='Test12',Phone='852149633',AccountId=acc.Id);
        insert con;
        
        Pagereference pageRef = Page.showContacts;
        pageRef.getParameters().put('LastName','Test123');
        pageRef.getParameters().put('id',con.id);
        //Test.setCurrentPage(pageRef);
        
        //Test.startTest();
        showContactsController controller = new showContactsController();
        
        PageReference pr1 = controller.doSubmit();
        Pagereference pr2 = controller.save();
        //Test.stopTest();
        System.assertEquals(pr2.getUrl(),'/'+con.Id);
    }
}