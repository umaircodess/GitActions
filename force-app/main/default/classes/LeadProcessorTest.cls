@isTest
public with sharing class LeadProcessorTest {
        @isTest
        public static void LeadProcessorTest() {
        List<Lead> testleads = new List<Lead>();

        for (Integer i=0; i<=199; i++){
            Lead newlead = new Lead(
                LastName = 'Test Lead ' + i,
                Company = 'Volkteq',
                Status = 'Open - Not Contacted'
            );
            testleads.add(newlead);
        }
        insert testleads;

        
        Test.startTest();
        LeadProcessor testlead = new LeadProcessor();
        Id batchId = Database.executeBatch(testlead);
        Test.stopTest();

        System.assertEquals(200, [Select count() from Lead where LeadSource = 'Dreamforce']);

    }
}