public with sharing class myQuestionnaireExtension {
private final lead__c webquestionnaire;
public myQuestionnaireExtension(ApexPages.StandardController
stdController) {
webquestionnaire = (lead__c)stdController.getRecord();
}
public PageReference saveQuestionnaire() {
try {
insert(webquestionnaire);
}
catch(System.DMLException e) {
ApexPages.addMessages(e);
return null;
}
PageReference p = Page.ThankYou;
p.setRedirect(true);
return p;
}
}