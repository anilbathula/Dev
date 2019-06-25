Public Class Comments{
public Comments__c Com{get; set;}

id str,str1,str2,str3,str4;



    public Comments(ApexPages.StandardController controller) {
        Com=(Comments__c)controller.getRecord();
        str=Apexpages.currentpage().getparameters().get('id');
          
        Comments__c c=[select id,name,lead__c,Contact__c,Opportunity__c,Finance__c from comments__c where id=:str];         
            str1=c.Contact__c;   
            str2=c.Opportunity__c;
            str3=c.Finance__c;
            str4=c.lead__c;         
    }
   
/* Redirecting to lead detail page if lead value is there in the comments*/
    public PageReference lead() {   
        Try{
            if(str4!=null){
                PageReference pageRef = new PageReference('/'+str4);        
                return pageRef;
            }else {           
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'There is no Lead for this comments'));
            }
        }Catch(Exception e){
            Apexpages.addMessages(e);
        }
             return null;
    }

/* Redirecting to Contact detail page if Contact value is there in the comments*/        
    public PageReference Applicant() {    
        Try{
            if(str1!=null){
                PageReference pageRef = new PageReference('/'+str1);        
                return pageRef;
            }else {           
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'There is no Applicant for this comments'));
            }
        }Catch(Exception e){
             Apexpages.addMessages(e);
        }
             return null;
    }
      
/* Redirecting to Opportunity detail page if Opportunity value is there in the comments*/    
    public PageReference Application() {
        Try{
            if(str2!=null){
                PageReference pageRef = new PageReference('/'+str2);        
                return pageRef;
            }else {           
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'There is no Application for this comments'));
            }
        }Catch(Exception e){
             Apexpages.addMessages(e);
        }
             return null;
    }
    
/* Redirecting to Finance detail page if Finance value is there in the comments*/    
    public PageReference Finance() {
        Try{
            if(str3!=null){
                PageReference pageRef = new PageReference('/'+str3);        
                return pageRef;
            }else {           
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'There is no Finance for this comments '));
            }
        }Catch(Exception e){
               Apexpages.addMessages(e);
        }
               return null;
    } 
/* Redirecting to home page after deleting the comments record*/
    public PageReference delete1(){
        Comments__c c=[Select id,name,Written_by__c,lead__c from Comments__c where id=:Apexpages.currentpage().getparameters().get('id')];
        if(c.Written_by__c=='Opportunity'){        
            delete c;                     
            pageReference pageRef=new PageReference('/'+str2);      
            Return pageRef;
        }else if(c.Written_by__c=='Contact'){
            delete c;
            pageReference pageRef=new PageReference('/'+str1);      
            Return pageRef; 
        }else if(c.Written_by__c=='Finance'){
            delete c;
            pageReference pageRef=new PageReference('/'+str3);      
            Return pageRef;
        }else if(c.Written_by__c=='Lead'&&c.Lead__c!=null){
            delete c;
            pageReference pageRef=new PageReference('/'+str4);      
            Return pageRef;
        }
        return null;
        
    }       
}