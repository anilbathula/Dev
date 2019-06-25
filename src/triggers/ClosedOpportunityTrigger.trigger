trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> taskList = new List<Task>();
    For(Opportunity closed : [SELECT Id, StageName FROM Opportunity WHERE StageName = 'Closed Won' AND Id in: trigger.new]){
            Task t = new Task();
            t.Subject = 'Follow Up Test Task';
            t.WhatId = closed.Id;
            taskList.add(t);
        }
        If(taskList.size()>0){
            insert taskList;
        }   
}