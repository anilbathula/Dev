trigger res1 on Opportunity (before insert) {
/*
trigger Amount_USD_Rate on Opportunity_Finance__c (before insert,before update) {


Set<Id> sobjectSetOfIds = new Set<Id>();
list<String> scurrencycode=new list<String>();

    for(Opportunity_Finance__c cs:trigger.New){         
        if(cs.Go_Ed_Loan_Amount__c!=null&&cs.CurrencyIsocode!=null){
            sobjectSetOfIds.add(cs.id); 
            scurrencycode.add(cs.CurrencyIsocode);          
        }       
    }

    List<DatedConversionRate> Dcr=[select IsoCode,ConversionRate From DatedConversionRate where Isocode in:scurrencycode AND StartDate<=THIS_WEEK];
    if(Trigger.isInsert) {  
       if(!sobjectSetOfIds.ISEmpty()&& !Dcr.Isempty()){            
            for(Opportunity_Finance__c c: Trigger.new){ 
                for(integer i=0;i<Dcr.size();i++){
                    if(Dcr[i].IsoCode==c.CurrencyIsocode){
                        c.Go_Ed_Loan_Amount_First_Rate_USD__c=dcr[i].ConversionRate*0.98;  
                    }
                }
            }    
       }
    }
    
    if (Trigger.isUpdate) {   
        if(!sobjectSetOfIds.ISEmpty()&&!Dcr.Isempty()){          
            for(Opportunity_Finance__c c: Trigger.new){  
              for(integer i=0;i<Dcr.size();i++){
                if(trigger.oldMap.get(c.id).Go_Ed_Loan_Amount__c==null&&trigger.newMap.get(c.id).Go_Ed_Loan_Amount__c!=null){
                   c.Go_Ed_Loan_Amount_First_Rate_USD__c=dcr[i].ConversionRate*0.98;
                }   
            }
        }
    }
 }
 


 
}

*/

}