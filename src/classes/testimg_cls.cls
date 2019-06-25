public class testimg_cls
{
public string query{get;set;}
public Account acc{get;set;}
public testimg_cls()
{
 
 Map<string,Schema.SObjectField> mpConField=Account.getSObjectType().getDescribe().fields.getMap();
        Set<string> originalvalues = new Set<String>();
        originalvalues = mpConField.keySet();
        query='select ';
        for(string f : originalvalues)
        {
            Schema.DescribeFieldResult fldResult=mpConField.get(f).getDescribe();
           if(query=='select ')
           {
           query=query+string.valueof(fldResult.getName());
           }
           else
           {
           query=query+','+string.valueof(fldResult.getName());
           }
          
        }
         query=query+' from Account limit 1';
         acc=Database.query(query);
  }
}