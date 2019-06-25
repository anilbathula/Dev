Trigger updatecontact on Contact(after insert,after update)
{
case[] cases = new case[0];
user u=[select id from user where Name='Hecthick'];
For(Contact con:trigger.new){
If (con.phone != null)
{

 Case c = new Case();
            c.Subject = 'Remedial Case';
            c.Type = 'Remedial Work';
            c.Status='Web';
            c.ContactId=con.id;
            c.origin='Phone';
            c.ownerid=u.id;
            cases.add(c);

}
}
Insert cases;
}