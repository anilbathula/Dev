trigger Updtcon on comments__c (before insert) {
 Set<Id> sobjectSetOfIds = new Set<Id>();
 Set<Id> sobjectSetOfctctIds = new Set<Id>();
 Set<Id> sobjectSetOffinIds = new Set<Id>();
 set<Id> sobjectSetledids=new set<id>();

    Comments__c cms;
    opportunity opp;         
    UserRole ur = [ select Id, Name FROM UserRole where Id =:Userinfo.getUserroleid()];
    
   
    for(Comments__c cs:trigger.New){
        cms=cs;    
        if(cms.Opportunity__c!=null && cms.Contact__c==null && cms.finance__c==null){
            sobjectSetOfIds.add(cms.Opportunity__c);           
        }
        if(cms.Opportunity__c==null && cms.Contact__c!=null && cms.finance__c==null){
            sobjectSetOfctctIds.add(cms.Contact__c);
        }
        if(cms.Opportunity__c==null && cms.Contact__c==null && cms.finance__c!=null){
            sobjectSetOffinIds.add(cms.Finance__c);
        }
        if(cms.Lead__c!=null){
            sobjectSetledids.add(cms.lead__c);
        }
    }
  /* updating contact and finance from opportunity object comments related list*/   
    if(!sobjectSetOfIds.ISEmpty())
    {
        Map<Id,Opportunity>smap= new Map<Id, Opportunity>([Select id,Name,Borrower__c,(Select id,name from Finances__r)  from Opportunity where id in : sobjectSetOfIds ]);//Borrower__r.RecordType.name=:'Applicant' AND Id
                    
        for(Comments__c s: trigger.new){
            if(smap.containsKey(s.Opportunity__c)){                 
                s.Contact__c=smap.get(s.Opportunity__c).Borrower__c;  
                if(smap.get(s.Opportunity__c).finances__r.size()>0){            
                    s.Finance__c=smap.get(s.Opportunity__c).finances__r[0].id; 
                }
                s.Comment_Created_from__c ='Opportunity  ::'+ '  '+smap.get(s.Opportunity__c).Name;
                s.written_by__c='Opportunity';//UserInfo.getName();
                s.Written_date__c=system.Today();
                s.Role__c=ur.name;              
            }
        }
    }
    
    /* updating opportunity and finance from contact object comments related list*/ 
   if(!sobjectSetOfctctIds.ISEmpty()){      
   List<Opportunity> opportunities = [select Id,Borrower__c, Name,Borrower__r.Name,(Select id,name,contact__c from Finances__r )from Opportunity where   Borrower__c in:sobjectSetOfctctIds  ];//Borrower__r.RecordType.name=:'Applicant' AND
   map<string,string> mpcopid=new map<string,string>();
   map<string,string> mpcopname=new map<string,string>();
   map<string,string> mpfinid=new map<string,string>();                     
               for(Opportunity oppn:opportunities){                        
                   mpcopid.put(oppn.Borrower__c,oppn.Id);
                   mpcopname.put(oppn.Borrower__c,oppn.Borrower__r.Name);
                   if(oppn.finances__r.size()>0){mpfinid.put(oppn.Borrower__c,oppn.Finances__r[0].Id);}
                   
                 
                }
                for(Comments__c s: trigger.new){
                    if(mpcopid.containsKey(s.Contact__c))
                    { 
                        s.Opportunity__c=mpcopid.get(s.Contact__c);
                        if(mpfinid.ContainsKey(s.Contact__c)){
                        s.Finance__c=mpfinid.get(s.Contact__c);                        
                        }  
                        s.Comment_Created_from__c ='Contact  ::  '+mpcopname.get(s.Contact__c);
                        s.written_by__c='Contact';//UserInfo.getName();
                        s.Written_date__c=system.Today();
                        s.Role__c=ur.name;
                    } 
                }
    }
            
 
   
   /* updating opportunity and contact from finance */
    if(!sobjectSetOffinIds.ISEmpty()){    
        Map<id,Finance__c> fc =new Map<id, Finance__c>([select id,Name,Opportunity__r.id,Opportunity__r.Borrower__r.id from Finance__c where id in:sobjectSetOffinIds]); 
        for(Comments__c cs:trigger.New){
            if(fc.containsKey(cs.Finance__c)){
                cs.Opportunity__c=fc.get(cs.Finance__c).opportunity__r.id;
                cs.Contact__c=fc.get(cs.Finance__c).Opportunity__r.Borrower__r.id;
                cs.Comment_Created_from__c='Finance::'+''+fc.get(cs.Finance__c).Name;
                cs.written_by__c='Finance';//UserInfo.getName();
                cs.Written_date__c=system.Today();
                cs.Role__c=ur.Name;
               
             }
         }
    }
    
 /*   if(!sobjectSetledids.IsEmpty()){
        Map<id,Lead>ld=new map<id,Lead>([select id,Name,LeadSource from Lead where id in:sobjectSetledids]);
        for(Comments__c com:trigger.new){
            if(ld.ContainsKey(com.lead__c)){
                com.Comments_text__c=ld.get(com.Lead__c).leadsource;
            }
    
        }
        }*/
}