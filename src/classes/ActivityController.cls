public class ActivityController {
    public Contact cont{get;set;}
    public id str{get;set;}    
    Public List<ActivityHistory> acthist{get;set;}
    
    
    public ActivityController(ApexPages.StandardController controller) {
        this.cont = (Contact)controller.getRecord();
        str=Apexpages.currentpage().getparameters().get('id');
        acthist=new List<ActivityHistory>();    
            
        
       cont=[Select c.Name, c.Id, (Select Id, IsTask,LastModifiedDate, ActivityDate,owner.Name,What.Name, ActivityType, CallType From ActivityHistories) From Contact c where id=:str limit 100 ];
            for(ActivityHistory a:cont.ActivityHistories){               
                acthist.add(a);
            }
    }
       

}