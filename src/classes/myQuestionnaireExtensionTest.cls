@isTest
private class myQuestionnaireExtensionTest {
  public  static testMethod void myQuestionnaireExtension() {
        // Set up the Account record.
        lead__c q = new lead__c(Name = 'TestQuestionnaire');
        insert q;
       
        ApexPages.StandardController sc = new ApexPages.standardController(q);    
        myQuestionnaireExtension lc=new myQuestionnaireExtension(sc);        
        lc.saveQuestionnaire();       
        PageReference Search = lc.saveQuestionnaire(); 
       
        }
}