@isTest
private class UpdateChildCases_Test {
 
  static testMethod void Test(){
            
    Case curCase = new Case(Status = 'New');
    insert curCase;
    
    Case curCase2 = new Case(Status='New',ParentId=curCase.Id);
    insert curCase2;
    
    curcase.status='closed';
    update curcase;

       //Test.StartTest(); 
 
    //Test.StopTest();
  }
}