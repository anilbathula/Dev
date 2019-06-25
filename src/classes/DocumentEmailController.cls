public with sharing class DocumentEmailController {
 
  public ID documentId {get;set;}
  public String email {get;set;}
 
  public List<SelectOption> documents {
    get {
      if (documents == null) {
        documents = new List<SelectOption>();
        documents.add(new SelectOption('01590000000RM4O','faceforce - DOC'));  //Hard Coding record ids directly which send as doc//
        documents.add(new SelectOption('01590000000Rbqc','Foot prints -  PDF'));//Hard Coding record ids directly//
      }
      return documents;
    }
    set;
  }
 
  public PageReference sendDoc() {
 
    Document doc = [select id, name, body, contenttype, developername, type 
      from Document where id = :documentId];
 
    Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
    attach.setContentType(doc.contentType);
    attach.setFileName(doc.developerName+'.'+doc.type);
    attach.setInline(false);
    attach.Body = doc.Body;
 
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   // mail.setUseSignature(false);
    mail.setToAddresses(new String[] { email });//Adress to whom we send Email//
    mail.setSubject('Document Email Demo'); //Subject of the mail//
    mail.setHtmlBody('hi anoop is the email you requested: ');  //text message which display in mail//
    mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); //Sending Attachment if u comment u cant send//
 
    // Send the email
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Email with Document sent to '+email));
 
    return null;
 
  }
 
}