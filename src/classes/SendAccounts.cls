/***************
API Integration with Salesforce
This class will be called from thetrigger and class will send data other salesforce org(Franktoanil@gmail.com) 
****************/


public class SendAccounts{
    public static boolean isApexTest = false;
    public static boolean caseIsClosed = true;
 @future(callout=true)
     public static void caseToVictor(String name,String description,String Type){
         
 HttpRequest req = new HttpRequest();
 Http http = new Http();
         
 req.setEndpoint('https://frank-dev-ed.my.salesforce.com/services/apexrest/Insrt_Account');
 req.setMethod('POST');
 Map<String, String> data = new Map<String, String>();
 data.put('Name', name);
 data.put('Desctiption', description);
 data.put('Type', Type);    
    
 String body = JSON.serialize(data);
 System.debug(body);
 req.setBody(body);
 req.setHeader('Content-Type','application/json');
 String Username='anilbathula@yahoo.co.in';
 String password='1441984anil';
 Blob headerValue = Blob.valueOf(username+':'+password);
 String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
 req.setHeader('Authorization',authorizationHeader );

 // Create a new http object to send the request object 

 // A response object is generated as a result of the request   

          
         
         
 HTTPResponse res = http.send(req);
 System.debug('===>'+res.getBody());
  //}
     }

}