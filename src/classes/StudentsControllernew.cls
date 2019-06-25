public class StudentsControllernew {

public String message{get;set;}
public list<account> acclist {get;set;}

public StudentsControllernew(ApexPages.StandardController controller){
pageSize = '5';
acclist = [SELECT Id, name, website, phone FROM Account limit 50000];
updateStandardSetController();
}

//Page record size variable
public string pageSize {get;set;}

//Standard Set Controller variable for taking all students records (Standard Set controllers methods will be used for working with the collection of records – like pagination)
public ApexPages.Standardsetcontroller acctSSC {get;set;}

//Constructor will set the default page size of records and also call the method to fetch records

//Method to fetch records and display only page size records
public void updateStandardSetController(){
// acclist = [SELECT Id, name, website, phone FROM Account limit 50000];
acctSSC = new ApexPages.Standardsetcontroller(Database.getQuerylocator([SELECT Id, name, website, phone FROM Account]));
acctSSC.setPageSize(integer.valueOf(pageSize));
//update acclist;
// return null;
}

//Method to get all records on to the page
// public List<Account> getAccounts(){
// return acclist;
// }

//Method to set the number of records on the page to be displayed as per user option
public List<SelectOption> getPageSizes(){
List<SelectOption> options = new List<SelectOption>();
options.add(new SelectOption('5','5'));
options.add(new SelectOption('10','10'));
options.add(new SelectOption('20','20'));
options.add(new SelectOption('50','50'));
options.add(new SelectOption('100','100'));
return options;
}

//Returns true/false based on records present or not
public Boolean hasNext{
get{
return acctSSC.getHasNext();
}
set;
}

//Returns true/false based on records present or not
public Boolean hasPrevious{
get{
return acctSSC.getHasPrevious();
}
set;
}

//Returns previous page of records if present
public void previous(){
acctSSC.previous();
}

//Returns next page of records if presen
public void next(){
acctSSC.next();
}
public pagereference saveAccounts(){
try{
update acclist;
PageReference nextpage= new PageReference('/apex/accounteditingfinal');
nextpage.setredirect(true);
return nextpage;
}
catch(Exception e){
message='Data Base error during saving…';
ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.ERROR, message));
return null;
}
}

}