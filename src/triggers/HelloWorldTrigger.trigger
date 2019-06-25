trigger HelloWorldTrigger on  lead__c  (before insert) {

    lead__c [] lead = Trigger.new;

   MyHelloWorld.applyDiscount(lead);
}