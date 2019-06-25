public without sharing class UserController {

	public String userManagerId {get;set;}
    Public user usr{get;set;}

	public UserController(){
        userManagerId = ApexPages.currentPage().getParameters().get('uid');
        usr = [select Id, firstName,lastName from User where Id =: userManagerId LIMIT 1];
    }
	
}