@isTest
public with sharing class AddPrimaryContactTest {
     @isTest
    public static void  AddPrimaryContactTest() {
        List<Account> tobeadded = new List<Account>();

        for(Integer i=0; i<50; i++){
            Account nyaccount = new Account(
                Name = 'Test Account' + i,
                BillingState = 'NY'
            );
            tobeadded.add(nyaccount);

        }

         for(Integer i=0; i<50; i++){
            Account caaccount = new Account(
                Name = 'Tests Account' + i,
                BillingState = 'CA'
            );
            tobeadded.add(caaccount);
         }

         insert tobeadded;

   
        Contact contacttobecloned = new Contact(LastName= 'Test Last Name');
    Test.StartTest();
    AddPrimaryContact newinstance = new AddPrimaryContact(contacttobecloned , 'CA');
    Id queueid = System.enqueueJob(newinstance);
    Test.StopTest();
    List<Account> addedaccounts = [Select Id, (Select Id from Contacts) from Account Where BillingState = 'CA'];
    for (Account a : addedaccounts)
    System.assertequals(1 , a.Contacts.size());
    }
}