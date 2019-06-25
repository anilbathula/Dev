public class Callingnumber {

   public String mob{get; set;}
   public Contact con{get; set;} 
   
   public Callingnumber() {
       //mob= ApexPages.currentPage().getParameters().get('id');
       //System.debug('Anoop:'+mob);
    con = [SELECT Id, Name FROM Contact
                  WHERE MobilePhone =:ApexPages.currentPage().getParameters().get('id')];
   
   System.debug('Anoop1:'+con);
   
   }
}