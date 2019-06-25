public class formatedphone{

   public  string formatedphone(String phonenumber,String code){
        //phonenumber='+58(0)-9146456565';
       // System.debug('------->'+phonenumber);
        String formatedph='';
        String specialChars = '&|^|@() *_';  
        for(integer i=0; i<specialChars.split('|').size(); i++)
        phonenumber= phonenumber.replace(specialChars.split('|')[i], '');
        System.debug('Special-chars free string is --------> ' + phonenumber);
        formatedph=code+phonenumber;
        System.debug('anil:::'+formatedph);
        return formatedph;
    }
  
}