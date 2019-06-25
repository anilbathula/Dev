trigger erroronbulk on contact (before insert) {
    if(trigger.new.size()!=null &&trigger.new.size()>3 ){
        trigger.new[3].addError('More than 3 records');
    }
}