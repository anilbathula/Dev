Public Class ldComments{
public lead l {get;set;}
public Comments__c Com{get; set;}

id str,str1,str2,str3,str4;



    public LdComments(ApexPages.StandardController controller) {
        l=(Lead)controller.getRecord();
        str=Apexpages.currentpage().getparameters().get('id');
          
       list<Comments__c> c=[select id,name,lead__c,Contact__c,Opportunity__c,Finance__c from comments__c where lead__c=:str];         
                   
    }
    }