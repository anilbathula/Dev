/*
This class is written to search the records and display 
them based on the object which yoy provide in the text box.
vf page name: searchobj
*/

public class searchobj{

 public  string s{get;set;}
 Public boolean refreshPage{get;set;}
 public list<MySobject>Records{get;set;}
 
  public List<MySObject> Records (){        
            if ((Records == null)) {
                Records = new List<MySObject>();
                String SOQL;
                // SOQL...
                if(S==Null||s==''){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning,'please enter a object name in the text box after clicking refresh button'));
                }else{                                
                    SOQL = 'SELECT id,name,Phone FROM ' + S +' Limit 100';                
                    system.debug('::->'+soql);
                    for (List<SObject> sobjs : Database.query(SOQL)) {
                        for (SObject sobj : sobjs) {
                            records.add(new MySObject(sobj));
                        }
                    }
               }
            }
            return Records;
    }
    
    public PageReference processSelected(){
       List<Sobject>ss=New list<Sobject>();
           for(MySobject sb:Records()){
               if(sb.id!=null)
               ss.add(sb.sobj);
           }
           return null;   
    }
    
    public class MySobject{
        public String id{get;set;}
        public String Name{get;set;}
        public String Phone{get;set;}
        public Sobject sobj{get;set;}
                
        public Mysobject(sobject sob){
            sobj=sob;
            id=String.valueof(Sobj.get('id'));
            Name=String.Valueof(sobj.get('Name'));
            phone=String.Valueof(sobj.get('Phone'));            
            System.debug('----->'+sobj);
            system.debug('Name--->'+name); 
        }
    }
    
    public PageReference Refresh(){ 
      refreshPage=true;
      S=NULL;
      return null;
    }
  
}