trigger TaskCanbeCreatedforSoldtoOnly  on Task (before insert, before update) {

set<id>accids=new set<id>();

for(task t:trigger.new){
    accids.add(t.whatid);
}
if(!accids.isempty()){
    List<Account>lstacc=[select id,Ownership from account where id in:accids AND Ownership=:'Public'];
    Map<id,String>mapofaccts=new Map<id,string>();
    for(account acc:lstacc){
        mapofaccts.put(acc.id,acc.ownership);
    }
    for(task t:trigger.new){
        if(mapofaccts.containsKey(t.whatid)){
            t.addError ('Please select the Sold to Customer');
        }
    }
}

}