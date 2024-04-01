public with sharing class LWCdataclass {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        
            List<Account> acclist = [Select Id,  Name from Account];
            return acclist;

    
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        try {
            List<Contact> conlist = [Select Id, Name from Contact];
            return conlist;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    
    }
}