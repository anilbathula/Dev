global class dailyCron implements Schedulable {
    public static String CRON_EXP = '0 0 15 * * ? *'; // 8am Every Day

    global static String scheduleIt() {
        dailyCron cron = new dailyCron();
        return System.schedule('Daily Cron', CRON_EXP, cron);
    }


    global void execute(SchedulableContext sc) {

        //Send CRB Emails
        Contact [] cons = [SELECT Id FROM Contact WHERE Next_Birthday__c = Today];

        for(Contact con : cons){
            con.Formated_lead__c = true;  
        }

        update cons;

    }
}