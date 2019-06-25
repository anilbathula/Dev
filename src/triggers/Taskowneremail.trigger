trigger Taskowneremail on Task (after insert) { 
     
      if ((trigger.new.size() == 1) &&trigger.new[0].whatid!=Null&&((trigger.new[0].Subject=='Test')||(trigger.new[0].Subject=='Test'))){ 
        OPportunity opp = [select id,Name,StageName,owner.Name,Borrower__r.Email  from Opportunity  where id = :trigger.new[0].whatid];
        System.debug(''+opp); 
       
        try{ 
       // EmailTemplate etemp = [select id from EmailTemplate where Name=:trigger.new[0].Subject and isactive=TRUE ]; 
        messaging.Singleemailmessage mail=new messaging.Singleemailmessage(); 
       
        String Subject=opp.Name+''+opp.StageName;
        String emailBody = 'Dear ' + OPP.Name + ',\n\n' +
                        'Please find enclosed our proposal for your kind perusal.' + '\n' +
                        'Do let us know if you require any further information or assistance in this context,' + '\n' +
                        'we would be more than happy to be at your service' + '\n\n\n' +
                        'Yours truly, \n'+trigger.new[0].Subject;     
        
        
     
        mail.setSenderDisplayName('Anil');     
        mail.setSubject(subject);
        mail.setPlainTextBody(emailBody);   
        mail.setTargetObjectId(opp.Ownerid); 
        mail.saveAsActivity = false;
       // mail.setTemplateId(etemp.id); 
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