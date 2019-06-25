@isTest
private class TestSearchController{
    @isTest
    private static void testClass(){
        ApexPages.currentPage().getParameters().put('q','ab');
        ACSearchController controller = new ACSearchController();
    }
}