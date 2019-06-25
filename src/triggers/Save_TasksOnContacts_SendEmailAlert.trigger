trigger Save_TasksOnContacts_SendEmailAlert on Contact(after insert,after update){
 
 List<Task> Objtsk =  new List<Task> ();
 List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
 for(Contact con: Trigger.new){
    
    
    Task tsk = new Task(Subject='Email',Priority='High',Status='Not Started',whoid=con.id);
    Objtsk.add(tsk);
   
    if (con.Email != null && con.FirstName != null) {
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage ();
      List<String> sendTo = new List<String>();
      sendTo.add(con.Email);
      mail.setToAddresses(sendTo);
      mail.setReplyTo('rajashreeprusty@gmail.com');
      mail.setSenderDisplayName('Anil ');
      List<String> ccTo = new List<String>();
      ccTo.add('franktoanil@gmail.com');
      ccTo.add('rajashreeprusty@gmail.com');
      mail.setCcAddresses(ccTo);
      mail.setSubject('PLease check task gets created this mail is from Anils dev instance');
      String body = 'Dear ' + con.FirstName + ', ';
      body += 'Works fine';
      mail.setHtmlBody(body);
      mails.add(mail);
     
    }
 }
  insert(Objtsk);
  Messaging.sendEmail(mails);
  System.debug('===>'+mails);
 
 }