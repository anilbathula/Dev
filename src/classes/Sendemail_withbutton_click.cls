public class Sendemail_withbutton_click
{
private final Contact con;
public Sendemail_withbutton_click(ApexPages.StandardController controller)
{
this.con=(Contact)controller.getRecord();
}

public void SendEmail()
{
contact con=[select id,name from contact where id=:con.id];
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setTargetObjectId(con.Id);
//mail.setTemplateId('00X90000000WTxX');
mail.setsubject('send email from button click');
mail.setPlainTextBody('test mail from apex button click'+con.id);
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}