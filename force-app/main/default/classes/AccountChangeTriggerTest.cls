@isTest
private class AccountChangeTriggerTest {

    @isTest
    static void testTrigger() {
        Test.enableChangeDataCapture();
        // Create a new Account
        Account acc = new Account(Name = 'Test Account 1');
        insert acc;
        Test.getEventBus().deliver();

        Account modifiedacc = new Account(Id = acc.Id, Phone = '1234567890');
        update modifiedacc;

        Test.getEventBus().deliver();
        // Insert the AccountChangeEvent to trigger the trigger
        
        // Verify that the custom field was updated
        Account updatedAccount = [SELECT Id, Name FROM Account WHERE Id = :modifiedacc.Id];
        System.assertEquals('Change Data Capture', updatedAccount.Name);
    }
}
