public class MyHelloWorld {
public static void applyDiscount(lead__c[] lead) {
   for (lead__c l :lead){
      l.List_Number__c*= 10.2;
   }
}

}