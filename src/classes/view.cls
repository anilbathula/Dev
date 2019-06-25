public class view {
    public view(ApexPages.StandardController controller) {
    }


    public Lead applicant;
    public List<Lead> applicantByStatusList {get;set;}
    private ApexPages.StandardSetController controller;
   
    public List<String> applicantNameByStatus{
        get;
        set;
        
        }
    
    
    
    
     
    public view(ApexPages.StandardSetController controller) {
        this.applicant=(Lead)controller.getRecord();
         list<Comments__c>c=[Select id,Name,Role__c from Comments__c where Lead__c=:Apexpages.currentPage().getParameters().get('id')];
        //this.controller = controller;
    }
    

    
     public PageReference getApplicantByStatus(){
     
    String para1=Apexpages.currentPage().getParameters().get('id');
        
        
        list<Comments__c>c=[Select id,Name,Role__c from Comments__c where Lead__c=:Apexpages.currentPage().getParameters().get('id')];
         
        
         for(Lead a:applicantByStatusList){
            String name=(String)a.Name;
            
              applicantNameByStatus.add(name);
               
            }
          
         
         return null;
    }
}