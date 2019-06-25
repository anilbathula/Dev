public with sharing class TaskDisplay {

  private ApexPages.StandardController controller {get; set;}
  public List<Task> searchResults {get;set;}  
  public string searchText {get;set;}
  public string e='Completed';

  
  
 
  // standard controller - could also just use custom controller
  public TaskDisplay(ApexPages.StandardController controller) { }
 
  // fired when the search button is clicked
  public PageReference search() {
  
    String qry = 'select id, Subject,Owner.name,CallType,Status  from Task ' +
      'where Phone__c LIKE \'%'+searchText+'%\' order by Status';
      System.debug('---->'+qry);
    searchResults = Database.query(qry);
    return null;
  }
 
  // fired when the save records button is clicked
  public PageReference save() {
 
    try {
      update searchResults;
    } Catch (DMLException e) {
      ApexPages.addMessages(e);
      return null;
    }
 
    return new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
  }
 
  // takes user back to main record
  public PageReference cancel() {
    return new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
  }
 
}