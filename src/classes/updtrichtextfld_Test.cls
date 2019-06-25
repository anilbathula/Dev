@isTest
private class updtrichtextfld_Test {
    static testMethod void updtrt(){
         Duplicate_Leads__c d=new Duplicate_Leads__c();
         d.name='test';
         d.What_the_program__c='test234';
         insert d;
    }
}