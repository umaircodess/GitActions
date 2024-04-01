@isTest
private class AccountManagerTest {
    
    @isTest
    static void testGetAccount() {
        // Insert test account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        // Insert test contacts
        List<Contact> testContacts = new List<Contact>{
            new Contact(AccountId = testAccount.Id, FirstName = 'John', LastName = 'Doe'),
            new Contact(AccountId = testAccount.Id, FirstName = 'Jane', LastName = 'Doe')
        };
        insert testContacts;
        
        RestRequest request = new RestRequest();
        request.requestURI = 'https://brave-narwhal-ec61p8-dev-ed.trailblaze.my.salesforce.com/services/data/sobjects/Accounts/' + testAccount.Id + '/contacts';
        RestContext.request = request;
        
        // Call the method
        Account result = AccountManager.getAccount();
        
        // Verify the result
        System.assertEquals(testAccount.Id, result.Id,'First');
        System.assertEquals(testAccount.Name, result.Name,'Second');
        System.assertEquals(testContacts.size(), result.Contacts.size(),'Third');

    }
}