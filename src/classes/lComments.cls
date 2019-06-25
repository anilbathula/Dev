Public Class lComments{
    public lead l {get;set;}
    public list<Comments__c> listCom{get; set;}  
    public Comments__c com{get;set;}   
    public Boolean property {get; set;}
    public Boolean showblock{get;set;}
    public Boolean hidebutton{get;set;} 
    public String SelId { get; set; }   
    public String delid{get;set;} 
    public id str{get;set;} 
    public id str1{get;set;} 
    public id str2{get;set;}      
    public map<id,comments__c> mpid{get;set;}  
    public list<leadHistory> listHistory{get;set;}
    Public Boolean hideblock{get;set;}
    

    public LComments(ApexPages.StandardController controller) {   
        l=(Lead)controller.getRecord();
               
system.debug('====>'+str);
        property=false;       
        hidebutton=true; 
        com=new Comments__c();  
        listHistory=[select Leadid,createdDate,Field,oldvalue,NewValue from LeadHistory Where CreatedDate>=:System.today() AND LeadID=:str];
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
                              ,Owner.Name
                              ,LastModifiedDate
                              ,Comment_Created_from__c                                                                                      
                               from comments__c 
                               where lead__c=:str order by CreatedDate desc limit 1000];                        
                              
          for(comments__c c:listCom){                          
               mpid.put(c.id,c);                                   
          }
      }                                           
    }
    
       public Void custSave(){    
        com.lead__c=str;    
        System.debug('ASD'+com.lead__c);
        property=False; 
        hidebutton=true; 
        if(Com.Comments_text__c!=null){   
          upsert com;  
        }          
        loaddata(); 
           
    }
    
    public Void custNew(){    
        com=new comments__c();
        property=true;
        hideblock=false;
        hidebutton=false;       
       // return null;     
    }
    
    Public void custEdit(){          
        Property=true;
        hideblock=true;
        hidebutton=false;     
        if(mpid.containsKey(SelId)){            
           com=mpid.get(SelId);       
        }        
    }       

   public Void custDel(){
       listCom=[select id from comments__c where id=:delid];
       if(listcom.size()>0){
           delete listCom;
       }
       loaddata();      
   }    
   Public pageReference CustCancel(){   
       pagereference pr=new pageReference('/apex/leads?id='+str+'');
       pr.setRedirect(true);
       return pr;
   
   }

    
  }