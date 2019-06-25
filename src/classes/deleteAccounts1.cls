global class deleteAccounts1 implements Database.Batchable<Sobject>
{
global final String Query;
global deleteAccounts1(String q)
{
Query=q;
 
}

global Database.QueryLocator start(Database.BatchableContext BC)
{
return Database.getQueryLocator(query);
}

global void execute(Database.BatchableContext BC, List<SObject> scope)
{
List<Account> lstAccount = new list<Account>();
for (SObject s : scope) //for all objects from our query

{
Account a = (Account)s;
lstAccount.add(a);
}
Delete lstAccount;
}

global void finish(Database.BatchableContext BC)
{
//Send an email to the User after your batch completes
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String[] toAddresses = new String[] {'franktoanil@gmail.com'};
mail.setToAddresses(toAddresses);
mail.setSubject('Apex Batch Job is done');
mail.setPlainTextBody('The batch Apex job processed ');
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}