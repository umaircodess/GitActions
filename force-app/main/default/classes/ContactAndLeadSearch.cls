public class ContactAndLeadSearch {
    public static  List<List< sObject>> searchContactsAndLeads(String input){
        List<List<sObject>> result =[FIND :input IN ALL FIELDS RETURNING Offer__c(Name) ];
        return result;
    }

}