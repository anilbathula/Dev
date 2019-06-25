trigger tgrPhoneFormat on Account (before update, before insert) {
    // Format phone number before insert/update
    // Validation rule checks if the format is acceptable

    for (Account ac : Trigger.new) {
        ac.phone = Utils.formatPhone(ac.phone, ac.primarycountry__c);
    }
}