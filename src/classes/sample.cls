public class sample{
    public list<test__mdt>getList{get;set;}
    public sample(){
     getList=[select id,mail__c from test__mdt where MasterLabel='anil'];
    }
}