Public class cont{

 
    // ApexPages.StandardSetController must be instantiated 
    
    // for standard list controllers 
    public string accid{get;set;}
    public string Country{get;set;}
    public Account ac{get;set;}
    public contact c{get;set;}
    public Integer i{get;set;}
    
    public cont(ApexPages.StandardsetController stdController) {
        accid=Apexpages.currentpage().getparameters().get('id');
        system.debug(accid);
        ac=[select id,name,phone,BillingCity,BillingCountry,BillingState,BillingStreet from Account
                Where id=:accid];
               i=[select count() from Contact];
      
    }
    public PageReference save() {       
        PageReference pageRef = new PageReference('/003/e?retURL=%2F003%2Fo&con4='+ac.Name+'&con10='+ac.phone+'&con19street='+ac.BillingStreet+'&con19city='+ac.BillingCity+'&con19state='+ac.BillingState+'&con19country='+ac.BillingCountry+'&retURL=/{!Account.Id}');
        pageRef.setredirect(true);
        return pageref;       
    }
    
    // Initialize setCon and return a list of records     
   /* public List<Account> getOpportunities() {
        return null;//(List<Account>) setCon.getRecords();
    }*/
}