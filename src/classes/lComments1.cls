Public Class lComments1{
    public lead l {get;set;}
    public list<Comments__c> listCom{get; set;}  
    public Comments__c com{get;set;}   
    public Boolean property {get; set;}
    public Boolean showblock{get;set;}
    public Boolean hidebutton{get;set;} 
    public String SelId { get; set; }   
    public String delid{get;set;} 
    id str{get;set;}      
    public map<id,comments__c> mpid{get;set;}  
    

    public LComments1(ApexPages.StandardController controller) {   
        l=(Lead)controller.getRecord();
        str=Apexpages.currentpage().getparameters().get('id');  
        property=false;       
        hidebutton=true; 
        com=new Comments__c();  
        mpid= new map<id,comments__c>(); 
        loaddata();         
         
           
    }
    public void loaddata(){
        if(str==null){
         ApexPages.addMessage(new ApexPages.message(ApexPages.severity.Error,'There is no lead Record'));
        }
        else{
           listCom=[select id,name,lead__c
                              ,Contact__c
                              ,Opportunity__c
                              ,Finance__c
                              ,Comments_text__c
                              ,lead__r.Name                       
                              ,Role__c 
                              ,CreatedDate 
                               from comments__c 
                               where lead__c=:str order by CreatedDate desc limit 1000];
                                
                              
          for(comments__c c:listCom){                          
               mpid.put(c.id,c);                                   
          }
      }                                           
    }
    
    public PageReference custSave(){
    com.Lead__c=str;
     property=true;
      upsert com;        
             
    PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
    pageRef.setRedirect(true);
    return pageRef;
    }
    
    public Comments__c custNew(){    
        property=true;
        hidebutton=false;       
        return null;     
    }
    
    Public void custEdit(){          
        Property=true;
        hidebutton=false;     
        if(mpid.containsKey(SelId)){            
           com=mpid.get(SelId);       
        }        
    }       

   public Comments__c custDel(){
       listCom=[select id from comments__c where id=:delid];
       if(listcom.size()>0){
           delete listCom;
       }
       loaddata();
       return null;
   } 
 
}