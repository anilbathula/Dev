public class staticFlag {

public static boolean a = true;
   private static set<string> dupchecker = new set<string>();
    public static boolean has_dupexist(string recid) 
    {
        if(dupchecker.contains(recid)) {
            return true;
        }
        else {
            dupchecker.add(recid);
        } 
        return false;    
    }

}