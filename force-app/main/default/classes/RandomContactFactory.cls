public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts (Integer noOFaccounts, String uniquestring) {
        List<Contact> generatedcontacts = new List<Contact>();

        for (Integer i=0;i<noOFaccounts;i++){
            Contact generatedcontact = new Contact(
                FirstName = 'No.' + i,
                LastName = uniquestring
            ); 
            generatedcontacts.add(generatedcontact);
        }
        return generatedcontacts;
        
    }
}