global without sharing class insertOppfromflow {

  @InvocableMethod(label='Insert Opportunity from flow')
  global static void oppInsertBatch(List<insertOpp> requests) {
    for(insertOpp request: requests){
      insertBatch(request);
    }
  }

  public static void insertBatch(insertOpp request) {
      opportunity opp=new opportunity();
      opp.name=request.name;
      opp.StageName=request.stagename;
      opp.Compulsory__c=request.compulsory;
      opp.CloseDate=system.today();
      insert opp;
    
  }

  global class insertOpp {

    @InvocableVariable(label='Opportunity Name' required=true)
    global string name;
    @InvocableVariable(label='Compulsory' required=true)
    global Decimal compulsory;
    @InvocableVariable(label='Close date' required=true)
    global date closeDate;
    @InvocableVariable(label='Stage' required=true)
    global string stageName;
  }


}