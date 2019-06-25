public class OutputController {       
    //variables and getter/setter
    public String output {get;set;}
    public String hide {get;set;}   
   
    //action method of the button
    public PageReference create() {
        output = hide;
        return null;
    }        
   
 /*   //test method
    public static testMethod void testPage(){
        Test.setCurrentPage(Page.VisualforceCodeCreator);
        Test.startTest();
        OutputController oc = new OutputController();
        oc.create();
        Test.stopTest();
    }*/
}