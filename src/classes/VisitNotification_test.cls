@istest
private class VisitNotification_test{
     static testMethod void test(){
    
     User u1 = [SELECT Id FROM User WHERE Alias='anil'];
     opportunity op=new opportunity();
     op.name='test';
     op.Stagename='Qualification';
     op.closedate=system.today();
     op.Compulsory__c=12.0;
     insert op;
     
     Event e= new event();
     e.subject='test';
     e.whatid=op.id;
     e.type='Call';
     e.StartDateTime=System.Now();
     e.endDateTime=system.Now()+1;     
     insert e;
    }
}