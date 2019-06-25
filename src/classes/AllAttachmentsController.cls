public class AllAttachmentsController{
  public List<Attachment> ATT {get;set;}
  public AllAttachmentsController (ApexPages.StandardController stdController) { }
    public List<String> getAttLinks() {
    Id caseid = ApexPages.currentPage().getParameters().get('Id');
    List<String> attLinks = new List<String>();
    String strURL;
    String strResult ;
    ATT=[SELECT Id, Name FROM Attachment WHERE parentId = :ApexPages.currentPage().getParameters().get('Id')];
    integer j = ATT.size();
    for(integer i=0; i<j; i++) {
        strURL= 'https://' + ApexPages.currentPage().getHeaders().get('Host')+ '/servlet/servlet.FileDownload?file='  + ATT[i].Id;
        attLinks.add(strURL);
    }
        return attLinks ;
    }
 }