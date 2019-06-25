public class Utils {
    // Collection of general purpose functions
    
    public static string formatPhone(string phone, string country) {
        // Format a phone number according to the country
        // In general two format may be expected, with and without country code
        // e.g. '11 2222-3333' and +55 11 2222-3333' for Brazil
        
        // If phone does not apply to country (i.e. wrong number of digits),
        // phone is returned
        
        string phonedigits;
        string nondigits = '[^0-9]';
        
        if (phone == null || country == null) return phone;
        if (phone == '' || country == '') return phone;
        
        if (country == 'Brazil') {
            phonedigits = phone.replaceAll(nondigits,'');

            if (phonedigits.length() == 10) 
                return phonedigits.substring(0,2) + ' ' +
                        phonedigits.substring(2,6) + '-' +
                        phonedigits.substring(6,10);

            if (phonedigits.length() == 12) {
                if (phonedigits.substring(0,2) == '55') {
                    return '+55 ' +
                            phonedigits.substring(2,4) + ' ' +
                            phonedigits.substring(4,8) + '-' +
                            phonedigits.substring(8,12);
                }
            }

        } else {
            if (country == 'USA' || country == 'US' || country == 'United States' || country == 'Canada') {
                phonedigits = phone.replaceAll(nondigits,'');
    
                if (phonedigits.length() == 10) 
                    return phonedigits.substring(0,3) + '-' +
                            phonedigits.substring(3,6) + '-' +
                            phonedigits.substring(6,10);

                if (phonedigits.length() == 11) {
                    if (phonedigits.substring(0,1) == '1') {
                        return '+1-' +
                                phonedigits.substring(1,4) + '-' +
                                phonedigits.substring(4,7) + '-' +
                                phonedigits.substring(7,11);
                    }
                }
            }            
        }
        
        // If we get here it is either an error or an unsupported country
        return phone;
    }   
}