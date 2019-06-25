trigger WorkflowEmailFromOwner on Task (after insert) { 
     //Check to see if there is only one task being entered 
     //Check to see if Task Subject Starts with "WF-" 
      if ((trigger.new.size() == 1) && 
(trigger.new[0].Subject=='Test')){ 
        Contact con = [select id, c.Owner.Email, c.Owner.FirstName, 
c.Owner.LastName  from Contact c where id = :trigger.new[0].whoid]; 
        //Email Template Name must be EXACTLY the same as the task 
//being created 
        try{ 
        EmailTemplate etemp = [select id from EmailTemplate where 
Name=:'Sales: New Customer Email' and isactive=TRUE ]; 
        messaging.Singleemailmessage mail=new 
messaging.Singleemailmessage(); 
      //Save the Email in Activity History 
      //mail.setSaveAsActivity(true); 
      //Change the Sender Display name to the Contact Owner; 
        mail.setSenderDisplayName(con.Owner.firstname +' '+ 
con.Owner.lastname); 
        //Change the Reply-To address to the contact owner 
        //NOTE: the sending address will continue to be the default 
//workflow user 
        mail.setReplyTo(con.Owner.email); 
        mail.setTargetObjectId(con.Ownerid); 
        mail.saveAsActivity = false;
        mail.setTemplateId(etemp.id); 
        try{ 
   messaging.sendEmail(new messaging.Singleemailmessage[]{mail}); 
}catch(DMLException e){ 
       system.debug('ERROR SENDING FIRST EMAIL:'+e.getDMLMessage(0)); 
  } 


        }catch(Exception Ex){ 

          trigger.new[0].addError('Errors occured: '+Ex); 

          system.debug(Ex); 
        } 


      } 
}

///https://groups.google.com/forum/?fromgroups=#!topic/npsf/VjrRWSHNExY