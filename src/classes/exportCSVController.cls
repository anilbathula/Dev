public class exportCSVController {

    public List<List<myClass>> myList {get;set;}
    
    public exportCSVController() {
        myList = new List<List<myClass>>();
        List<myClass> temp = new List<myClass>();
        
        for(Integer i = 0; i < 2500; i++){
            if(temp.size() < 1000){
                myClass m = new myClass();
                m.val1 = 'val1 ' + i;
                m.val2 = 'val2 ' + i;
                temp.add(m);
            }
            else{
                myList.add(temp);
                temp = new List<myClass>();
                myClass m = new myClass();
                m.val1 = 'val1 ' + i;
                m.val2 = 'val2 ' + i;
                temp.add(m);
            }
        }
        myList.add(temp);
    }
    

    public class myClass{
        public string val1 {get;set;}
        public string val2 {get;set;}
    }
}