trigger test on Event (after update) {
if(trigger.isUpdate) {

List<Event> lstEventsToDelete = new List<Event>();

for(Event e : trigger.new) {
Event eDel = new Event(Id=e.Id);
lstEventsToDelete.add(eDel);
}

delete lstEventsToDelete;

}

}