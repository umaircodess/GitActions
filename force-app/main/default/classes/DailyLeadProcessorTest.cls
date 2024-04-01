@isTest
private class DailyLeadProcessorTest {

    @isTest
    static void testDailyLeadProcessor() {
        // Insert 200 Lead records with blank LeadSource
        List<Lead> leadsToInsert = new List<Lead>();
         String CRON_EXP = '0 0 0 15 3 ? 2042';
        for (Integer i = 0; i < 200; i++) {
            leadsToInsert.add(new Lead(FirstName = 'Test' + i, Company = 'Lead' + i, LastName = 'Test' + i));
        }
        insert leadsToInsert;

        

        // Wait for the scheduled job to complete
        Test.startTest();
        String jobId = System.schedule('DailyLeadProcessorTest', '0 0 0 * * ?', new DailyLeadProcessor());
        Test.stopTest();

        // Verify that all Lead records were updated correctly
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE Id IN :leadsToInsert];
        for (Lead lead : updatedLeads) {
            System.assertEquals('Dreamforce', lead.LeadSource);
        }
    }
}