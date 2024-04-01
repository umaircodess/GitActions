@isTest
public class AccountProcessorTest {
    @isTest
    static void testCountContacts() {
        // Create test data - Accounts with associated Contacts
        List<Account> testAccounts = new List<Account>{
            new Account(Name = 'Test Account 2'),
            new Account(Name = 'Test Account 20')
        };
        List<Database.SaveResult> results = Database.insert (testAccounts, false);
        List<Contact> testContacts = new List<Contact>{
            new Contact(LastName = 'Account 1', AccountId = results[0].getId()),
            new Contact(LastName = 'Account 2',AccountId = results[1].getId()),
            new Contact(LastName = 'Accountt 2',AccountId = results[1].getId())
        };
        insert testContacts;

        // Call the countContacts method with test data
        List<Id> listid = new List<Id>();
        for (Database.SaveResult s : results){
            listid.add(s.getId());
        }
        Test.startTest();
        AccountProcessor.countContacts(listid);
        Test.stopTest();

        // Retrieve updated Account records
        List<Account> updatedAccounts = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id IN :listid];

        // Verify that the Number_Of_Contacts__c field is updated correctly
        System.assertEquals(1, updatedAccounts[0].Number_Of_Contacts__c, 'Incorrect number of contacts for Test Account 1');
        System.assertEquals(2, updatedAccounts[1].Number_Of_Contacts__c, 'Incorrect number of contacts for Test Account 2');
    }
}