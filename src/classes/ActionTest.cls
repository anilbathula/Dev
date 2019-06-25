public class ActionTest {
  
  @InvocableMethod(label='Action Test' description='Given a list of Account IDs, return a list of Account names.')

  public static List<String> getAccountNames(List<ID> ids) {

     List<String> accountNames = new List<String>();
     Account a = new Account();

     for (ID id : ids) {
         a = [SELECT id,Name,type FROM Account WHERE Id = :id];
         accountNames.add(a.Name +','+a.id);
         
     }

    return accountNames;
  }
}