@isTest
public with sharing class TestRestrictContactByName {
    @isTest
    public static void TestRestrictContactByName() {

        Contact shouldgothrough = new Contact(LastName= 'Umairson');
        Contact shouldthrowerror = new Contact(LastName= 'INVALIDNAME');
        Test.startTest();
        Database.SaveResult successresult = Database.insert (shouldgothrough, false);
        Database.SaveResult failureresult = Database.insert (shouldthrowerror, false);
        Test.stopTest();


        System.assert(successresult.isSuccess());
        System.assert(!failureresult.isSuccess());
         System.assertEquals( 'The Last Name "INVALIDNAME" is not allowed for DML',failureresult.getErrors()[0].getMessage());


    }
}