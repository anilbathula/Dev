public class new_lead_ui_event_ctrlr
{   
/*
      Developer : Harsha Simha
      Extension for new_lead_ui_event VF page on contact.  
*/
    public string currleadid{get;set;}
    public Lead currlead_rec{get;set;}
    public boolean editlead{get;set;}
    public string flagurl{get;set;}
    public boolean other_owner{get;set;}    
    public boolean showownerchk{get;set;}    
    public string owner_name{get;set;}
    public string def_owner_name{get;set;}
    public string set_subject{get;set;}
    
     /*interview section variables*/
    public list<schdtbls> lst_interview_schdls{get;set;}
    public list<Event> disp_events{get;set;}
    public Date disp_intrvw_date{get;set;}
    public string set_intrvw_time{get;set;}
    public Date set_intrvw_date{get;set;}
    public string selectedt_intrvw_time{get;set;}
    public set<double> get_exist_intrvw_times{get;set;}
    public map<string,Event> mapevents=new map<string,Event>();
    public Event event_intvw{get;set;}
    public string editeventid{get;set;}
    public boolean showintvw{get;set;}
    public boolean showstatus{get;set;}
    
    /*prof names for adding another owner*/
     public set<string> ownerprofnames=new set<string>();
     
    public new_lead_ui_event_ctrlr(ApexPages.StandardController controller)
    {   
        ownerprofnames.add('1. HULT Telesales');
        ownerprofnames.add('2. HULT Recruiters and Conversion Team');
        ownerprofnames.add('5. HULT Product Head');
        ownerprofnames.add('6. HULT Global and Regional Heads');        
        ownerprofnames.add('9.1 HULT Indirect Agent Manager');
        ownerprofnames.add('9.2 HULT Outsource Call Center TS');
        ownerprofnames.add('9.2.1 HULT Outsource Call Center Manager');         
        ownerprofnames.add('System Administrator');  
        list<Profile> prof=[select id,Name from Profile where id=:Userinfo.getProfileId() and Name IN:ownerprofnames];
        if(!prof.Isempty())
        {                
                showownerchk=true;
        }
    }
    
    public void ownerchngd()
    {
        if(currlead_rec.OwnerId!=null)
        {
                list<user> usr=[select id,Name from user where id=:currlead_rec.OwnerId];
                if(!usr.IsEmpty())
                {
                        owner_name=usr[0].Name;
                        date d=System.today();
                        if(set_intrvw_date!=null){d=set_intrvw_date;}
                        get_exist_intrvw_times=init_interviewscdules(d);
                }
        }
    }
    
    public void uncheckuser()
    {
        init_lead();        
    }
    /*pageload method retrives the lead record and makes lead record interview status 
    field to null if there are no open Events */
    public void init_lead()
    {
        currleadid=Apexpages.currentPage().getparameters().get('id');
        currlead_rec=new Lead();
        if(currleadid!=null){
            showstatus=false;
            currlead_rec=[select id,Name,Owner.Name,OwnerId,Interview_status__c,interview_Date_Booked__c,Interview_Date__c from Lead where id=:currleadid];
            owner_name=currlead_rec.Owner.Name;            
            def_owner_name=currlead_rec.Owner.Name;
            get_exist_intrvw_times=init_interviewscdules(system.today());
            if(currlead_rec.Interview_Status__c=='Booked')
            {
                showstatus=true;
                boolean updlead=true;
                for(event e:[select id, Subject,StartDateTime,EndDateTime,WhoId From Event where WhoId=:currlead_rec.Id and StartDateTime>=:System.Now()])
                {
                    if(e.StartDateTime>=system.Now())
                    {updlead=false;}                    
                }
                if(updlead)
                {
                    currlead_rec.Interview_status__c=null;
                    currlead_rec.interview_Date_Booked__c=null;
                    currlead_rec.Interview_Date__c=null;
                    try{
                        update currlead_rec;
                        init_lead();        
                    }
                    catch(Exception e){system.debug(e);}
                }
            }
       }
    }
    /*returns set of events-time exist for the date passed in parameter and highlights the event table on that time*/
   public set<double> init_interviewscdules(date dt)
    {        
          
        selectedt_intrvw_time='0.3';
         lst_interview_schdls=new list<schdtbls>();
         event_intvw=new Event();
         disp_events=new list<Event>();
         disp_intrvw_date=dt;
         showintvw=true;
        datetime sdt=Datetime.newInstance(dt, Time.newInstance(0, 0, 0, 0));
        datetime edt=Datetime.newInstance(dt, Time.newInstance(23, 59, 59, 0));
        disp_events=[select id, Subject,StartDateTime,Description,EndDateTime,OwnerId ,phone__c,WhoId,Who.Name From Event where OwnerID=:currlead_rec.OwnerId and StartDateTime>=:sdt and EndDateTime<=:edt];
        set<double> x=new set<double>();
        for(Event e:disp_events)
        {
                mapevents.put(e.Id,e);
                system.debug(e.StartDateTime.hour()+'---------'+e.StartDateTime.minute()+'----------'+e.EndDateTime.hour()+'----------'+e.EndDateTime.minute());
            double stime=Double.valueOf(e.StartDateTime.hour()+'.'+e.StartDateTime.minute());
            double etime=Double.valueOf(e.EndDateTime.hour()+'.'+e.EndDateTime.minute());
            system.debug(stime+'======='+etime);
            for(double i=stime;i<etime;i=i+0.30)
            {system.debug('*****'+i);
                decimal l=i-i.intvalue();
                l=l.setScale(1);    
                if(l==.6)
                {
                   i=i+0.40;
                }
                if(i<etime)
                {x.add(i);}
            }
        }
        for(integer i=9;i<=20;i++)
        {
        string tblebgcol='images/img_full.png';

            double d=double.valueof(i);
            string tooltip='Available';
            System.debug(x);
            if(x.contains(d))
            {tooltip='Busy';
                if(x.contains(d+.3))
                {

                        tooltip=i+' - '+(i+1)+' Busy';          
                        tblebgcol='images/img_full.png';                
                }
                else
                {

                    tooltip=i+' - '+i+'.30 Busy \n';
                        tooltip+=i+'.30 - '+(i+1)+' Available.';    
                        tblebgcol='images/img_slft.png';
                }
            }
            else
            {
                if(x.contains(d+.3))
                {

                    tooltip=i+' - '+i+'.30 Available \n';
                        tooltip+=i+'.30 - '+(i+1)+' Busy.';
                        tblebgcol='images/img_srt.png';
                }               
                else
                {

                    tooltip=i+' - '+(i+1)+' Available';   
                    tblebgcol='images/img_blnk.png';
                }
            }
            lst_interview_schdls.add(new schdtbls(''+i,tblebgcol,tooltip));
        }
        /*
        for(event e:[select id, Subject,StartDateTime,EndDateTime,WhoId From Event where WhoId=:currlead_rec.Id and StartDateTime>=:System.Now()])
        {
            if(e.StartDateTime>system.Now())
            {showstatus=true;}
        }*/
        
        return x;
    }
    
    /*inner class for interview schedules*/    
    public class schdtbls
    {
         public string bgcol{get;set;}
         public string value{get;set;}
         public string tooltip{get;set;}
         public string tbleid{get;set;}         
         public schdtbls(String num,string bgcolurl,string tooltip)
         {
             this.bgcol=bgcolurl;
             this.value=num;
             this.tbleid='tb'+num;
             this.tooltip=tooltip;
            // this.apexval=val;
         }
    }
    /*on interview date change in Date field calls init_interviewscdules method*/
    public void intrvw_datechange()
    {
       if(set_intrvw_date!=null){
        get_exist_intrvw_times=init_interviewscdules(set_intrvw_date);}
    }
    
    /*to delete selected event*/
    public void del_intervw()
    {event_intvw=new Event();
        if(editeventid!=null && editeventid.trim()!='' && mapevents.containsKey(editeventid))
        {               
                event_intvw=mapevents.get(editeventid);
                try{
                    Delete event_intvw;
                     if(set_intrvw_date!=null){
                        get_exist_intrvw_times=init_interviewscdules(set_intrvw_date);
                     }else{get_exist_intrvw_times=init_interviewscdules(System.today());}
                    
                }
                catch(Exception e){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'Error : '+e));
                }
        }
    }
/*   schedules event on selected Date Time if there is no open event for the Lead record 
    and if the selected time is less than current date time */    
    public Pagereference schedule_intrvw()
    {
        if(set_intrvw_date==null)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'Please select a date...'));    //disp error
        }
        else
        {
            list<Event> et=[select id,whoid,Subject,StartDateTime from Event where whoid=:currlead_rec.Id and StartDateTime>=:System.now()];
            if(!et.IsEmpty())
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'There is already an interview scheduled on '+et[0].StartDateTime.Month()+'/'+et[0].StartDateTime.Day()+'/'+et[0].StartDateTime.year()+' '+et[0].StartDateTime.hour()+':'+et[0].StartDateTime.Minute()));    //disp error
                return null;
            } 
                if(set_intrvw_date<System.today())
                {
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'The date you have selected is in the past!'));    //disp error
                        return null;
                }
                if(set_intrvw_date==System.today())
                {
                        double temp0=double.valueOf(set_intrvw_time);                   
                        double temp01=system.now().hour()+(0.01*System.now().minute());
                        if(temp0<temp01)
                        {
                                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'Time already crossed!'));    //disp error
                                return null;
                        }
                }
                Decimal etime=0;
                Decimal stime=double.valueOf(set_intrvw_time);
                stime=stime.setScale(1);
                etime=etime.setscale(1);
                boolean createschedule=false;
                
                //check if time slot is already scheduled or not
                if(selectedt_intrvw_time=='0.3')
                {
                        if(!get_exist_intrvw_times.contains(double.valueof(stime)))
                        {
                                createschedule=true;
                                if(stime-stime.intValue()==0.3 )
                                {
                                        etime=stime.intvalue()+1;                               
                                }       
                                else
                                {
                                        etime=stime.intvalue()+0.3;
                                }
                        }               
                }
                else
                {
                        if(!get_exist_intrvw_times.contains(double.valueof(stime)))
                        {                                               
                                if(stime-stime.intValue()==0.3 )
                                {                               
                                        if(!get_exist_intrvw_times.contains(stime.intvalue()+1))
                                        {
                                                etime=stime+1;
                                                createschedule=true;
                                        }                                       
                                }
                                else
                                {
                                        if(!get_exist_intrvw_times.contains(stime.intvalue()+1))
                                        {
                                                etime=stime+1;
                                                createschedule=true;
                                        }
                                }
                        }               
                }
                system.debug(etime);
                //if time slot is not scheduled then create event else display error
                if(createschedule)
                {
                        Event eobj=new Event();
                         eobj.StartDateTime= Datetime.newInstance(set_intrvw_date,Time.newInstance(stime.intValue(), stime-stime.intValue()==0.3?30:0, 0, 0));
                     eobj.EndDateTime=Datetime.newInstance(set_intrvw_date,Time.newInstance(etime.intValue(), etime-etime.intValue()==0.3?30:0, 0, 0));
                     eobj.WhoId=currleadid;
                     eobj.OwnerId=currlead_rec.OwnerId;
                     eobj.subject=set_subject;
                     try{
                        insert eobj;
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info ,'An interview has been scheduled!'));
                        date d=set_intrvw_date;
                        get_exist_intrvw_times=init_interviewscdules(set_intrvw_date);
                       
                        get_exist_intrvw_times=init_interviewscdules(d);
                     }
                     catch(Exception e)
                     {                          
                        system.debug(e);
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error ,''+e));
                     }
                }
                else
                {
                     ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'There is a slot already scheduled with in the selected time!'));   //disp msg
                }
        }/*
        PageReference acctPage = new PageReference('/'+currlead_rec.Id+'?inline=0');
        acctPage.setRedirect(true);
        return acctPage;
        */
        return null;
    }
 /*Time slot picklist values between 9am and 8pm*/   
    public List<SelectOption> getstimeslot() {
         List<selectOption> options=new List<selectOption>();
         for(integer i=9;i<=20;i++)
         {
                options.add(new selectOption(i+'.0',i+':00'));
                if(i!=20){
                options.add(new selectOption(i+'.30',i+':30'));
                }
         }
         return options;
     }
     
     /*Subject picklist values*/
    public List<SelectOption> getsubvals() {
         List<selectOption> options=new List<selectOption>();
         options.add(new selectOption('Phone Interview','Phone Interview'));
         options.add(new selectOption('Admissions Interview','Admissions Interview'));         
         options.add(new selectOption('In Person Interview','In Person Interview'));
         options.add(new selectOption('Follow Up Call','Follow Up Call'));
         return options;
     }
     
 /*selected Time slot picklist values */     
     public List<SelectOption> getselectedtimeslot() {
         List<selectOption> options=new List<selectOption>();         
         options.add(new selectOption('0.3','Half an hour'));
         options.add(new selectOption('1','One hour'));         
         return options;
     }   
     /* detail view of selected event*/    
     public void viewintrvw()
     {event_intvw=new Event();
        if(editeventid!=null && editeventid.trim()!='' && mapevents.containsKey(editeventid))
        {               
                event_intvw=mapevents.get(editeventid);
                showintvw=false;
        }
     }
     /*donothing*/
     public void donothing()
     {
         showintvw=true;
     }
     
     
}