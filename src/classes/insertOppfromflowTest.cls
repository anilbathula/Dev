@isTest
private class insertOppfromflowTest {

    private static testMethod void doTest() {

        contact c=new contact();
        c.lastname='jkdshfjkdk';
        insert c;
        list<insertOppfromflow.insertOpp>lstopps=new list<insertOppfromflow.insertOpp>();
        insertOppfromflow.insertOpp opps =new insertOppfromflow.insertOpp();
        opps.name='dfdgtestsfds';
        opps.closeDate=system.today();
        opps.compulsory=23.0;
        opps.stageName='Closed Won';
        lstopps.add(opps);
        
        insertOppfromflow.oppInsertBatch(lstopps);
       
       

    }
}