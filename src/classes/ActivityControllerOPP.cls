public class ActivityControllerOPP {
    public Opportunity opp{get;set;}
    public id str{get;set;}    
    Public List<ActivityHistory> acthist{get;set;}
    Public ActivityHistory ac{get;set;}
     public String SelId { get; set; }
     public map<id,ActivityHistory> mpid{get;set;}  
    
    
    public ActivityControllerOPP(ApexPages.StandardController controller) {
        this.opp = (Opportunity)controller.getRecord();
        str=Apexpages.currentpage().getparameters().get('id');
        acthist=new List<ActivityHistory>();   
          mpid= new map<id,ActivityHistory>();  
            
        
       opp=[Select c.Name, c.Id, (Select Id, IsTask,LastModifiedDate, ActivityDate,owner.Name,Who.Name, ActivityType, CallType From ActivityHistories) From Opportunity c where id=:str limit 100 ];
            for(ActivityHistory a:opp.ActivityHistories){               
                acthist.add(a);
            }
    }
      Public pagereference pagerd(){ 
        Pagereference newpage = new Pagereference ('https://ap1.salesforce.com/{!a.id}/e?retURL=%2F{opp.id}');
        return newpage;
           
        }        
        
            

}