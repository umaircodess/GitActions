public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds) {
        List<Account> accountsToUpdate = [Select Id, Number_Of_Contacts__c,( Select Id from Contacts) from Account where Id in  :accountIds];
        
        
        for (Account acc : accountsToUpdate) {
            Integer noOfcontacts = acc.Contacts.size();
            acc.Number_Of_Contacts__c = noOfcontacts;
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}