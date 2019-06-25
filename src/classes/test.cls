public class test{
    public Integer i{get;set;}
    
    
    public test(ApexPages.StandardController controller) {
        i=[select count() from account];
    }
}