public class testemail
{
private final Contact con;
public testemail(ApexPages.StandardController controller)
{
this.con=(Contact)controller.getRecord();
}

public void SendEmail()
{
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setTargetObjectId(con.Id);
mail.setTemplateId('00X90000000uX8c');
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}